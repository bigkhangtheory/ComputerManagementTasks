# DnsClientGlobalSettings

The **DnsClientGlobalSettings** DSC configuration is used to control global DNS Client settings for a target node.

<br />

## Project Information

|                  |                                                                                                                                    |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/DnsClientGlobalSettings |
| **Dependencies** | [NetwokringDsc][NetworkingDsc], [PSDesiredStateConfiguration][PSDesiredStateConfiguration]                                         |
| **Resources**    | [DnsClientGlobalSettings][DnsClientGlobalSettings]                                                                                 |

<br />

## Parameters

<br />

### Table. Attributes of `DnsClientGlobalSettings`

| Parameter            | Attribute | DataType     | Description                                                                                                                                      | Allowed Values |
| :------------------- | :-------- | :----------- | :----------------------------------------------------------------------------------------------------------------------------------------------- | :------------- |
| **SuffixSearchList** |           | `[String[]]` | Specifies a list of global suffixes that can be used in the specified order by the DNS client for resolving the IP address of the computer name. |                |
| **UseDevolution**    |           | `[Boolean]`  | Specifies that devolution is activated.                                                                                                          |                |
| **DevolutionLevel**  |           | `[UInt32]`   | Specifies the number of labels up to which devolution should occur.                                                                              |                |

---

<br />

## Example `DnsClientGlobalSettings`

```yaml
DnsClientGlobalSettings:
  SuffixSearchList:
    - example.com
    - example.local
    - internal
  UseDevolution: true
  DevolutionLevel: 0

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  DnsClientGlobalSettings:
    merge_hash: deep
  DnsClientGlobalSettings\SuffixSearchList:
    merge_baseType_array: Unique

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

[NetworkingDsc]: https://github.com/dsccommunity/NetworkingDsc/wiki
[DefaultGatewayAddress]: https://github.com/dsccommunity/NetworkingDsc/wiki/DefaultGatewayAddress
[DnsClientGlobalSetting]: https://github.com/dsccommunity/NetworkingDsc/wiki/DnsClientGlobalSetting
[DnsConnectionSuffix]: https://github.com/dsccommunity/NetworkingDsc/wiki/DnsConnectionSuffix
[DnsServerAddress]: https://github.com/dsccommunity/NetworkingDsc/wiki/DnsServerAddress
[Firewall]: https://github.com/dsccommunity/NetworkingDsc/wiki/Firewall
[FirewallProfile]: https://github.com/dsccommunity/NetworkingDsc/wiki/FirewallProfile
[HostsFile]: https://github.com/dsccommunity/NetworkingDsc/wiki/HostsFile
[IPAddress]: https://github.com/dsccommunity/NetworkingDsc/wiki/IPAddress
[IPAddressOption]: https://github.com/dsccommunity/NetworkingDsc/wiki/IPAddressOption
[NetAdapterAdvancedProperty]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetAdapterAdvancedProperty
[NetAdapterBinding]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetAdapterBinding
[NetAdapterLso]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetAdapterLso
[NetAdapterName]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetAdapterName
[NetAdapterRdma]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetAdapterRdma
[NetAdapterRsc]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetAdapterRsc
[NetAdapterRss]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetAdapterRss
[NetAdapterState]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetAdapterState
[NetBios]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetBios
[NetConnectionProfile]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetConnectionProfile
[NetIPInterface]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetIPInterface
[NetworkTeam]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetworkTeam
[NetworkTeamInterface]: https://github.com/dsccommunity/NetworkingDsc/wiki/NetworkTeamInterface
[ProxySettings]: https://github.com/dsccommunity/NetworkingDsc/wiki/ProxySettings
[Route]: https://github.com/dsccommunity/NetworkingDsc/wiki/Route
[WaitForNetworkTeam]: https://github.com/dsccommunity/NetworkingDsc/wiki/WaitForNetworkTeam
[WinsServerAddress]: https://github.com/dsccommunity/NetworkingDsc/wiki/WinsServerAddress
[WinsSetting]: https://github.com/dsccommunity/NetworkingDsc/wiki/WinsSetting
[IPv6 Guidance]: https://docs.microsoft.com/en-US/troubleshoot/windows-server/networking/configure-ipv6-in-windows