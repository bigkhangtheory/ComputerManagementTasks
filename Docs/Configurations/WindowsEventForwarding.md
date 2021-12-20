# WindowsEventForwarding



<br />

## Project Information

|                  |                                                                                                                          |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/WindowsEventForwarding |
| **Dependencies** | [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]                                 |
| **Resources**    | [xWindowsFeature][xWindowsFeature]                                                               |

<br />

## Parameters

<br />

### Table. Attributes of `WindowsEventForwarding`

| Parameter              | Attribute  | DataType        | Description                                                                                         | Allowed Values |
| :--------------------- | :--------- | :-------------- | :-------------------------------------------------------------------------------------------------- | :------------- |

---

#### Table. Attributes of ``

| Parameter              | Attribute  | DataType        | Description                                                                                         | Allowed Values |
| :--------------------- | :--------- | :-------------- | :-------------------------------------------------------------------------------------------------- | :------------- |

---

<br />

## Example `WindowsEventForwarding`

```yaml
WindowsEventForwarding:
# Test: SourCollectorce Node 
 NodeType: Collector 
 FixWsManUrlAcl: true 
 Subscriptions: 
   - SubscriptionID: TestSub 
     Ensure: Present 
     SubscriptionType: CollectorInitiated 
     Address: 
       - tester.contoso.com 
       - tester2.contoso.com 
  
 # Test: Source Node 
 # NodeType: Source 
 # CollectorName: collector.contoso.com 

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  WindowsEventForwarding:
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
