# DefaultGatewayAddress

## Parameters

| Parameter          | Attribute  | DataType   | Description                                                                            | Allowed Values |
| ------------------ | ---------- | ---------- | -------------------------------------------------------------------------------------- | -------------- |
| **InterfaceAlias** | *Required* | `[String]` | Alias of the network interface for which the default gateway address is set.           |                |
| **AddressFamily**  | *Required* | `[String]` | IP address family.                                                                     | `IPv4`, `IPv6` |
| **Address**        |            | `[String]` | The desired default gateway address - if not provided default gateway will be removed. |                |

## Description

The resource is responsible for creating and managing the Default Gateway for
an interface on a node.

## Examples

### Example 1

Remove the IPv4 default gateway from the network interface
'Ethernet'.

```powershell
Configuration DefaultGatewayAddress_RemoveDefaultGateway_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        DefaultGatewayAddress RemoveDefaultGateway
        {
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
        }
    }
}
```

### Example 2

Set the IPv4 default gateway of the network interface 'Ethernet'
to '192.168.1.1'.

```powershell
Configuration DefaultGatewayAddress_SetDefaultGateway_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        DefaultGatewayAddress SetDefaultGateway
        {
            Address        = '192.168.1.1'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
        }
    }
}
```

