# TimeZone

## Parameters

| Parameter            | Attribute  | DataType   | Description                                                           | Allowed Values |
| -------------------- | ---------- | ---------- | --------------------------------------------------------------------- | -------------- |
| **IsSingleInstance** | *Required* | `[String]` | Specifies the resource is a single instance, the value must be 'Yes'. | `Yes`          |
| **TimeZone**         | *Required* | `[String]` | Specifies the TimeZone.                                               |                |

## Description

The resource will use the `Get-TimeZone` cmdlet to get the current
time zone. If `Get-TimeZone` is not available them CIM will be used to retrieve
the current time zone. To update the time zone, .NET reflection will be used to
update the time zone if required. If .NET reflection is not supported on the node
(in the case of Nano Server) then tzutil.exe will be used to set the time zone.

## Examples

### Example 1

This example sets the current time zone on the node
to 'Tonga Standard Time'.

```powershell
Configuration TimeZone_SetTimeZone_Config
{
    Import-DSCResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        TimeZone TimeZoneExample
        {
            IsSingleInstance = 'Yes'
            TimeZone         = 'Tonga Standard Time'
        }
    }
}
```

