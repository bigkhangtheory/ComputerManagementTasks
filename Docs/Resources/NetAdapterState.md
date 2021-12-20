# NetAdapterState

## Parameters

| Parameter | Attribute  | DataType   | Description                                        | Allowed Values        |
| --------- | ---------- | ---------- | -------------------------------------------------- | --------------------- |
| **Name**  | *Required* | `[String]` | Specifies the name of network adapter.             |                       |
| **State** | Required   | `[String]` | Specifies the desired state of the network adapter | `Enabled`, `Disabled` |

## Description

This resource is used to enable or disable a network adapter.

## Examples

### Example 1

This configuration enables the network adapter named Ethernet.

```powershell
Configuration NetAdapterState_Enable_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterState EnableEthernet
        {
            Name     = 'Ethernet'
            State    = 'Enabled'
        }
    }
}
```

### Example 2

This configuration disables the network adapter named Ethernet.

```powershell
Configuration NetAdapterState_Disable_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterState EnableEthernet
        {
            Name     = 'Ethernet'
            State    = 'Disabled'
        }
    }
}
```

