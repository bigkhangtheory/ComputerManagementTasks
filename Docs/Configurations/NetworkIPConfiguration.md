# NetworkIPConfiguration

The **NetworkIpConfiguration** DSC configuration sets the IP configuration and network routes on a target nodes network interfaces.

<br />

## Project Information

|                  |                                                                                                                                                                                                                                |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/NetworkIPConfiguration                                                                                              |
| **Dependencies** | [NetworkingDsc][NetworkingDsc], [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]                                                                                                                                   |
| **Resources**    | [NetIpInterface][NetIPInterface], [IPAddress][IPAddress], [DefaultGatewayAddress][DefaultGatewayAddress], [DnsServerAddress][DnsServerAddress], [DnsConnectionSuffix][DnsConnectionSuffix], [xWindowsFeature][xWindowsFeature] |

<br />

## Parameters

<br />

### Table. Attributes of `NetworkIPConfiguration`

| Parameter          | Attribute | DataType        | Description                                                        | Allowed Values              |
| :----------------- | :-------- | :-------------- | :----------------------------------------------------------------- | :-------------------------- |
| **DisableNetbios** |           | `[Boolean]`     | Disable NetBios on all network interfaces. See [NetBios][NetBios]. | `true`, `false` *(Default)* |
| **ConfigureIPv6**  |           | `[UInt16]`      | See [IPv6 Guidance][IPv6 Guidance].                                | `0` - `255`                 |
| **Interfaces**     |           | `[Hashtable[]]` | List of networking interfaces on a target node.                    |                             |
| **Routes**         |           | `[Hashtable[]]` | List of IP routes to configure on a target node.                   |                             |

---

#### Table. Attributes of `Interfaces`

| Parameter               | Attribute  | DataType      | Description                                                                                      | Allowed Values                                         |
| :---------------------- | :--------- | :------------ | :----------------------------------------------------------------------------------------------- | :----------------------------------------------------- |
| **InterfaceAlias**      | *Required* | `[String]`    | Alias of the network interface to configure.                                                     |                                                        |
| **EnableDhp**           |            | `[Boolean]`   | Enable the Dynamic Host Configuration Protocol (DHCP) for the IP interface. Defaults to `false`. |                                                        |
| **AddressFamily**       |            | `[String]`    | IP address family on the interface to configure.                                                 | `IPv4` *(Default)*, `IPv6`                             |
| **IPAddress**           |            | `[String[]]`  | The desired IP address, optionally including prefix length using CIDR notation.                  |                                                        |
| **Prefix**              |            | `[UInt16]`    | IP address prefix.                                                                               |                                                        |
| **Gateway**             |            | `[String]`    | The desired default gateway address - if not provided default gateway will be removed.           |                                                        |
| **DnsServer**           |            | `[String[]]`  | The desired DNS Server address(es). Exclude to enable DHCP.                                      |                                                        |
| **DnsConnectionSuffix** |            | `[String]`    | DNS connection-specific suffix to assign to the network interface.                               |                                                        |
| **RegisterDns**         |            | `[Boolean]`   | Specifies that the IP address for this connection is to be registered. Defaults to `true`.       |                                                        |
| **NetworkCategory**     |            | `[String]`    | Specifies the category of the network.                                                           | `Public`, `Private`, `DomainAuthenticated` *(Default)* |
| **DisableIPv6**         |            | `[Boolean]`   | Disable IPv6 on the network interface. Defaults to `false`.                                      |                                                        |
| **DisableNetbios**      |            | `[Boolean]`   | Disable the NetBios on the network interface. Defaults to `false`.                               |                                                        |
| **EnableLmhostsLookup** |            | `[Boolean]`   | Enable the LMHOSTS lookup on the network interface. Defaults to `false`.                         |                                                        |
| **InterfaceOptions**    |            | `[Hashtable]` | Specify additional options for the network interface.                                            |                                                        |

---

##### Table. Attributes of `InterfaceOptions`

| Parameter                           | Attribute | DataType   | Description                                                                                                           | Allowed Values                                            |
| :---------------------------------- | :-------- | :--------- | :-------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------- |
| **AdvertiseDefaultRoute**           |           | `[String]` | Specifies the default router advertisement for an interface.                                                          | `Enabled`, `Disabled` *(Default)*                         |
| **Advertising**                     |           | `[String]` | Specifies the router advertisement value for the IP interface.                                                        | `Enabled`, `Disabled` *(Default)*                         |
| **AutomaticMetric**                 |           | `[String]` | Specifies the value for automatic metric calculation.                                                                 | `Enabled` *(Default)*, `Disabled`                         |
| **DirectedMacWolPattern**           |           | `[String]` | Specifies the wake-up packet value for an IP interface.                                                               | `Enabled`, `Disabled` *(Default)*                         |
| **EcnMarking**                      |           | `[String]` | Specifies the value for Explicit Congestion Notification (ECN) marking.                                               | `Disabled`, `UseEct1`, `UseEct0`, `AppDecide` *(Default)* |
| **ForceArpNdWolPattern**            |           | `[String]` | Specifies the Wake On LAN (WOL) value for the IP interface.                                                           | `Enabled`, `Disabled` *(Default)*                         |
| **Forwarding**                      |           | `[String]` | Specifies the packet forwarding value for the IP interface.                                                           | `Enabled`, `Disabled` *(Default)*                         |
| **IgnoreDefaultRoutes**             |           | `[String]` | Specifies a value for Default Route advertisements.                                                                   | `Enabled`, `Disabled` *(Default)*                         |
| **ManagedAddressConfiguration**     |           | `[String]` | Specifies the value for managed address configuration.                                                                | `Enabled` *(Default)*, `Disabled`                         |
| **NeighborUnreachabilityDetection** |           | `[String]` | Specifies the value for Neighbor Unreachability Detection (NUD).                                                      | `Enabled` *(Default)*, `Disabled`                         |
| **OtherStatefulConfiguration**      |           | `[String]` | Specifies the value for configuration other than addresses.                                                           | `Enabled` *(Default)*, `Disabled`                         |
| **RouterDiscovery**                 |           | `[String]` | Specifies the value for router discovery for an IP interface.                                                         | `Enabled`, `Disabled`, `ControlledByDHCP` *(Default)*     |
| **WeakHostReceive**                 |           | `[String]` | Specifies the receive value for a weak host model.                                                                    | `Enabled`, `Disabled` *(Default)*                         |
| **WeakHostSend**                    |           | `[String]` | Specifies the send value for a weak host model.                                                                       | `Enabled`, `Disabled` *(Default)*                         |
| **NlMtu**                           |           | `[UInt32]` | Specifies the network layer Maximum Transmission Unit (MTU) value, in bytes, for an IP interface. Defaults to `1500`. |                                                           |
| **InterfaceMetric**                 |           | `[UInt32]` | Specifies the metric for an IP interface.                                                                             |                                                           |

