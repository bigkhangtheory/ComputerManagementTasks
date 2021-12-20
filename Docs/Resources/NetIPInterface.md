# NetIPInterface

## Parameters

| Parameter                           | Attribute  | DataType   | Description                                                                                       | Allowed Values                                |
| ----------------------------------- | ---------- | ---------- | ------------------------------------------------------------------------------------------------- | --------------------------------------------- |
| **InterfaceAlias**                  | *Required* | `[String]` | Alias of the network interface to configure.                                                      |                                               |
| **AddressFamily**                   | *Required* | `[String]` | IP address family on the interface to configure.                                                  | `IPv4`, `IPv6`                                |
| **AdvertiseDefaultRoute**           |            | `[String]` | Specifies the default router advertisement for an interface.                                      | `Enabled`, `Disabled`                         |
| **Advertising**                     |            | `[String]` | Specifies the router advertisement value for the IP interface.                                    | `Enabled`, `Disabled`                         |
| **AutomaticMetric**                 |            | `[String]` | Specifies the value for automatic metric calculation.                                             | `Enabled`, `Disabled`                         |
| **Dhcp**                            |            | `[String]` | Specifies the Dynamic Host Configuration Protocol (DHCP) value for an IP interface.               | `Enabled`, `Disabled`                         |
| **DirectedMacWolPattern**           |            | `[String]` | Specifies the wake-up packet value for an IP interface.                                           | `Enabled`, `Disabled`                         |
| **EcnMarking**                      |            | `[String]` | Specifies the value for Explicit Congestion Notification (ECN) marking.                           | `Disabled`, `UseEct1`, `UseEct0`, `AppDecide` |
| **ForceArpNdWolPattern**            |            | `[String]` | Specifies the Wake On LAN (WOL) value for the IP interface.                                       | `Enabled`, `Disabled`                         |
| **Forwarding**                      |            | `[String]` | Specifies the packet forwarding value for the IP interface.                                       | `Enabled`, `Disabled`                         |
| **IgnoreDefaultRoutes**             |            | `[String]` | Specifies a value for Default Route advertisements.                                               | `Enabled`, `Disabled`                         |
| **ManagedAddressConfiguration**     |            | `[String]` | Specifies the value for managed address configuration.                                            | `Enabled`, `Disabled`                         |
| **NeighborUnreachabilityDetection** |            | `[String]` | Specifies the value for Neighbor Unreachability Detection (NUD).                                  | `Enabled`, `Disabled`                         |
| **OtherStatefulConfiguration**      |            | `[String]` | Specifies the value for configuration other than addresses.                                       | `Enabled`, `Disabled`                         |
| **RouterDiscovery**                 |            | `[String]` | Specifies the value for router discovery for an IP interface.                                     | `Enabled`, `Disabled`, `ControlledByDHCP`     |
| **WeakHostReceive**                 |            | `[String]` | Specifies the receive value for a weak host model.                                                | `Enabled`, `Disabled`                         |
| **WeakHostSend**                    |            | `[String]` | Specifies the send value for a weak host model.                                                   | `Enabled`, `Disabled`                         |
| **NlMtu**                           |            | `[UInt32]` | Specifies the network layer Maximum Transmission Unit (MTU) value, in bytes, for an IP interface. |                                               |
| **InterfaceMetric**                 |            | `[UInt32]` | Specifies the metric for an IP interface.                                                         |                                               |

## Description

This resource is used to configure the IP interface settings for a network interface.

## Known Issues

- If you define a value for `InterfaceMetric`, the `AutomaticMetric`
setting is ignored. PowerShell ignores `AutomaticMetric` when you
use both arguments with the `Set-NetIPInterface` cmdlet.

## Examples

### Example 1

This example enables the following settings on the IPv4 network interface with alias
'Ethernet':
- AdvertiseDefaultRoute
- Avertising
- AutomaticMetric
- DirectedMacWolPattern
- ForceArpNdWolPattern
- Forwarding
- IgnoreDefaultRoute
- ManagedAddressConfiguration
- NeighborUnreachabilityDetection
- OtherStatefulConfiguration
- RouterDiscovery
- NlMtu
The EcnMarking parameter will be set to AppDecide.

```powershell
Configuration NetIPInterface_MultipleSettings_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetIPInterface MultipleSettings
        {
            InterfaceAlias                  = 'Ethernet'
            AddressFamily                   = 'IPv4'
            AdvertiseDefaultRoute           = 'Enabled'
            Advertising                     = 'Enabled'
            AutomaticMetric                 = 'Enabled'
            DirectedMacWolPattern           = 'Enabled'
            EcnMarking                      = 'AppDecide'
            ForceArpNdWolPattern            = 'Enabled'
            Forwarding                      = 'Enabled'
            IgnoreDefaultRoutes             = 'Enabled'
            ManagedAddressConfiguration     = 'Enabled'
            NeighborUnreachabilityDetection = 'Enabled'
            OtherStatefulConfiguration      = 'Enabled'
            RouterDiscovery                 = 'Enabled'
            NlMtu                           = 1576
        }
    }
}
```

### Example 2

Enabling DHCP for the IPv4 Address and DNS on the adapter with alias 'Ethernet'.

```powershell
Configuration NetIPInterface_EnableDHCP_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetIPInterface EnableDhcp
        {
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
            Dhcp           = 'Enabled'
        }

        DnsServerAddress EnableDhcpDNS
        {
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
        }
    }
}
```

### Example 3

Disable the weak host receive IPv4 setting for the network adapter with alias 'Ethernet'.

```powershell
Configuration NetIPInterface_DisableWeakHostReceive_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetIPInterface DisableWeakHostReceiving
        {
            InterfaceAlias  = 'Ethernet'
            AddressFamily   = 'IPv4'
            WeakHostReceive = 'Disabled'
        }
    }
}
```

### Example 4

Disable the weak host send IPv4 setting for the network adapter with alias 'Ethernet'.

```powershell
Configuration NetIPInterface_DisableWeakHostSend_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetIPInterface DisableWeakHostSend
        {
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
            WeakHostSend   = 'Disabled'
        }
    }
}
```

### Example 5

Set a specified interface metrics for the network adapters with alias 'Ethernet' and 'Ethernet 2'.

```powershell
Configuration NetIPInterface_SetInterfaceMetric
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetIPInterface EthernetMetric
        {
            InterfaceAlias  = 'Ethernet'
            AddressFamily   = 'IPv4'
            AutomaticMetric = 'Disabled'
            InterfaceMetric = 10
        }

        NetIPInterface Ethernet2Metric
        {
            InterfaceAlias  = 'Ethernet 2'
            AddressFamily   = 'IPv4'
            AutomaticMetric = 'Disabled'
            InterfaceMetric = 20
        }
    }
}
```

