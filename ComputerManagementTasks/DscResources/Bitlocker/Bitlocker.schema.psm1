<#
    .SYNOPSIS
        The Bitlocker DSC configuration allows you to configure Bitlocker on a single disk, configure a TPM chip, or automatically enable Bitlocker on multiple disks.

    .PARAMETER Tpm
        Specifies an xBLTpm DSC resource, used to initilize a TPM chip on a target node.

    .PARAMETER Disks
        Specifies a list of xBLBitlocker DSC resources to encrypt disks on target nodes.

    .PARAMETER AutoDisks
        Specifies a list of xBLAutoBitlocker DSC resources used to automatically enable Bitlocker on drives of type Fixed or Removable.
#>
#Requires -Module xBitlocker


configuration Bitlocker
{
    param
    (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable]
        $Tpm,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Disks,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $AutoDisks
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName xBitlocker

    # First install the required Bitlocker features
    WindowsFeature BitlockerFeature
    {
        Name                 = 'Bitlocker'
        Ensure               = 'Present'
        IncludeAllSubFeature = $true
    }

    WindowsFeature BitlockerToolsFeature
    {
        Name                 = 'RSAT-Feature-Tools-Bitlocker'
        Ensure               = 'Present'
        IncludeAllSubFeature = $true
    }

    $nextDepends = @( '[WindowsFeature]BitlockerFeature', '[WindowsFeature]BitlockerToolsFeature' )

    if ( $PSBoundParameters.ContainsKey( 'Tpm' ) )
    {
        # specify a key for the resource
        $Tpm.Identity = "Tpm_$("$($node.Name)" -replace '[-().:\s]', '_')"

        # if 'AllowClear' not specified, set defaults
        if ( -not $Tpm.ContainsKey( 'AllowClear' ) )
        {
            $Tpm.AllowClear = $true
        }

        # if 'AllowPhysicalPresence' not specified, set defaults
        if ( -not $Tpm.ContainsKey( 'AllowPhysicalPresent' ) )
        {
            $Tpm.AllowPhysicalPresence = $false
        }

        # if 'AllowImmediateReboot' not specified, set defaults
        if ( -not $Tpm.ContainsKey( 'AllowImmediateReboot' ) )
        {
            $Tpm.AllowImmediateReboot = $false
        }

        # this resource depends on installation of Bitlocker
        $Tpm.DependsOn = $nextDepends

        (Get-DscSplattedResource -ResourceName xBLTpm -ExecutionName $Tpm.Identity -Properties $Tpm -NoInvoke).Invoke($Tpm)

        $dependsOnNext = "[xBLTpm]$($Tpm.Identity)"
    }

    [boolean]$sysDrivePresent = $false

    if ( $PSBoundParameters.ContainsKey( 'Disks' ))
    {
        foreach ($d in $Disks)
        {
            # remove case sensitivity of ordered Dictionary or Hashtable
            $d = @{ } + $d

            # the property 'MountPoint' must be specified, otherwise fail
            if ( -not $d.ContainsKey('MountPoint') )
            {
                throw 'ERROR: The property MountPoint is not found.'
            }

            # the property 'PrimaryProtector' must be specified, otherwise fail
            if ( -not $d.ContainsKey('PrimaryProtector') )
            {
                throw 'ERROR: The property PrimaryProtector is not found.'
            }

            # then, the property 'PrimaryProtector' must be a valid value
            if ( -not ( $d.PrimaryProtector -in 'AdAccountOrGroupProtector', 'PasswordProtector', 'Pin', 'RecoveryKeyProtector', 'RecoveryPasswordProtector', 'StartupKeyProtector', 'TpmProtector' ) )
            {
                throw 'ERROR: The property PrimaryProtector does not contain a valid value.'
            }

            # if 'AllowImmediateReboot' not specified, set the default
            if ( -not $d.ContainsKey('AllowImmediateReboot') )
            {
                $d.AllowImmediateReboot = $false
            }

            # this resource depends on the TPM chip being enabled
            $d.DependsOn = $dependsOnNext

            # create execution name for the resource
            $executionName = "Bitlocker_$("$($d.MountPoint)_$($d.PrimaryProtector)" -replace '[().:\\\s]', '')"

            # create the resource
            (Get-DscSplattedResource -ResourceName xBLBitlocker -ExecutionName $executionName -Properties $d -NoInvoke).Invoke($d)

            # first drive in list is the system drive
            if ( $sysDrivePresent -eq $false )
            {
                $sysDrivePresent = $true
                $dependsOnNext = "[xBLBitlocker]$executionName"
            }
        }
    }

    if ( $null -ne $AutoDisks )
    {
        # system drive encryption is required
        if ( $sysDrivePresent -eq $false )
        {
            throw "ERROR: Before using 'Bitlocker - AutoDisks' the system drive encryption must be specified in the 'Bitlocker - Disks' section."
        }

        foreach ($a in $AutoDisks)
        {
            $a.DependsOn = $dependsOnNext

            $executionName = "Bitlocker_$("$($a.DriveType)_$($a.PrimaryProtector)" -replace '[-().:\s]', '_')"

            (Get-DscSplattedResource -ResourceName xBLAutoBitlocker -ExecutionName $executionName -Properties $a -NoInvoke).Invoke($a)
        }
    }
}
