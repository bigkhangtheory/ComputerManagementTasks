<#
    .SYNOPSIS
        The DiskAccessPaths DSC configuration is used to initialize, format and mount the partition/volume to a folder access path.
#>
#Requires -Module StorageDsc


configuration DiskAccessPaths
{
    param
    (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Paths
    )

    <#
        Import required modules
    #>
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName StorageDsc


    <#
        Enumerate all disk access paths
    #>
    if ($PSBoundParameters.ContainsKey('Paths'))
    {
        # initlize index counter for same DiskIds
        $index = 0

        foreach ($p in $Paths)
        {
            # remove case sensitivity of ordered Dictionary or Hashtables
            $p = @{} + $p

            # the property 'AccessPath' must be specified, otherise fail
            if ( -not $p.ContainsKey('AccessPath') )
            {
                throw 'ERROR: The property AccessPath is not found.'
            }
            else
            {
                # ensure that the access path directory exists
                $executionName = "Directory_$("$($p.AccessPath)" -replace '[-().:\\\s]', '_')"

                File $executionName
                {
                    DestinationPath = $p.AccessPath
                    Type            = 'Directory'
                    Ensure          = 'Present'
                }

                $dependsOnAccessPath = "[File]$executionName"
            }


            # if 'DiskIdType' not specified, set default
            if ( -not $p.ContainsKey('DiskIdType') )
            {
                $p.DiskIdType = 'Number'
            }


            # the property 'DiskId' must be specified, otherise fail
            if ( -not $p.ContainsKey('DiskId') )
            {
                throw 'ERROR: The property DiskId is not found.'
            }
            else
            {
                # the property 'DiskIdType' must be valid value
                if ( -not ($p.DiskIdType -in 'Number', 'UniqueId', 'Guid', 'Location') )
                {
                    throw "ERROR: The property DiskIdType does not contain a valid value. Specify either 'Number', 'UniqueId', 'Guid', or 'Location'."
                }

                <#
                    .NOTES
                    Possible bug with DSC resource 'WaitForDisk'

                # at this point, wait for the disk to become available
                $executionName = "Wait_For_Disk_$("$($p.DiskId)_$($index)" -replace '[-().:\s]', '_')"
                WaitForDisk $executionName
                {
                    DiskId     = $p.DiskId
                    DiskIdType = $p.DiskIdType
                }
                $dependsOnWaitForDisk = "[WaitForDisk]$executionName'"
                #>
            }

            # if size is specified, convert to Int64
            if ( $p.ContainsKey('Size') )
            {
                $p.Size = [UInt64]$p.Size
            }

            # if 'NoDefaultDriveLetter' not specified, set default
            if ( -not $p.ContainsKey('NoDefaultDriveLetter') )
            {
                $p.NoDefaultDriveLetter = $true
            }

            # if 'FSFormat' not specified, set defaults
            if ( -not $p.ContainsKey('FSFormat') )
            {
                $p.FSFormat = 'NTFS'
            }

            # this resource depends on existing access path and available disk
            $p.DependsOn = $dependsOnAccessPath

            # create execution name for the resource
            $executionName = "$("$($p.AccessPath)_$($p.DiskId)" -replace '[-().:\\\s]', '_')"

            # create DSC resource
            $Splatting = @{
                ResourceName  = 'DiskAccessPath'
                ExecutionName = $executionName
                Properties    = $p
                NoInvoke      = $true
            }
            (Get-DscSplattedResource @Splatting).Invoke($p)

            # increment DiskId index
            $index++
        } #end foreach
    } #end if
} #end configuration