---

#### Table. Attributes of `Routes`

| Parameter             | Attribute  | DataType   | Description                                                                                                                                         | Allowed Values                 |
| --------------------- | ---------- | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| **InterfaceAlias**    | *Required* | `[String]` | Specifies the alias of a network interface.                                                                                                         |                                |
| **AddressFamily**     | *Required* | `[String]` | Specifies the IP address family.                                                                                                                    | `IPv4` *(Default)*, `IPv6`     |
| **DestinationPrefix** | *Required* | `[String]` | Specifies a destination prefix of an IP route. A destination prefix consists of an IP address prefix and a prefix length, separated by a slash (/). |                                |
| **NextHop**           | *Required* | `[String]` | Specifies the next hop for the IP route.                                                                                                            |                                |
| **RouteMetric**       |            | `[UInt16]` | Specifies an integer route metric for an IP route. Defaults to `256`.                                                                               |                                |
| **Publish**           |            | `[String]` | Specifies the publish setting of an IP route.                                                                                                       | `No` *(Default)*, `Yes`, `Age` |
| **PreferredLifetime** |            | `[UInt64]` | Specifies a preferred lifetime in seconds of an IP route.                                                                                           |                                |
| **Ensure**            |            | `[String]` | Specifies whether the route should exist. Defaults to 'Present'.                                                                                    | `Present`, `Absent`            |

---

<br />

## Example `NetworkIpConfiguration` *(Simple)*

```yaml
NetworkIPConfiguration:
  Interfaces:
    - InterfaceAlias: Ethernet
      EnableDhcp: false
      IpAddress: 10.101.1.10
      Prefix: 24
      Gateway: 10.101.1.1
      DnsServer:
        - 10.180.0.101
        - 10.180.0.102
      DnsConnectionSuffix: example.com
```

---

## Example `NetworkIPConfiguration` *(Advanced)*

```yaml
NetworkIPConfiguration:
  DisableNetBios: true
  ConfigureIPv6: 32
  Interfaces:
    - InterfaceAlias: Ethernet
      IpAddress: 10.101.1.10
      Prefix: 24
      Gateway: 10.101.1.1
      DnsServer:
        - 10.180.0.101
        - 10.180.0.102
      DnsConnectionSuffix: example.com
      RegisterDns: true
      DisableIPv6: true
      EnableLmHostsLookup: false
      NetworkCategory: DomainAuthenticated
      InterfaceOptions:
        AdvertiseDefaultRoute:            Disabled
        Advertising:                      Disabled
        AutomaticMetric:                  Disabled
        DirectedMacWolPattern:            Disabled
        EcnMarking:                       AppDecide
        ForceArpNdWolPattern:             Disabled
        Forwarding:                       Disabled
        IgnoreDefaultRoutes:              Disabled
        ManagedAddressConfiguration:      Enabled
        NeighborUnreachabilityDetection:  Enabled
        NlMtu:                            2400
        OtherStatefulConfiguration:       Enabled
        RouterDiscovery:                  ControlledByDHCP
        WeakHostReceive:                  Disabled
        WeakHostSend:                     Disabled

    - InterfaceAlias: Ethernet 2
      EnableDhcp: true
      DisableIPv6: true

  Routes:
    - InterfaceAlias:    Ethernet
      DestinationPrefix: 192.168.0.0/16
      NextHop:           192.168.120.0
      RouteMetric:       200
    - DestinationPrefix: 192.162.0.0/16
      NextHop:           192.162.120.0
      RouteMetric:       200
      Publish:           Age
      PreferredLifetime: 25

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  NetworkIpConfiguration:
    merge_hash: deep
  NetworkIpConfiguration\Interfaces:
    merge_baseType_array: Unique
    merge_hash_array: DeepTuple
    merge_options:
      tuple_keys:
        - InterfaceAlias
  NetworkIpConfiguration\Routes:
    merge_baseType_array: Unique
    merge_hash_array: DeepTuple
    merge_options:
      tuple_keys:
        - InterfaceAlias
        - AddressFamily
        - DestinationPrefix
        - NextHop

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