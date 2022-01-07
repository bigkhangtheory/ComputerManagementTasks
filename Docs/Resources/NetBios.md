# NetBios

## Parameters

| Parameter          | Attribute  | DataType   | Description                                                                                                                  | Allowed Values                 |
| ------------------ | ---------- | ---------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| **InterfaceAlias** | *Required* | `[String]` | Specifies the alias of a network interface. Supports the use of '*' and '%'                                                  |                                |
| **Setting**        | *Required* | `[String]` | Specifies if NetBIOS should be enabled or disabled or obtained from the DHCP server (Default). If static IP, Enable NetBIOS. | `Default`, `Enable`, `Disable` |

## Description

This resource is used to enable or disable the NetBios on a network interface.

## Examples

### Example 1

Disable NetBios on Adapter.

```powershell
Configuration NetBios_DisableNetBios_Config
{
    Import-DscResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetBios DisableNetBios
        {
            InterfaceAlias = 'Ethernet'
            Setting        = 'Disable'
        }
    }
}
```

### Example 2

Disable NetBios on all adapters.

```powershell
Configuration NetBios_DisableNetBios_Config_Wildcard
{
    Import-DscResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetBios DisableNetBios
        {
            InterfaceAlias = '*'
            Setting        = 'Disable'
        }
    }
}
```

