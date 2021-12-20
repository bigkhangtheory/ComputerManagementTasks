# RegistryValues



<br />

## Project Information

|                  |                                                                                                                          |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/RegistryValues |
| **Dependencies** | [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]                                 |
| **Resources**    | [xWindowsFeature][xWindowsFeature]                                                               |

<br />

## Parameters

<br />

### Table. Attributes of `RegistryValues`

| Parameter              | Attribute  | DataType        | Description                                                                                         | Allowed Values |
| :--------------------- | :--------- | :-------------- | :-------------------------------------------------------------------------------------------------- | :------------- |

---

#### Table. Attributes of ``

| Parameter              | Attribute  | DataType        | Description                                                                                         | Allowed Values |
| :--------------------- | :--------- | :-------------- | :-------------------------------------------------------------------------------------------------- | :------------- |

---

<br />

## Example `RegistryValues`

```yaml
RegistryValues:
  Values:
    - Key: HKLM:\SOFTWARE\Microsoft\Rpc\Internet
      ValueName: Ports
      ValueData: 60000-60100
      ValueType: MultiString
      Ensure: Present
      Force: True
    - Key: HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNames
      ValueName:
      ValueData:
      ValueType: String
    - Key: HKLM:\Software\Policies\Microsoft\Cryptography\Configuration\SSL\00010002
      ValueName: EccCurves
      ValueData:
        - curve25519
        - NistP256
        - NistP384
      ValueType: MultiString
    - Key: HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ModuleLogging\ModuleNamesTest
      Ensure: Absent

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  RegistryValues:
    merge_hash: deep

```

<br />

[AccessControlDsc]: https://github.com/mcollera/AccessControlDsc
[Chocolatey]: https://github.com/gaelcolas/Chocolatey
[ComputerManagementDsc]: https://github.com/dsccommunity/ComputerManagementDsc
[xPSDesiredStateConfiguration]: https://github.com/dsccommunity/xPSDesiredStateConfiguration

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
