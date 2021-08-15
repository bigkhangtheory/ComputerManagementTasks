<#
    .DESCRIPTION
        This DSC configuration installs or uninstalls Windows roles and/or features on a target node.
    .PARAMETER Roles
        Specifies a list of Windows Roles or Role Services.
    .PARAMETER Features
        Specifies a list of Windows Features.
#>
#Requires -Module xPSDesiredStateConfiguration

configuration WindowsRolesAndFeatures
{
    param
    (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        <#[ValidateScript(
            {
                foreach ($role in $_)
                {
                    if (-not (Get-WindowsFeature -Name $role | Where-Object { $_.FeatureType -eq 'Role' -or $_.FeatureType -eq 'Role Service' }))
                    {
                        throw "ERROR: $role is not a valid Windows Role or Role Service."
                    }
                }
                return $true
            }
        )]#>
        [System.Collections.Hashtable[]]
        $Roles,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        <#[ValidateScript(
            {
                foreach ($feature In $_)
                {
                    if (-not (Get-WindowsFeature -Name $feature | Where-Object { $_.FeatureType -eq 'Feature' }))
                    {
                        throw "ERROR: $role is not a valid Windows Feature."
                    }
                }
                return $true
            }
        )]#>
        [System.Collections.Hashtable[]]
        $Features
    )

    <#
        Import required modules
    #>
    Import-DscResource -ModuleName xPSDesiredStateConfiguration

    <#
        Create DSC resource for all roles
    #>
    foreach ($r in $Roles)
    {
        # remove case sensitivity of ordered Dictionary or Hashtables
        $r = @{ } + $r

        # if not specified, ensure 'Present'
        if ($null -eq $r.Ensure)
        {
            $r.Ensure = 'Present'
        }
        elseif ($r.Ensure -ne 'Present' -and $r.Ensure -ne 'Absent')
        {
            throw "ERROR: Accepted values for the Ensure property are: 'Present' or 'Absent'"
        } #end if

        # create execution name for the resource
        $executionName = "$($r.Name -replace '[-().:\s]', '_')"

        # create DSC resource
        $Splatting = @{
            ResourceName  = 'xWindowsFeature'
            ExecutionName = $executionName
            Properties    = $r
            NoInvoke      = $true
        }
        (Get-DscSplattedResource @Splatting).Invoke($r)
    } #end Roles

    
    <#
        Create DSC resource for all features
    #>
    foreach ($f in $Features)
    {
        # remove case sensitivity of ordered Dictionary or Hashtables
        $f = @{ } + $f

        # if not specified, ensure 'Present'
        if ($null -eq $f.Ensure)
        {
            $f.Ensure = 'Present'
        }
        elseif ($f.Ensure -ne 'Present' -and $f.Ensure -ne 'Absent')
        {
            throw "ERROR: Accepted values for the Ensure property are: 'Present' or 'Absent'"
        } #end if

        # create execution name for the resource
        $executionName = "$($f.Name -replace '[-().:\s]', '_')"

        # create DSC resource
        $Splatting = @{
            ResourceName  = 'xWindowsFeature'
            ExecutionName = $executionName
            Properties    = $f
            NoInvoke      = $true
        }
        (Get-DscSplattedResource @Splatting).Invoke($f)
    } #end Features

}