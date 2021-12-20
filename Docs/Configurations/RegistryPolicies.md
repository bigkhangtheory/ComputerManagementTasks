# RegistryPolicies



<br />

## Project Information

|                  |                                                                                                                          |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/RegistryPolicies |
| **Dependencies** | [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]                                 |
| **Resources**    | [xWindowsFeature][xWindowsFeature]                                                               |

<br />

## Parameters

<br />

### Table. Attributes of `RegistryPolicies`

| Parameter              | Attribute  | DataType        | Description                                                                                         | Allowed Values |
| :--------------------- | :--------- | :-------------- | :-------------------------------------------------------------------------------------------------- | :------------- |

---

#### Table. Attributes of ``

| Parameter              | Attribute  | DataType        | Description                                                                                         | Allowed Values |
| :--------------------- | :--------- | :-------------- | :-------------------------------------------------------------------------------------------------- | :------------- |

---

<br />

## Example `RegistryPolicies`

```yaml
RegistryPolicies:
  GpUpdateInterval: 4
  Values:
    - Key: "HKLM:\\SOFTWARE\\Policies\\Microsoft\\MRT"
      ValueName: DontReportInfectionInformation
      ValueData: 1
      ValueType: Dword
    - Key: "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System"
      ValueName: EnableSmartScreen
      TargetType: ComputerConfiguration
      ValueData: 0
      ValueType: Dword
      Force: false
      Ensure: Present
    - Key: "Software\\Policies\\Microsoft\\Windows\\Group Policy\\`{35378EAC-683F-11D2-A89A-00C04FBBCFA2`}"
      ValueName: NoBackgroundPolicy
      TargetType: ComputerConfiguration
      ValueData: 0
      ValueType: Dword
      Force: true
      Ensure: Present
    - Key: "Software\\Policies\\Microsoft\\Windows\\PowerShell\\ModuleLogging\\ModuleNames"
      ValueName: '*'
      TargetType: ComputerConfiguration
      ValueData: '*'
      ValueType: String
      Ensure: Present
    - Key: "Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon"
      ValueName: AllocateFloppies
      TargetType: ComputerConfiguration
      ValueData: 1
      ValueType: String
      Ensure: Present
    - Key: "System\\CurrentControlSet\\Control\\Session Manager\\Kernel"
      ValueName: ObCaseInsensitive
      TargetType: ComputerConfiguration
      ValueData: 1
      ValueType: Dword
      Ensure: Present
    - Key: "Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon"
      ValueName: AllocateCDRoms
      TargetType: ComputerConfiguration
      ValueData: 1
      ValueType: String
      Ensure: Present
    - Key: "System\\CurrentControlSet\\Services\\LanManServer\\Parameters"
      ValueName: AutoDisconnect
      TargetType: ComputerConfiguration
      ValueData: 15
      ValueType: Dword
      Ensure: Present
    - Key: "System\\CurrentControlSet\\Control\\Lsa"
      ValueName: NoLMHash
      TargetType: ComputerConfiguration
      ValueData: 1
      ValueType: Dword
      Ensure: Present
    - Key: "Software\\Microsoft\\Windows NT\\CurrentVersion\\Setup\\RecoveryConsole"
      ValueName: SecurityLevel
      TargetType: ComputerConfiguration
      ValueData: 0
      ValueType: Dword
      Ensure: Present

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  RegistryPolicies:
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
