# DnsServerAddress

## Parameters

| Parameter          | Attribute  | DataType     | Description                                                              | Allowed Values |
| ------------------ | ---------- | ------------ | ------------------------------------------------------------------------ | -------------- |
| **InterfaceAlias** | *Required* | `[String]`   | Alias of the network interface for which the DNS server address is set.  |                |
| **AddressFamily**  | *Required* | `[String]`   | IP address family.                                                       | `IPv4`, `IPv6` |
| **Address**        |            | `[String[]]` | The desired DNS Server address(es). Exclude to enable DHCP.              |                |
| **Validate**       |            | `[Boolean]`  | Requires that the DNS Server addresses be validated if they are updated. |                |

## Description

This resource is used to control a node's DNS Server address(s).

## Examples

### Example 1

Configure DNS Server for the Ethernet adapter.

```powershell
Configuration DnsServerAddress_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        DnsServerAddress DnsServerAddress
        {
            Address        = '127.0.0.1'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
            Validate       = $true
        }
    }
}
```

### Example 2

Configure primary and secondary DNS Server addresses on the Ethernet adapter.

```powershell
Configuration DnsServerAddress_PrimaryAndSecondary_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        DnsServerAddress PrimaryAndSecondary
        {
            Address        = '10.0.0.2','10.0.0.40'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
            Validate       = $true
        }
    }
}
```

### Example 3

Enabling DHCP for the IPv4 Address and DNS on the adapter with alias 'Ethernet'.

```powershell
Configuration DnsServerAddress_EnableDHCP_Config
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

