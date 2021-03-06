# NetAdapterConfiguration

The **NetAdapterConfiguration** DSC configuration is used to rename a network interface that matches the search parameters passed in, as well as setting static IP configurations for the newly named adapter.

<br />

## Project Information

|                  |                                                                                                                                                                                    |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/NetAdapterConfiguration                                                 |
| **Dependencies** | [NetwokringDsc][NetworkingDsc], [PSDesiredStateConfiguration][PSDesiredStateConfiguration]                                                                                         |
| **Resources**    | [NetAdapterName][NetAdapterName], [NetAdapterState][NetAdapterState], [IPAddress][IPAddress], [DefaultGatewayAddress][DefaultGatewayAddress], [DnsServerAddress][DnsServerAddress] |

<br />

## Parameters

<br />

### Table. Attributes of `NetAdapterConfiguration`

| Parameter    | Attribute | DataType        | Description                                  | Allowed Values |
| :----------- | :-------- | :-------------- | :------------------------------------------- | :------------- |
| **Adapters** |           | `[Hashtable[]]` | A list of new Network Adapters to configure. |                |

---

#### Table. Attributes of `Adapters`

| Parameter            | Attribute  | DataType     | Description                                                                            | Allowed Values |
| :------------------- | :--------- | :----------- | :------------------------------------------------------------------------------------- | :------------- |
| **NewName**          | *Required* | `[String]`   | Specifies the new name of the network adapter.                                         |                |
| **Name**             |            | `[String]`   | This is the name of the network adapter to find.                                       |                |
| **MacAddress**       |            | `[String]`   | This is the MAC address of the network adapter to find.                                |                |
| **IPAddress**        |            | `[String[]]` | The desired IP address, optionally including prefix length using CIDR notation.        |                |
| **GatewayAddress**   |            | `[String]`   | The desired default gateway address - if not provided default gateway will be removed. |                |
| **DnsServerAddress** |            | `[String[]]` | The desired DNS Server address(es). Exclude to enable DHCP.                            |                |

---

<br />

## Example `NetAdapterConfiguration`

```yaml
NetAdapterConfiguration:
  Adapters:
    - MacAddress: 00-17-FB-00-00-0A
      NewName: 1GB1_MGMT
      IPAddress: 10.0.0.33/23
      GatewayAddress: 1.2.3.4
      DnsServerAddress:
        - 1.2.3.4
        - 2.3.4.5
      DisableIpv6: true

    - Name: OldNetAdapter
      MacAddress: 00-17-FB-00-00-0B
      NewName: STORAGE
      IPAddress: 10.2.0.33/24
      DisableIpv6: true

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  NetAdapterConfiguration:
    merge_hash: deep
  NetAdapterConfiguration\Adapters:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - NewName
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
