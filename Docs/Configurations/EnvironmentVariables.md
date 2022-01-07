# EnvironmentVariables

The **EnvironmentVariables** DSC configuration provides a mechanism to configure and manage environment variables for a machine or process.

<br />

## Project Information

|                  |                                                                                                                                 |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/EnvironmentVariables |
| **Dependencies** | [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]                                                                    |
| **Resources**    | [xEnvironment][xEnvironment]                                                                                                    |

<br />

## Parameters

<br />

### Table. Attributes of `EnvironmentVariables`

| Parameter     | Attribute | DataType        | Description                                                   | Allowed Values |
| :------------ | :-------- | :-------------- | :------------------------------------------------------------ | :------------- |
| **Variables** |           | `[Hashtable[]]` | A list of environment variables to create on the target node. |                |

---

#### Table. Attributes of `Variables`

| Parameter  | Attribute | DataType     | Description                                                                                                                                                                                                                                                          | Allowed Values                  |
| :--------- | :-------- | :----------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------ |
| **Name**   |           | `[string]`   | The name of the environment variable for which you want to ensure a specific state.                                                                                                                                                                                  |                                 |
| **Path**   |           | `[bool]`     | Indicates whether or not the environment variable is a path variable. The value provided will be appended to or removed from the existing value. When configured as a Path variable, multiple entries separated by semicolons does not affect other Path entries.    |                                 |
| **Target** |           | `[string[]]` | Indicates the target where the environment variable should be set.                                                                                                                                                                                                   | `Machine`, `Process`            |
| **Value**  |           | `[string]`   | The desired value for the environment variable. Defaults to empty string which either indicates that the variable should be removed entirely or that the value does not matter when testing its existence. Multiple entries can be entered, delimited by semicolons. |                                 |
| **Ensure** |           | `[string]`   | Specifies if the environment variable should exist.                                                                                                                                                                                                                  | `Present` *(Default)*, `Absent` |

---

<br />

## Example `EnvironmentVariables`

```yaml
EnvironmentVariables:
  Variables:
    - Name: LCM_CONTROLLER
      Target: Machine
      Value: C:\ProgramData\Dsc\LcmController

    - Name: ChocolateyToolsLocation
      Target: Machine
      Value: C:\Tools

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  EnvironmentVariables:
    merge_hash: deep
  EnvironmentVariables\Variables:
    merge_baseType_array: Unique
    merge_hash_array: DeepTuple
    merge_options:
      tuple_keys:
        - Name
        - Target

```

<br />

[AccessControlDsc]: https://github.com/mcollera/AccessControlDsc
[Chocolatey]: https://github.com/gaelcolas/Chocolatey
[ComputerManagementDsc]: https://github.com/dsccommunity/ComputerManagementDsc


[AccessControlResourceHelper]: https://github.com/mcollera/AccessControlDsc
[ActiveDirectoryAccessEntry]: https://github.com/mcollera/AccessControlDsc
[ActiveDirectoryAuditRuleEntry]: https://github.com/mcollera/AccessControlDsc
[FileSystemAuditRuleEntry]: https://github.com/mcollera/AccessControlDsc
[NTFSAccessEntry]: https://github.com/mcollera/AccessControlDsc
[RegistryAccessEntry]: https://github.com/mcollera/AccessControlDsc

[ChocolateyFeature]: https://github.com/gaelcolas/Chocolatey
[ChocolateyPackage]: https://github.com/gaelcolas/Chocolatey
[ChocolateyPin]: https://github.com/gaelcolas/Chocolatey
[ChocolateySetting]: https://github.com/gaelcolas/Chocolatey
[ChocolateySoftware]: https://github.com/gaelcolas/Chocolatey
[ChocolateySource]: https://github.com/gaelcolas/Chocolatey

[Computer]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/Computer
[IEEnhancedSecurityConfiguration]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/IEEnhancedSecurityConfiguration
[OfflineDomainJoin]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/OfflineDomainJoin
[PendingReboot]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/PendingReboot
[PowerPlan]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/PowerPlan
[PowerShellExecutionPolicy]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/PowerShellExecutionPolicy
[RemoteDesktopAdmin]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/RemoteDesktopAdmin
[ScheduledTask]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/ScheduledTask
[SmbServerConfiguration]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/SmbServerConfiguration
[SmbShare]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/SmbShare
[SystemLocale]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/SystemLocale
[TimeZone]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/TimeZone
[UserAccountControl]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/UserAccountControl
[VirtualMemory]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/VirtualMemory
[WindowsCapability]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/WindowsCapability
[WindowsEventLog]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/WindowsEventLog

[xPSDesiredStateConfiguration]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xArchive]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xDSCWebService]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xEnvironment]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xFileUpload]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xGroup]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xGroupSet]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xMsiPackage]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xPackage]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xProcessSet]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xPSEndpoint]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xRegistry]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xRemoteFile]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xScript]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xService]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xServiceSet]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xUser]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsFeature]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsFeatureSet]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsOptionalFeature]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsOptionalFeatureSet]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsPackageCab]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsProcess]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
