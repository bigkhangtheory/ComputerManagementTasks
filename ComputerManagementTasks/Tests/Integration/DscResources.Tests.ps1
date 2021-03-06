Import-Module -Name $PSScriptRoot\Assets\TestHelpers.psm1

$dscResources = Get-DscResource -Module ComputerManagementTasks
Init

$skippedDscResources = 'ConfigurationManagerDeployment'

foreach ($dscResourceName in $dscResources.Name)
{
    Describe "'$dscResourceName' DSC Resource compiles" -Tags FunctionalQuality {

        BeforeAll {
            $tempExists = Test-Path -Path C:\Temp
            if (-not $tempExists)
            {
                New-Item -Path C:\Temp -ItemType Directory | Out-Null
            }
            @'
function f1 {
    Get-Date
}
f1
'@ | Set-Content -Path C:\Temp\JeaRoleTest.ps1 -Force
        }

        It "'$dscResourceName' compiles" {

            if ($dscResourceName -in $skippedDscResources)
            {
                Set-ItResult -Skipped -Because "Tests for '$dscResourceName' are skipped"
            }

            $nodeData = @{
                NodeName                    = "localhost_$dscResourceName"
                PSDscAllowPlainTextPassword = $true
                PSDscAllowDomainUser        = $true
            }
            $configurationData.AllNodes += $nodeData

            configuration "Config_$dscResourceName" {

                Import-DscResource -ModuleName ComputerManagementTasks

                node "localhost_$dscResourceName" {

                    $data = $configurationData.Datum.Config."$dscResourceName"
                    if (-not $data)
                    {
                        $data = @{}
                    }
                    (Get-DscSplattedResource -ResourceName $dscResourceName -ExecutionName $dscResourceName -Properties $data -NoInvoke).Invoke($data)
                }
            }

            { & "Config_$dscResourceName" -ConfigurationData $configurationData -OutputPath $env:BHBuildOutput -ErrorAction Stop } | Should -Not -Throw
        }

        It "'$dscResourceName' should have created a mof file" {
            if ($dscResourceName -in $skippedDscResources)
            {
                Set-ItResult -Skipped -Because "Tests for '$dscResourceName' are skipped"
            }

            $mofFile = Get-Item -Path "$($env:BHBuildOutput)\localhost_$dscResourceName.mof" -ErrorAction SilentlyContinue
            $mofFile | Should -BeOfType System.IO.FileInfo
        }

        AfterAll {
            Remove-Item -Path C:\Temp\JeaRoleTest.ps1
            if (-not $tempExists)
            {
                Remove-Item -Path C:\Temp
            }
        }
    }
}

Describe 'Final tests' -Tags FunctionalQuality {
    BeforeAll {
        $compositeResouces = Get-DscResource -Module ComputerManagementTasks
        Write-Host "Number of composite resources: $($compositeResouces.Count)"
        $compositeResouces = $compositeResouces | Where-Object Name -NotIn $skippedDscResources
        Write-Host "Number of composite resources (considering 'skippedDscResources'): $($compositeResouces.Count)"
    }

    It 'Every composite resource has compiled' {

        $mofFiles = Get-ChildItem -Path $env:BHBuildOutput -Filter *.mof
        Write-Host "Number of compiled MOF files: $($mofFiles.Count)"
        $compositeResouces.Count | Should -Be $mofFiles.Count

    }

    It 'Composite resource folder count matches composite resource count' {

        $compositeResouceFolders = dir -Path "$env:BHBuildOutput\Modules\$env:BHProjectName\DscResources"
        Write-Host "Number of composite resource folders: $($compositeResouceFolders.Count)"
        $compositeResouceFolders = $compositeResouceFolders | Where-Object Name -NotIn $skippedDscResources
        Write-Host "Number of composite resource folders (considering 'skippedDscResources'): $($compositeResouceFolders.Count)"
        Write-Host "Number of composite resources: $($compositeResouces.Count)"
        Write-Host (Compare-Object -ReferenceObject $compositeResouceFolders.Name -DifferenceObject $compositeResouces.Name | Out-String) -ForegroundColor Yellow

        $compositeResouces.Count | Should -Be $compositeResouceFolders.Count
    }
}
