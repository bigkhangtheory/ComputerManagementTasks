# NetAdapterBinding

## Parameters

| Parameter          | Attribute  | DataType   | Description                                                                                                 | Allowed Values                 |
| ------------------ | ---------- | ---------- | ----------------------------------------------------------------------------------------------------------- | ------------------------------ |
| **InterfaceAlias** | *Required* | `[String]` | Specifies the alias of a network interface. Supports the use of '*'.                                        |                                |
| **ComponentId**    | *Required* | `[String]` | Specifies the underlying name of the transport or filter in the following form - ms_xxxx, such as ms_tcpip. |                                |
| **State**          |            | `[String]` | Specifies if the component ID for the Interface should be Enabled or Disabled.                              | `Enabled`, `Disabled`          |
| **CurrentState**   | Read       | `[String]` | Returns the current state of the component ID for the Interfaces.                                           | `Enabled`, `Disabled`, `Mixed` |

## Description

This resource is used to bind or unbind transport or filters to a network interface.

## Examples

### Example 1

Disabling IPv6 for the Ethernet adapter.

```powershell
Configuration NetAdapterBinding_DisableIPv6_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterBinding DisableIPv6
        {
            InterfaceAlias = 'Ethernet'
            ComponentId    = 'ms_tcpip6'
            State          = 'Disabled'
        }
    }
}
```

