# IPAddress

## Parameters

| Parameter               | Attribute  | DataType     | Description                                                                     | Allowed Values                                                                   |
| ----------------------- | ---------- | ------------ | ------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| **IPAddress**           |            | `[String[]]` | The desired IP address, optionally including prefix length using CIDR notation. |                                                                                  |
| **InterfaceAlias**      | *Required* | `[String]`   | Alias of the network interface for which the IP address should be set.          |                                                                                  |
| **AddressFamily**       | *Required* | `[String]`   | IP address family.                                                              | `IPv4`, `IPv6`                                                                   |
| **KeepExistingAddress** |            | `[Boolean]`  |                                                                                 | Indicates whether or not existing IP addresses on an interface will be retained. |  |

## Description

This resource is used to control a node's IP address. This can be used in
conjunction with disabling DHCP to set static IP addresses.

## Examples

### Example 1

Disabling DHCP and adding a static IP Address for IPv6 and IPv4
using default prefix lengths for the matching address classes.

```powershell
Configuration IPAddress_AddingStaticIP_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetIPInterface DisableDhcp
        {
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
            Dhcp           = 'Disabled'
        }

        # If no prefix is supplied IPv6 will default to /64.
        IPAddress NewIPv6Address
        {
            IPAddress      = '2001:4898:200:7:6c71:a102:ebd8:f482'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPV6'
        }

        <#
            If no prefix is supplied then IPv4 will default to class based:
            - Class A - /8
            - Class B - /16
            - Class C - /24
        #>
        IPAddress NewIPv4Address
        {
            IPAddress      = '192.168.10.5'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPV4'
        }
    }
}
```

### Example 2

Disabling DHCP and adding multiple static IP Addresses for IPv4 and IPv6.

```powershell
Configuration IPAddress_AddingMultipleStaticIP_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetIPInterface DisableDhcp
        {
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv6'
            Dhcp           = 'Disabled'
        }

        IPAddress NewIPv6Address
        {
            IPAddress      = '2001:4898:200:7:6c71:a102:ebd8:f482/64','2001:4598:210:7:6d71:a102:ebe8:f483/64'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPV6'
        }

        IPAddress NewIPv4Address
        {
            IPAddress      = '192.168.10.5/24','192.168.10.6/24'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPV4'
        }
    }
}
```

### Example 3

Disabling DHCP and adding a static IP Address for IPv6 and IPv4
using specified prefixes in CIDR notation.

```powershell
Configuration IPAddress_AddingStaticIPWithPrefix_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetIPInterface DisableDhcp
        {
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv6'
            Dhcp           = 'Disabled'
        }

        IPAddress NewIPv6Address
        {
            IPAddress      = '2001:4898:200:7:6c71:a102:ebd8:f482/64'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPV6'
        }

        IPAddress NewIPv4Address
        {
            IPAddress      = '192.168.10.5/24'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPV4'
        }
    }
}
```

### Example 4

Disabling DHCP and adding a static IP Address for IPv6 and IPv4
using default prefix lengths for the matching address classes.
Any existing IP addresses will be retained on the network adapter.

```powershell
Configuration IPAddress_AddingStaticIPKeepSettings_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetIPInterface DisableDhcp
        {
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
            Dhcp           = 'Disabled'
        }

        # If no prefix is supplied IPv6 will default to /64.
        IPAddress NewIPv6Address
        {
            IPAddress           = '2001:4898:200:7:6c71:a102:ebd8:f482'
            InterfaceAlias      = 'Ethernet'
            AddressFamily       = 'IPV6'
            KeepExistingAddress = $true
        }

        <#
            If no prefix is supplied then IPv4 will default to class based:
            - Class A - /8
            - Class B - /16
            - Class C - /24
        #>
        IPAddress NewIPv4Address
        {
            IPAddress           = '192.168.10.5'
            InterfaceAlias      = 'Ethernet'
            AddressFamily       = 'IPV4'
            KeepExistingAddress = $true
        }
    }
}
```

