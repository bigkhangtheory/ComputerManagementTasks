# DhcpClient

> Warning! This resource has been deprecated as of v7.0.0.0.
> Please use the `Dhcp` property of the [NetIPInterface](NetIPInterface.md)
> resource instead.

## Parameters

| Parameter          | Attribute  | DataType   | Description                                                      | Allowed Values     |
| ------------------ | ---------- | ---------- | ---------------------------------------------------------------- | ------------------ |
| **InterfaceAlias** | *Required* | `[String]` | Alias of the network interface for which the DHCP Client is set. |                    |
| **AddressFamily**  | *Required* | `[String]` | IP address family.                                               | IPv4,  IPv6        |
| **State**          | Required   | `[String]` | The desired state of the DHCP Client.                            | Enabled,  Disabled |

## Description

The resource is responsible for creating and managing DHCP Clients for a network
interface on a node.

## Examples

### Example 1

Enabling DHCP for the IP Address and DNS on the adapter with alias 'Ethernet'.

```powershell
Configuration Example
{
    param
    (
        [Parameter()]
        [System.String[]]
        $NodeName = 'localhost'
    )

    Import-DscResource -Module NetworkingDsc

    Node $NodeName
    {
        DhcpClient EnableDhcpClient
        {
            State          = 'Enabled'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
        }

        DnsServerAddress EnableDhcpDNS
        {
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
        }
    }
}
```

