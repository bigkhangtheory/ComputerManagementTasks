# PowerPlan

## Parameters

| Parameter            | Attribute  | DataType    | Description                                                           | Allowed Values |
| -------------------- | ---------- | ----------- | --------------------------------------------------------------------- | -------------- |
| **IsSingleInstance** | *Required* | `[String]`  | Specifies the resource is a single instance, the value must be 'Yes'. | `Yes`          |
| **Name**             | Required   | `[String]`  | The name or GUID of the power plan to activate.                       |                |
| **IsActive**         | Read       | `[Boolean]` | Determines if the power plan is active.                               |                |

## Description

The resource allows specifying a power plan to activate.

## Examples

### Example 1

This examples sets the active power plan to the 'High performance' plan.

```powershell
Configuration PowerPlan_SetPowerPlan_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        PowerPlan SetPlanHighPerformance
        {
            IsSingleInstance = 'Yes'
            Name             = 'High performance'
        }
    }
}
```

