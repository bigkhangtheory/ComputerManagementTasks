# NetAdapterLso

## Parameters

| Parameter    | Attribute  | DataType    | Description                                  | Allowed Values                                       |
| ------------ | ---------- | ----------- | -------------------------------------------- | ---------------------------------------------------- |
| **Name**     | *Required* | `[String]`  | Specifies the name of network adapter.       |                                                      |
| **Protocol** | *Required* | `[String]`  | Specifies which protocol to make changes to. | `V1IPv4`, `IPv4`, `IPv6`                             |
| **State**    | *Required* | `[Boolean]` |                                              | Specifies whether LSO should be enabled or disabled. |  |

## Description

This resource is used to enable or disable LSO for specific protocols on a
network adapter.

The following table shows configuration overlap with [NetAdapterAdvancedProperty](https://github.com/dsccommunity/NetworkingDsc/wiki/NetAdapterAdvancedProperty).

| NetAdapterLso |     | NetAdapterAdvancedProperty |
| ------------- | --- | -------------------------- |
| V1IPv4        | =   | Not Available              |
| IPv4          | =   | *LsoV2IPv4                 |
| IPv6          | =   | *LsoV2IPv6                 |

## Examples

### Example 1

This configuration disables LSO for IPv6 on the network adapter.

```powershell
Configuration NetAdapterLso_DisableLsoIPv6_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterLso DisableLsoIPv6
        {
            Name     = 'Ethernet'
            Protocol = 'IPv6'
            State    = $false
        }
    }
}
```

### Example 2

This configuration disables LSO for IPv4 on the network adapter.

```powershell
Configuration NetAdapterLso_DisableLsoIPv4_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterLso DisableLsoIPv4
        {
            Name     = 'Ethernet'
            Protocol = 'IPv4'
            State    = $false
        }
    }
}
```

