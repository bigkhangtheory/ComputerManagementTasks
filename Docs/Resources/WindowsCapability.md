# WindowsCapability

## Parameters

| Parameter    | Attribute  | DataType   | Description                                                                                                                                                                                                                      | Allowed Values                       |
| ------------ | ---------- | ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| **Name**     | *Required* | `[String]` | Specifies the name of the Windows Capability.                                                                                                                                                                                    |                                      |
| **Ensure**   |            | `[String]` | Specifies whether the Windows Capability should be installed or uninstalled. To install the Windows Capability, set this property to Present. To uninstall the Windows Capability, set the property to Absent.                   | `Present`, `Absent`                  |
| **LogLevel** |            | `[String]` | Specifies the given Log Level of a Windows Capability. This is a write only parameter that is used when updating the status of a Windows Capability. If not specified, the default is 'WarningsInfo'.                            | `Errors`, `Warnings`, `WarningsInfo` |
| **LogPath**  |            | `[String]` | Specifies the full path and file name to log to. This is a write only parameter that is used when updating the status of a Windows Capability. If not specified, the default is '%WINDIR%\Logs\Dism\dism.log'.                   |                                      |
| **Source**   |            | `[String]` | Specifies the location of the files that are required to add a Windows capability package to an image. You can specify the Windows directory of a mounted image or a running Windows installation that is shared on the network. |                                      |

## Description

This resource enables installation or removal of a Windows Capability.

The LogLevel and LogPath parameters can be passed to the resource but
are not used to determine if the resource is in the desired state.

This is because the LogLevel and LogPath properties returned by
`Get-WindowsCapability` do not reflect the values that may have been
set with `Add-WindowsCapability` or `Remove-WindowsCapability`.

## Examples

### Example 1

Example script that adds the Windows Capability XPS.Viewer~~~~0.0.1.0

```powershell
Configuration WindowsCapability_AddWindowsCapability_Config
{
    Import-DSCResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        WindowsCapability XPSViewer
        {
            Name   = 'XPS.Viewer~~~~0.0.1.0'
            Ensure = 'Present'
        }
    }
}
```

### Example 2

Example script that removes the Windows Capability XPS.Viewer~~~~0.0.1.0

```powershell
Configuration WindowsCapability_RemoveWindowsCapability_Config
{
    Import-DSCResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        WindowsCapability XPSViewer
        {
            Name   = 'XPS.Viewer~~~~0.0.1.0'
            Ensure = 'Absent'
        }
    }
}
```

### Example 3

Example script that adds the Windows Capability OpenSSH.Client~~~~0.0.1.0
and set the LogLevel to log Errors only and write the Logfile to Path C:\Temp.

```powershell
Configuration WindowsCapability_AddWindowsCapabilitywithLogLevelandLogPath_Config
{
    Import-DSCResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        WindowsCapability OpenSSHClient
        {
            Name     = 'OpenSSH.Client~~~~0.0.1.0'
            Ensure   = 'Present'
            LogLevel = 'Errors'
            LogPath  = 'C:\Temp\Logfile.log'
        }
    }
}
```

### Example 4

Example script that adds the Windows Capability OpenSSH.Client~~~~0.0.1.0
and set the LogLevel to log Errors only and write the Logfile to Path C:\Temp.
This also uses the Source path for the installation.

```powershell
Configuration WindowsCapability_AddWindowsCapabilitywithLogLevelLogPathandSource_Config
{
    Import-DSCResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        WindowsCapability OpenSSHClient
        {
            Name     = 'OpenSSH.Client~~~~0.0.1.0'
            Ensure   = 'Present'
            LogLevel = 'Errors'
            LogPath  = 'C:\Temp\Logfile.log'
            Source   = 'F:\Source\FOD\LanguagesAndOptionalFeatures'
        }
    }
}
```

