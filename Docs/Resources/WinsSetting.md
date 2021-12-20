# WinsSetting

## Parameters

| Parameter            | Attribute  | DataType    | Description                                                           | Allowed Values                                                                                          |
| -------------------- | ---------- | ----------- | --------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| **IsSingleInstance** | *Required* | `[String]`  | Specifies the resource is a single instance, the value must be 'Yes'. | `Yes`                                                                                                   |
| **EnableLmHosts**    |            | `[Boolean]` |                                                                       | Specifies if LMHOSTS lookup should be enabled for all network adapters with TCP/IP enabled.             |  |
| **EnableDns**        |            | `[Boolean]` |                                                                       | Specifies if DNS is enabled for name resolution over WINS for all network adapters with TCP/IP enabled. |  |

## Description

This resource is used to configure the WINS settings that enable or disable
LMHOSTS lookups and enable or disable DNS for name resolution over WINS.

## Examples

### Example 1

Disable LMHOSTS lookup and disable using DNS for WINS name resolution.

```powershell
Configuration WinSetting_ConfigureWinsSetting_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        WinsSetting ConfigureWinsSettings
        {
            IsSingleInstance = 'Yes'
            EnableLMHOSTS    = $false
            EnableDNS        = $false
        }
    }
}
```

