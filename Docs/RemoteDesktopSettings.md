# RemoteDesktopSettings

The **RemoteDesktopSettings** resource will manage the remote desktop administration settings on a computer. This includes whether remote desktop connections are allowed or denied and whether network level authentication is required, as well as, Remote Desktop session time limits.

<br />

## Project Information

|                  |                                                                                                                                                      |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://prod1gitlab.mapcom.local/dsc/configurations/ComputerManagementTasks/-/tree/master/ComputerManagementTasks/DscResources/RemoteDesktopSettings |
| **Dependencies** | [ComputerManagementDsc][ComputerManagementDsc], [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]                                         |
| **Resources**    | [RemoteDesktopAdmin][RemoteDesktopAdmin], [xRegistry][xRegistry]                                                                                     |

<br />

## Parameters

<br />

### Table. Attributes of `RemoteDesktopSettings`

| Parameter                      | Attribute  | DataType    | Description                                                                                                                                                                                                                                      | Allowed Values                                                                                                                                                                                                        |
| :----------------------------- | :--------- | :---------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **RemoteConnections**          | *Required* | `[Boolean]` | Determines whether or not the computer should accept remote desktop connections.                                                                                                                                                                 |                                                                                                                                                                                                                       |
| **NetworkLevelAuthentication** |            | `[Boolean]` | Setting this value to Secure configures the machine to require Network Level Authentication (NLA) for remote desktop connections.                                                                                                                |                                                                                                                                                                                                                       |
| **IdleTimeLimit**              |            | `[String]`  | Specifies the maximum amount of time that an active Remote Desktop Services session can be idle (without user input) before it is automatically disconnected.                                                                                    | `Never`, `1 minute`, `5 minutes`, `10 minutes`, `15 minutes`, `30 minutes`, `1 hour`, `2 hours`, `3 hours`, `6 hours`, `8 hours`, `12 hours`, `16 hours`, `18 hours`, `1 day`, `2 days`, `3 days`, `4 days`, `5 days` |
| **DisconnectedTimeLimit**      |            | `[String]`  | Specifies the maximum amount of time that a disconnected session remains active on the server. By default, Remote Desktop Services allows users to disconnect from a Remote Desktop Services session without logging off and ending the session. | `Never`, `1 minute`, `5 minutes`, `10 minutes`, `15 minutes`, `30 minutes`, `1 hour`, `2 hours`, `3 hours`, `6 hours`, `8 hours`, `12 hours`, `16 hours`, `18 hours`, `1 day`, `2 days`, `3 days`, `4 days`, `5 days` |
| **EndSessionAfterIdleLimit**   |            | `[Boolean]` | Specifies whether to end a Remote Desktop Services session that has timed out instead of disconnecting it.                                                                                                                                       |                                                                                                                                                                                                                       |
---

---

## Example *RemoteDesktopSettings*

```yaml
RemoteDesktopSettings:
  RemoteConnections: true
  NetworkLevelAuthentication: true
  IdleTimeLimit: 15 minutes
  DisconnectedTimeLimit: 8 hours
  EndSessionAfterIdle: true
```

<br />

## Lookup Options in `Datum.yml`

```yaml
lookup_options:

  RemoteDesktopSettings:
    merge_hash: deep
```

[ComputerManagementDsc]: https://github.com/dsccommunity/ComputerManagementDsc
[PSDesiredStateConfiguration]: https://docs.microsoft.com/en-us/powershell/module/psdesiredstateconfiguration/?view=powershell-7.1
[xPSDesiredSateConfiguration]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xRegistry]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[RemoteDesktopAdmin]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/RemoteDesktopAdmin
[WindowsFeature]: https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/windowsfeatureresource?view=powershell-7.2