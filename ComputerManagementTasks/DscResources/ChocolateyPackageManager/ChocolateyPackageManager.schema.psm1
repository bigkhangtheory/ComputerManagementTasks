<#
    .DESCRIPTION
        Chocolatey DSC Resources for use with internal packages and the community package repository.
    .LINK
        http://chocolatey.org/
#>
#Requires -Modules cChoco

configuration ChocolateyPackageManager
{
    param (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $InstallDir = 'C:\ProgramData\chocolatey\',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $InstallScriptUrl = 'https://chocolatey.org/install.ps1',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Configs,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Features,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Sources,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Packages
    )

    Import-DscResource -Module PSDesiredStateConfiguration
    Import-DscResource -ModuleName cChoco


    # ensure Chocolatey installation directory exists
    File ChocoInstallDir
    {
        DestinationPath = $InstallDir
        Type            = 'Directory'
        Ensure          = 'Present'
    }

    # create Chocolatey installation
    cChocoInstaller InstallChocolatey
    {
        InstallDir            = $InstallDir
        ChocoInstallScriptUrl = $InstallScriptUrl
        DependsOn             = '[File]ChocoInstallDir'
    }

    
    # create Chocolatey configurations
    if ($Configs)
    {
        foreach ($c in $Configs)
        {
            # remove case sensitivity for ordered Dictionary or Hashtables
            $c = @{ } + $c

            # create execution name for DSC resource
            $executionName = "$($c.ConfigName)"

            # if not specified, ensure 'Present'
            if ($null -eq $c.Ensure)
            {
                $c.Ensure = 'Present'
            }

            # this resource depends on a chocolatey installation
            $c.DependsOn = '[cChocoInstaller]InstallChocolatey'
            
            # create DSC resource for Chocolatey config
            $Splatting = @{
                ResourceName  = 'cChocoConfig'
                ExecutionName = $executionName
                Properties    = $c
                NoInvoke      = $true
            }
            (Get-DscSplattedResource @Splatting).Invoke($c)
        }
    }


    # create Chocolatey features
    if ($Features)
    {
        foreach ($f in $features)
        {
            # remove case sensitivity for ordered Dictionary or Hashtables
            $f = @{ } + $f

            # create execution name for DSC resource
            $executionName = "$($f.FeatureName)"
            
            # if not specified, ensure 'Present'
            if ($null -eq $f.Ensure)
            {
                $f.Ensure = 'Present'
            }
            
            # this resource depends on a chocolatey installation
            $f.DependsOn = '[cChocoInstaller]InstallChocolatey'

            # create DSC resource for Chocolatey feature
            $Splatting = @{
                ResourceName  = 'cChocoFeature'
                ExecutionName = $executionName
                Properties    = $f
                NoInvoke      = $true
            }
            (Get-DscSplattedResource @Splatting).Invoke($f)
        }
    }


    # create Chocolatey sources
    if ($Sources)
    {
        # create collection for Chocolatey sources dependency name
        $dependsOnChocoSources = New-Object -TypeName System.Collections.ArrayList

        foreach ($s in $Sources)
        {
            # remove case sensitivity for ordered Dictionary or Hashtables
            $s = @{ } + $s

            # create execution name for DSC resource
            $executionName = "$($s.Name)"
                        
            # if not specified, ensure 'Present'
            if ($null -eq $s.Ensure)
            {
                $s.Ensure = 'Present'
            }
                        
            # this resource depends on a chocolatey installation
            $s.DependsOn = '[cChocoInstaller]InstallChocolatey'
            
            # create DSC resource for Chocolatey source
            $Splatting = @{
                ResourceName  = 'cChocoSource'
                ExecutionName = $executionName
                Properties    = $s
                NoInvoke      = $true
            }
            (Get-DscSplattedResource @Splatting).Invoke($s)

            # stack Chocolatey source dependencies
            $dependsOnChocoSources.Add("[cChocoSource]$executionName")
        }
    }


    # create Chocolatey packages
    if ($Packages)
    {
        foreach ($p in $Packages)
        {
            # remove case sensitivity for ordered Dictionary or Hashtables
            $p = @{ } + $p

            # create execution name for DSC resource
            $executionName = "$($p.Name -replace '[-().:\s]', '_')"
                        
            # if not specified, ensure 'Present'
            if ($null -eq $p.Ensure)
            {
                $p.Ensure = 'Present'
            }
            
            # this resource depends on a chocolatey installation
            $p.DependsOn = $dependsOnChocoSources
            
            # create DSC resource for Chocolatey source
            $Splatting = @{
                ResourceName  = 'cChocoPackageInstaller'
                ExecutionName = $executionName
                Properties    = $p
                NoInvoke      = $true
            }
            (Get-DscSplattedResource @Splatting).Invoke($p)
        }    
    }
}