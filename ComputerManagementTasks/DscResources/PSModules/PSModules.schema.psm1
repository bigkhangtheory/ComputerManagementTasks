<#
    .DESCRIPTION
        This DSC configuration manages the installation and configuration of Powershell repositories and repository-based Powershell modules on the system.
#>
#Requires -Module PSModulesDsc

configuration PSModules
{
    param
    (
        [Parameter()]
        [System.Collections.Hashtable[]]
        $Modules

        <#
        [Parameter()]
        [System.Collections.Hashtable[]]
        $Repositories
        #>
    )

    Import-DscResource -Module PSDesiredStateConfiguration
    Import-DscResource -ModuleName PSModulesDsc


    <#
    # Add, remove or update PSRepositories for the system context.
    if ($null -ne $Repositories)
    {
        foreach ($r in $Repositories)
        {
            # repository must have a name, otherwise fail and exit
            if ($null -eq $r.Name)
            {
                throw 'ERROR: The PS Repository must be provided with a name.'
            }

            # InstallationPolicy must be either 'Trusted' or 'Untrusted'
            if (-not ($r.Installation -eq 'Trusted' -or $r.InstallationPolicy -eq 'Untrusted'))
            {
                throw "ERROR: The Installation Policy must be either 'Trusted' or 'Untrusted'."
            }

            # remove case sensitivity of ordered Dictionary or Hashtables
            $r = @{ } + $r

            # if not specified, ensure 'Present'
            if (-not $r.ContainsKey('Ensure'))
            {
                $r.Ensure = 'Present'
            }

            # set execution name for the DSC resource
            $executionName = "$($r.Name -replace '[-().:\s]', '_')"

            # create DSC configuration for PS Repository
            PowershellRepository "$executionName"
            {
                Name               = $r.Name 
                InstallationPolicy = $r.InstallationPolicy
                SourceLocation     = $r.SourceLocation
                Ensure             = $r.Ensure
            }
        }
    }
    #>

    # Add or remove repository-based Powershell modules from the system.
    if ($Modules)
    {
        foreach ($m in $Modules)
        {
            # module must have a name, otherwise fail and exit
            if ($null -eq $m.Name)
            {
                throw 'ERROR: The PS Module must be provided with a name.'
            }
            
            # remove case sensitivity of ordered Dictionary or Hashtables
            $m = @{ } + $m
            
            # if not specified, ensure 'Present'
            if (-not $m.ContainsKey('Ensure'))
            {
                $m.Ensure = 'Present'
            }
            
            # set execution name for the DSC resource
            $executionName = "$($m.Name -replace '[-().:\s]', '_')"

            $Splatting = @{
                ResourceName  = 'PowershellModule'
                ExecutionName = $executionName
                Properties    = $m
                NoInvoke      = $true
            }
            (Get-DscSplattedResource @Splatting).Invoke($m)
        }
    }
}