# IEEnhancedSecurityConfiguration

## Parameters

| Parameter           | Attribute  | DataType    | Description                                                                                                             | Allowed Values            |
| ------------------- | ---------- | ----------- | ----------------------------------------------------------------------------------------------------------------------- | ------------------------- |
| **Role**            | *Required* | `[String]`  | Specifies the role for which the IE Enhanced Security Configuration should be changed.                                  | `Administrators`, `Users` |
| **Enabled**         | *Required* | `[Boolean]` | Specifies if IE Enhanced Security Configuration should be enabled or disabled.                                          |                           |
| **SuppressRestart** |            | `[Boolean]` | Specifies if a restart of the node should be suppressed. By default the node will be restarted if the value is changed. |                           |

## Description

This resource allows you to configure the IE Enhanced Security Configuration
for administrator or user roles.

## Examples

### Example 1

This configuration will disable the IE Enhanced Security Configuration for
administrators.

```powershell
Configuration IEEnhancedSecurityConfiguration_DisableForAdministrators_Config
{
    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        IEEnhancedSecurityConfiguration 'DisableForAdministrators'
        {
            Role    = 'Administrators'
            Enabled = $false
        }
    }
}
```

### Example 2

This configuration will disable the IE Enhanced Security Configuration for
users.

```powershell
Configuration IEEnhancedSecurityConfiguration_DisableForUsers_Config
{
    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        IEEnhancedSecurityConfiguration 'DisableForUsers'
        {
            Role    = 'Users'
            Enabled = $false
        }
    }
}
```

