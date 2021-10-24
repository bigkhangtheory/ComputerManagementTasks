<#
    .DESCRIPTION
        This DSC configuration manages the installation and configuration of Powershell repositories and repository-based Powershell modules on the system.
#>
#Requires -Module PowerShellGet

configuration WindowsPowerShell
{
    param
    (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Repositories,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Modules
    )

    #Import-DscResource -Module PSDesiredStateConfiguration
    Import-DscResource -ModuleName PowerShellGet


    # ensure default PSGallery repository
    PSRepository AddPSGallery
    {
        Name                      = 'PSGallery'
        SourceLocation            = 'https://www.powershellgallery.com/api/v2'
        InstallationPolicy        = 'Trusted'
        PackageManagementProvider = 'Nuget'
        PublishLocation           = 'https://www.powershellgallery.com/api/v2/package/'
        ScriptSourceLocation      = 'https://www.powershellgallery.com/api/v2/items/psscript'
        ScriptPublishLocation     = 'https://www.powershellgallery.com/api/v2/package/'
        Ensure                    = 'Present'
    }
    $dependsOnPSGallery = '[PSRepository]AddPSGallery'

    # Add, remove or update PSRepositories for the system context.
    if ($Repositories)
    {
        # instantiate array to store DSC resource dependency calls
        $dependsOnPsRepository = New-Object -TypeName System.Collections.ArrayList

        foreach ($r in $Repositories)
        {
            # repository must have a name, otherwise fail and exit
            if ($null -eq $r.Name)
            {
                throw 'ERROR: The PS Repository must be provided with a name.'
            }
            elseif ($r.Name -eq 'PSGallery')
            {
                throw 'ERROR: PSGallery is already defined.'
            }

            # remove case sensitivity of ordered Dictionary or Hashtables
            $r = @{ } + $r

            # if not InstallationPolicy not defined, set to 'Trusted'
            if (-not $r.ContainsKey('InstallationPolicy'))
            {
                $r.InstallationPolicy = 'Trusted'
            }

            # if not specified, ensure 'Present'
            if (-not $r.ContainsKey('Ensure'))
            {
                $r.Ensure = 'Present'
            }

            # set execution name for the DSC resource
            $executionName = "$($r.Name -replace '[-().:\s]', '_')"

            # create DSC configuration for PS Repository
            $Splatting = @{
                ResourceName  = 'PSRepository'
                ExecutionName = $executionName
                Properties    = $r
                NoInvoke      = $true
            }
            (Get-DscSplattedResource @Splatting).Invoke($r)

            # add resource depencency
            $dependsOnPsRepository += "[PSRepository]$executionName"
        }
    } #end Repositories


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

            # if repository is not specified, set the default PSGallery
            if (-not $m.ContainsKey('Repository'))
            {
                $m.Repository = 'PSGallery'
            }

            # if not InstallationPolicy not defined, set to 'Trusted'
            if (-not $m.ContainsKey('InstallationPolicy'))
            {
                $m.InstallationPolicy = 'Trusted'
            }

            # if not specified, do not allow clobber
            if (-not $m.ContainsKey('AllowClobber'))
            {
                $m.AllowClobber = $false
            }

            # if not specified, do not allow skipping of publisher's check
            if (-not $m.ContainsKey('SkipPublisherCheck'))
            {
                $m.SkipPublisherCheck = $false
            }

            # if not specified, ensure 'Present'
            if (-not $m.ContainsKey('Ensure'))
            {
                $m.Ensure = 'Present'
            }

            # set dependency resource
            if ($m.Repository -eq 'PSGallery')
            {
                $m.DependsOn = $dependsOnPSGallery
            }
            else
            {
                $m.DependsOn = $dependsOnPsRepository
            }

            # set version
            if (-not $m.ContainsKey('RequiredVersion'))
            {
                $version = 'latest'
            }
            else
            {
                $version = $m.RequiredVersion
            }

            # set execution name for the DSC resource
            $executionName = "$($m.Name -replace '[-().:\s]', '_')_$($version -replace '[-().:\s]', '_')"

            # create DSC resource
            $Splatting = @{
                ResourceName  = 'PSModule'
                ExecutionName = $executionName
                Properties    = $m
                NoInvoke      = $true
            }
            (Get-DscSplattedResource @Splatting).Invoke($m)
        }
    } #end module
} #end configuration