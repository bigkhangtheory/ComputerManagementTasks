# SystemLocale

## Parameters

| Parameter            | Attribute  | DataType   | Description                                                          | Allowed Values |
| -------------------- | ---------- | ---------- | -------------------------------------------------------------------- | -------------- |
| **IsSingleInstance** | *Required* | `[String]` | Specifies the resource is a single instance, the value must be 'Yes' | `Yes`          |
| **SystemLocale**     | Required   | `[String]` | Specifies the System Locale.                                         |                |

## Description

Ths resource is used set the system locale on a Windows machine.

To get a list of valid Windows System Locales use the command:
`[System.Globalization.CultureInfo]::GetCultures([System.Globalization.CultureTypes]::AllCultures).name`

If the System Locale is changed by this resource, it will require the node
to reboot. If the LCM is not configured to allow restarting, the configuration
will not be able to be applied until a manual restart occurs.

## Examples

### Example 1

This example will set the System Locale of LocalHost to 'ja-JP'.
To use this example, run it using PowerShell.

```powershell
Configuration SystemLocale_SetSystemLocale_Config
{
    param
    (
        [Parameter()]
        [System.String[]]
        $NodeName = 'localhost'
    )

    Import-DSCResource -ModuleName ComputerManagementDsc

    Node $NodeName
    {
        SystemLocale SystemLocaleExample
        {
            IsSingleInstance = 'Yes'
            SystemLocale     = 'ja-JP'
        }
    }
}
```

