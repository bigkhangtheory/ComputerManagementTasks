# LocalGroups

The **LocalGroups** DSC Configuration provides a mechanism to manage local groups on the target node.

<br />

## Project Information

|                  |                                                                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/LocalGroups |
| **Dependencies** | [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]                                                           |
| **Resources**    | [xGroup][xGroup]                                                                                                       |

<br />

## Parameters

<br />

### Table. Attributes of `LocalGroups`

| Parameter  | Attribute | DataType        | Description           | Allowed Values |
| :--------- | :-------- | :-------------- | :-------------------- | :------------- |
| **Groups** |           | `[Hashtable[]]` | List of local groups. |                |

---

#### Table. Attributes of `Groups`

| Parameter            | Attribute  | DataType     | Description                                                        | Allowed Values      |
| :------------------- | :--------- | :----------- | :----------------------------------------------------------------- | :------------------ |
| **GroupName**        | *Required* | `[String]`   | The name of the group to create, modify, or remove.                |
| **Ensure**           |            | `[String]`   | Indicates if the group should exist or not. Defaults to `Present`. | `Absent`, `Present` |
| **Description**      |            | `[String]`   | The description the group should have.                             |
| **Members**          |            | `[String[]]` | The members the group should have.                                 |                     |
| **MembersToInclude** |            | `[String]`[] | The members the group should include.                              |                     |
| **MembersToExclude** |            | `[String[]]` | The members the group should exclude.                              |                     |

---

<br />

## Example `LocalGroups`

```yaml
LocalGroups:
  Groups:
    - GroupName: Administrators
      MembersToInclude:
        - Administrator
        - EXAMPLE\Help Desk

    - GroupName:   App_123_Read
      Description: App Reader
      MembersToInclude:
        - User01
        - User02
      MembersToExclude:
        - Administrator
```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  LocalGroups:
    merge_hash: deep
  LocalGroups\Groups:
    merge_baseType_array: Unique
    merge_hash_array: DeepTuple
    merge_options:
      tuple_keys:
        - GroupName

```

<br />

[AccessControlDsc]: https://github.com/mcollera/AccessControlDsc
[Chocolatey]: https://github.com/gaelcolas/Chocolatey
[ComputerManagementDsc]: https://github.com/dsccommunity/ComputerManagementDsc
[xPSDesiredStateConfiguration]: https://github.com/dsccommunity/xPSDesiredStateConfiguration

[xGroup]: https://github.com/dsccommunity/xPSDesiredStateConfiguration

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
[xWindowsFeature]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
