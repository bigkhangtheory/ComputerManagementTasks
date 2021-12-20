# NetConnectionProfile

## Parameters

| Parameter            | Attribute  | DataType   | Description                                                  | Allowed Values                                                    |
| -------------------- | ---------- | ---------- | ------------------------------------------------------------ | ----------------------------------------------------------------- |
| **InterfaceAlias**   | *Required* | `[String]` | Specifies the alias for the Interface that is being changed. |                                                                   |
| **IPv4Connectivity** |            | `[String]` | Sets the Network Category for the interface.                 | `Disconnected`, `NoTraffic`, `Subnet`, `LocalNetwork`, `Internet` |
| **IPv6Connectivity** |            | `[String]` | Specifies the IPv4 Connection Value.                         | `Disconnected`, `NoTraffic`, `Subnet`, `LocalNetwork`, `Internet` |
| **NetworkCategory**  |            | `[String]` | Specifies the IPv6 Connection Value.                         | `Public`, `Private`                                               |

## Description

This resource is used to set a node's connection profile.

## Examples

### Example 1

Sets the Ethernet adapter to Public and IPv4/6 to Internet Connectivity.

```powershell
Configuration NetConnectionProfile_SetPublicEnableInternet_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetConnectionProfile SetPublicEnableInternet
        {
            InterfaceAlias   = 'Ethernet'
            NetworkCategory  = 'Public'
            IPv4Connectivity = 'Internet'
            IPv6Connectivity = 'Internet'
        }
    }
}
```

### Example 2

Sets the Ethernet adapter to Private but does not change
IPv4 or IPv6 connectivity.

```powershell
Configuration NetConnectionProfile_SetPrivate_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        NetConnectionProfile SetPrivate
        {
            InterfaceAlias   = 'Ethernet'
            NetworkCategory  = 'Private'
        }
    }
}
```

