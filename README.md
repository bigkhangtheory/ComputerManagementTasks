# ComputerManagementTasks

This repo provides a structured project for building re-usable and composable **DSC Configurations** _(DSC Composite Resources)_ used to manage and configure Windows computer systems.

For information about the scripts that perform work described by Configurations, see the GitHub repo for [DSC Resources](http://github.com/powershell/dscresources).

---

## Project Configurations *(Composite Resources)*

| **Configurations**                                                            | **Description**                                                                                                                                      | **Status**  |
| :---------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------- | :---------: |
| [Bitlocker](./Docs/Configurations/Bitlocker.md)                               | Configures Bitlocker on a single disk, configure a TPM chip, or automatically enable Bitlocker on multiple disks.                                    | *Published* |
| [ChocolateyPackageManager](./Docs/Configurations/ChocolateyPackageManager.md) | Chocolatey DSC Resources for use with internal packages and the community package repository.                                                        | *Published* |
| [ComputerSettings](./Docs/Configurations/ComputerSettings.md)                 | Configures a computer by changing its name and description and modifying its Active Directory domain or workgroup membership.                        | *Published* |
| [Disks](./Docs/Configurations/Disks.md)                                       | Used to initialize, format and mount the partition/volume as a drive letter.                                                                         | *Published* |
| [EnvironmentVariables](./Docs/Configurations/EnvironmentVariables.md)         | Used to create and managed System Environment variables on target nodes.                                                                             | *Published* |
| [FilesAndFolders](./Docs/Configurations/FilesAndFolders.md)                   | Manages the creation and content of files and folders on the target node.                                                                            | *Published* |
| [FirewallProfiles](./Docs/Configurations/FirewallProfiles.md)                 | Configures a node's private, public or domain firewall profile.                                                                                      | *Published* |
| [FirewallRulesInbound](./Docs/Configurations/FirewallRulesInbound.md)         | This configuration is used to control inbound firewall rules for a node.                                                                             | *Published* |
| [IpConfiguration](./Docs/Configurations/IpConfiguration.md)                   | This module is a re-usable DSC Configuration for managing IpConfiguration on computer systems                                                        | *Published* |
| [LocalGroups](./Docs/Configurations/LocalGroups.md)                           | Manages local groups and memberships on a target node.                                                                                               | *Published* |
| [MountImages](./Docs/Configurations/MountImages.md)                           | Used to mount or unmount an ISO/VHD disk image.                                                                                                      | *Published* |
| [Network](./Docs/Configurations/Network.md)                                   | Manages Network Connection Profiles and MTU sizes on a target nodes Network Adapters.                                                                | *Published* |
| [NetworkIpConfiguration](./Docs/Configurations/NetworkIpConfiguration.md)     | Sets the IP configuration and network routes for Network Adapters on target nodes.                                                                   | *Published* |
| [NtfsAcls](./Docs/Configurations/NtfsAcls.md)                                 | Manages access entries for NTFS files and directories                                                                                                | *Published* |
| [OpticalDiskDrives](./Docs/Configurations/OpticalDiskDrives.md)               | Used to set the drive letter of an optical disk drive (e.g. a CDROM or DVD drive).                                                                   | *Published* |
| [RegistryAcls](./Docs/Configurations/RegistryAcls.md)                         | Manages access entries for Registry objects.                                                                                                         | *Published* |
| [RegistryPolicies](./Docs/Configurations/RegistryPolicies.md)                 | Used to apply and manage local group policies by modifying the respective .pol file.                                                                 | *Published* |
| [RegistryValues](./Docs/Configurations/RegistryValues.md)                     | Manages registry keys and values on a target node.                                                                                                   | *Published* |
| [RemoteDesktopSettings](./Docs/Configurations/RemoteDesktopSettings.md)       | Manages the remote desktop administration settings on a computer.                                                                                    | *Published* |
| [RestartSystem](./Docs/Configurations/RestartSystem.md)                       | Manages forced or pending system reboots.                                                                                                            | *Published* |
| [ScheduledTasks](./Docs/Configurations/ScheduledTasks.md)                     | Used to define basic run once or recurring scheduled tasks on the local computer and can also be used to delete or disable built-in scheduled tasks. | *Published* |
| [Scripts](./Docs/Configurations/Scripts.md)                                   | Provides a mechanism to run PowerShell script blocks on a target node.                                                                               | *Published* |
| [ShortcutLinks](./Docs/Configurations/ShortcutLinks.md)                       | Used to create and manage shortcut link files on a target node.                                                                                      | *Published* |
| [SmbFileShares](./Docs/Configurations/SmbFileShares.md)                       | Used to manage SMB Server Settings, SMB shares and access permissions to SMB shares.                                                                 | *Published* |
| [SoftwarePackages](./Docs/Configurations/SoftwarePackages.md)                 | Installs software packages.                                                                                                                          | *Published* |
| [WebBrowser](./Docs/Configurations/WebBrowser.md)                             | Used setup global WebBrowser settings.                                                                                                               | *Published* |
| [WindowsEventForwarding](./Docs/Configurations/WindowsEventForwarding.md)     | Configures a server to become an Event Collector role and create complex Subscriptions.                                                              | *Published* |
| [WindowsEventLogs](./Docs/Configurations/WindowsEventLogs.md)                 | Allows configuration of a specified Windows Event Log.                                                                                               | *Published* |
| [WindowsFeatures](./Docs/Configurations/WindowsFeatures.md)                   | This module is a re-usable DSC Configuration for managing WindowsFeatures on computer systems                                                        | *Published* |
| [WindowsLicensing](./Docs/Configurations/WindowsLicensing.md)                 | PowerShell DSC Resource to set Windows product key.                                                                                                  | *Published* |
| [WindowsOptionalFeatures](./Docs/Configurations/WindowsOptionalFeatures.md)   | Installs Windows Optional Features on a Windows Client OS.                                                                                           | *Published* |
| [WindowsRolesAndFeatures](./Docs/Configurations/WindowsRolesAndFeatures.md)   | This DSC configuration installs or uninstalls Windows roles or features on a target node.                                                            | *Published* |
| [WindowsServices](./Docs/Configurations/WindowsServices.md)                   | Configures Windows services and startup requirements on a target node.                                                                               | *Published* |
| [XmlContent](./Docs/Configurations/XmlContent.md)                             | This module is a re-usable DSC Configuration for managing XmlContent on computer systems                                                             | *Published* |

---

## Project Objectives

The objective is to:

- Simplify the way to consume a shared configuration
- Allow direct re-use in new environment *(no copy-paste/modification of DSC Config or data)*
- Reduce the _cost_ of sharing, by automating the scaffolding (plaster), testing (pester, PSSA, Integration tests.md), building (Composite Resource), publishing to our internal [Powershell repository](https://repo.windows.mapcom.local/nuget/powershell/)
- Ensuring high quality, by allowing the use of a testing harness fit for TDD
- Allow Build tools, tasks and scripts to be more standardized and re-usable
- Ensure quick and simple iterations during the development process

To achieve the objectives:

- Provide a familiar scaffolding structure similar to PowerShell modules
- Create a model that can be self contained (or bootstrap itself with minimum dependencies.md)
- Be CI/CD tool independant
- Declare Dependencies in Module Manifest for Pulling requirements from a gallery
- Embed default Configuration Data alongside configs
- Provides guidelines, conventions and design patterns (i.e. re-using Configuration Data)

---

## Project Guidelines

The [DSC Resource repository](http://github.com/powershell/dscresources) includes guidance on authoring that is applicable to configurations as well.

For more information, visit the links below:

- [Best practices](https://github.com/PowerShell/DscResources/blob/master/BestPractices)
- [Style guidelines](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines)
- [Maintainers](https://github.com/PowerShell/DscResources/blob/master/Maintainers)

### Project Structure

```
CompositeResourceName
│   .gitignore
│   .gitlab-ci.yml
│   Build.ps1
│   CompositeResourceName.PSDeploy.ps1
│   PSDepend.Build.psd1
│   README.md
│
├───Build
│   ├───BuildHelpers
│   │       Invoke-InternalPSDepend.ps1
│   │       Resolve-Dependency.ps1
│   │       Set-PSModulePath.ps1
│   └───Tasks
│           CleanBuildOutput.ps1
│           CopyModule.ps1
│           Deploy.ps1
│           DownloadDscResources.ps1
│           Init.ps1
│           IntegrationTests.ps1
│           SetPsModulePath.ps1
│           TestReleaseAcceptance.ps1
│
├───BuildOutput
│   │   localhost_Configuration1.mof
│   │   localhost_Configuration2.mof
│   │   localhost_Configuration3.mof
│   │   localhost_ConfigurationN.mof
│   │
│   ├───Modules
│   │
│   └───Pester
│           IntegrationTestResults.xml
│
├───Docs
│       Configuration1.md
│       Configuration2.md
│       Configuration3.md
│       ConfigurationN.md
│
└───CompositeResourceName
    │   CompositeResourceName.psd1
    │
    ├───DscResources
    │   ├───Configuration1
    │   │       Configuration1.psd1
    │   │       Configuration1.psm1
    │   │
    │   ├───Configuration2
    │   │       Configuration2.psd1
    │   │       Configuration2.psm1
    │   │
    │   ├───Configuration3
    │   │       Configuration3.psd1
    │   │       Configuration3.psm1
    │   │
    │   ├───ConfigurationN
    │   │       ConfigurationN.psd1
    │   │       ConfigurationN.psm1
    │   ...
    │
    └───Tests
        ├───Acceptance
        │       01 Gallery Available.Tests.ps1
        │       02 HasDscResources.Tests.ps1
        │       03 CanBeUninstalled.Tests.ps1
        │
        └───Integration
            │   01 DscResources.Tests.ps1
            │   02.Final.Tests.ps1
            │
            └───Assets
                │   AllNodes.yml
                │   Datum.yml
                │   TestHelpers.psm1
                │
                └───Config
                        Configuration1.yml
                        Configuration2.yml
                        Configuration3.yml
                        ConfigurationN.yml
```

The Composite Resource should be self contained, but will require files for building/testing or development.

The repository will hence need some project files on top of the files required for functionality.

Adopting the 2 layers structure like so:

```
+-- CompositeResourceName\
    +-- CompositeResourceName\
```

Allows to place Project files like build, CI configs and so on at the top level, and everything under the second level are the files that need to be shared and will be uploaded to the PSGallery.

Within that second layer, the Configuration looks like a standard module with some specificities.

#### Root Tree

The root of the tree would be similar to a module root tree where you have supporting files for, say, the CI/CD integration.

In this example, I'm illustrating the idea with:

- A `Build.ps1` that defines the build workflow by composing tasks (see [SampleModule](https://github.com/gaelcolas/SampleModule))
- A `Build/` folder, which includes the minimum tasks to bootstrap + custom ones
- the `.gitignore` where folders like BuildOutput or kitchen specific files are added (`module/`)
- The [PSDepend.Build.psd1](./PSDepend.Build.ps1), so that the build process can use [PSDepend](https://github.com/RamblingCookieMonster/PSDepend/) to pull any prerequisites to build this project
- The Gitlab runner configuration file

### Configuration Module Folder

Very similar to a PowerShell Module folder, the Shared configuration re-use the same principles and techniques.

The re-usable configuration itself is declared in the ps1, the metadata and dependencies in the psd1 to leverage all the goodies of module management, then we have some assets ordered in folders:

- ConfigurationData: the default/example configuration data, organised in test suite/scenarios
- Test Acceptance & Integration: the pester tests used to validate the configuration, per test suite/scenario
- the examples of re-using that shared configuration, per test suite/scenario