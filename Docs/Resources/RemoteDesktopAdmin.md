# RemoteDesktopAdmin

## Parameters

| Parameter              | Attribute  | DataType   | Description                                                                                                                                                | Allowed Values        |
| ---------------------- | ---------- | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| **IsSingleInstance**   | *Required* | `[String]` | Specifies the resource is a single instance, the value must be 'Yes'                                                                                       | `Yes`                 |
| **Ensure**             |            | `[String]` | Determines whether or not the computer should accept remote desktop connections.  Present sets the value to Enabled and Absent sets the value to Disabled. | `Present`, `Absent`   |
| **UserAuthentication** |            | `[String]` | Setting this value to Secure configures the machine to require Network Level Authentication (NLA) for remote desktop connections.                          | `Secure`, `NonSecure` |

## Description

This resource will manage the remote desktop administration settings on a computer.
This includes whether remote desktop connections are allowed or denied and whether
network level authentication is required.

## Examples

### Example 1

This configuration will enable Remote Desktop for Administration and set
the User Authentication to secure, i.e. to require Network Level Authentication

```powershell
Configuration RemoteDesktopAdmin_SetSecureRemoteDesktopAdmin_Config
{
    Import-DscResource -Module ComputerManagementDsc

    Node ('localhost')
    {
        RemoteDesktopAdmin RemoteDesktopSettings
        {
            IsSingleInstance   = 'yes'
            Ensure             = 'Present'
            UserAuthentication = 'Secure'
        }
    }
}
```

