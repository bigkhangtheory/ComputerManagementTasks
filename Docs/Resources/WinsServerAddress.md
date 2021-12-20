# WinsServerAddress

## Parameters

| Parameter          | Attribute  | DataType     | Description                                                              | Allowed Values |
| ------------------ | ---------- | ------------ | ------------------------------------------------------------------------ | -------------- |
| **InterfaceAlias** | *Required* | `[String]`   | Alias of the network interface for which the WINS server address is set. |                |
| **Address**        |            | `[String[]]` | The desired WINS Server address(es). Exclude to remove all WINS servers. |                |

## Description

This resource is used to control a node's WINS Server address(s) for the given network interface.

## Examples

### Example 1

Configure WINS Server for the Ethernet adapter.

```powershell
Configuration WinsServerAddress_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        WinsServerAddress WinsServerAddress
        {
            Address        = '192.168.0.1'
            InterfaceAlias = 'Ethernet'
        }
    }
}
```

### Example 2

Configure primary and secondary WINS Server addresses on the Ethernet adapter.

```powershell
Configuration WinsServerAddress_PrimaryAndSecondary_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        WinsServerAddress PrimaryAndSecondary
        {
            Address        = '192.168.0.1', '192.168.0.2'
            InterfaceAlias = 'Ethernet'
        }
    }
}
```

