# NetAdapterRsc

## Parameters

| Parameter     | Attribute  | DataType    | Description                                  | Allowed Values                                       |
| ------------- | ---------- | ----------- | -------------------------------------------- | ---------------------------------------------------- |
| **Name**      | *Required* | `[String]`  | Specifies the Name of network adapter.       |                                                      |
| **Protocol**  | Required   | `[String]`  | Specifies which protocol to make changes to. | `IPv4`, `IPv6`, `All`                                |
| **State**     | Required   | `[Boolean]` |                                              | Specifies whether RSC should be enabled or disabled. |  |
| **StateIPv4** | Read       | `[String]`  | Returns the current state of RSC for IPv4    |                                                      |
| **StateIPv6** | Read       | `[String]`  | Returns the current state of RSC for IPv6    |                                                      |

## Description

This resource is used to enable or disable RSC (Recv Segment Coalescing) for specific protocols on a network adapter.

## Examples

### Example 1

This configuration disables RSC for IPv6 on the network adapter.

```powershell
Configuration NetAdapterRsc_DisableRscIPv6_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterRsc DisableRscIPv6
        {
            Name = 'Ethernet'
            Protocol = 'IPv6'
            State = $false
        }
    }
}
```

### Example 2

This configuration disables RSC for IPv4 on the network adapter.

```powershell
Configuration NetAdapterRsc_DisableRscIPv4_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterRsc DisableRscIPv4
        {
            Name = 'Ethernet'
            Protocol = 'IPv4'
            State = $false
        }
    }
}
```

### Example 3

This configuration disables RSC on the network adapter.

```powershell
Configuration NetAdapterRsc_DisableRscAll_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterRsc DisableRscAll
        {
            Name = 'Ethernet'
            Protocol = 'All'
            State = $false
        }
    }
}
```

