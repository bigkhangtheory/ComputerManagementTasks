# ComputerSettings

The **ComputerSettings** DSC configuration configures a computer by changing its name and description and modifying its Active Directory domain or workgroup membership.

This configuration can also be used to define the target node's **Timezone**, **PowerPlan**, and **SystemLocale**.

<br />

## Project Information

|                  |                                                                                                                             |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/ComputerSettings |
| **Dependencies** | [ComputerManagementDsc][ComputerManagementDsc], [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]                |
| **Resources**    | [Computer][Computer], [TimeZone][TimeZone], [SystemLocale][SystemLocale], [PowerPlan][PowerPlan]                            |

<br />

## Parameters

<br />

### Table. Attributes of `ComputerSettings`

| Parameter         | Attribute  | DataType         | Description                                                                                     | Allowed Values                                           |
| :---------------- | :--------- | :--------------- | :---------------------------------------------------------------------------------------------- | :------------------------------------------------------- |
| **Name**          | *Required* | `[String]`       | The desired computer name.                                                                      |                                                          |
| **Description**   |            | `[String]`       | The value assigned here will be set as the local computer description.                          |                                                          |
| **DomainName**    |            | `[String]`       | The name of the domain to join.                                                                 |                                                          |
| **Server**        |            | `[String]`       | The Active Directory Domain Controller to use to join the domain                                |                                                          |
| **JoinOU**        |            | `[String]`       | The distinguished name of the organizational unit that the computer account will be created in. |                                                          |
| **Credential**    |            | `[PSCredential]` | Credential to be used to join a domain.                                                         |                                                          |
| **WorkGroupName** |            | `[String]`       | The name of the workgroup.                                                                      |                                                          |
| **TimeZone**      |            | `[String]`       | Specifies the TimeZone ID.                                                                      | See [Windows Time Zone IDs](####windows-time-zone-ids)   |
| **SystemLocale**  |            | `[String]`       | Specifies the System Locale.                                                                    | See [Windows System Locales](####windows-system-locales) |
| **Name**          |            | `[String]`       | The name or GUID of the power plan to activate.                                                 | `High performance`, `Balanced`, `Power saving`           |

---

#### Windows Time Zone IDs

| ID                                  | UTC Offset | Display Name                                    |
| ----------------------------------- | ---------- | ----------------------------------------------- |
| **Alaskan Standard Time**           | -09:00:00  | (UTC-09:00) Alaska                              |
| **Pacific Standard Time**           | -08:00:00  | (UTC-08:00) Pacific Time (US & Canada)          |
| **Pacific Standard Time (Mexico)**  | -08:00:00  | (UTC-08:00) Baja California                     |
| **Mountain Standard Time**          | -07:00:00  | (UTC-07:00) Mountain Time (US & Canada)         |
| **Yukon Standard Time**             | -07:00:00  | (UTC-07:00) Yukon                               |
| **US Mountain Standard Time**       | -07:00:00  | (UTC-07:00) Arizona                             |
| **Mountain Standard Time (Mexico)** | -07:00:00  | (UTC-07:00) Chihuahua, La Paz, Mazatlan         |
| **Central Standard Time (Mexico)**  | -06:00:00  | (UTC-06:00) Guadalajara, Mexico City, Monterrey |
| **Canada Central Standard Time**    | -06:00:00  | (UTC-06:00) Saskatchewan                        |
| **Easter Island Standard Time**     | -06:00:00  | (UTC-06:00) Easter Island                       |
| **Central America Standard Time**   | -06:00:00  | (UTC-06:00) Central America                     |
| **Central Standard Time**           | -06:00:00  | (UTC-06:00) Central Time (US & Canada)          |
| **Cuba Standard Time**              | -05:00:00  | (UTC-05:00) Havana                              |
| **US Eastern Standard Time**        | -05:00:00  | (UTC-05:00) Indiana (East)                      |
| **Eastern Standard Time (Mexico)**  | -05:00:00  | (UTC-05:00) Chetumal                            |
| **Eastern Standard Time**           | -05:00:00  | (UTC-05:00) Eastern Time (US & Canada)          |

---

#### Windows System Locales

To get a list of valid Windows System Locales use the command:

```powershell
[System.Globalization.CultureInfo]::GetCultures([System.Globalization.CultureTypes]::AllCultures)
```

If the System Locale is changed by this resource, it will require the node to reboot. If the LCM is not configured to allow restarting, the configuration will not be able to be applied until a manual restart occurs.

---

<br />

## Example `ComputerSettings`

```yaml
ComputerSettings:
  Name: TestServer
  Description: This is a test server
  DomainName: example.com
  JoinOU: 'OU=Servers,DC=example,DC=com'
  TimeZone: Eastern Standard Time
  PowerPlan: High performance
  SystemLocale: en-US

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  ComputerSettings:
    merge_hash: deep

```

<br />

[AccessControlDsc]: https://github.com/mcollera/AccessControlDsc
[Chocolatey]: https://github.com/gaelcolas/Chocolatey
[ComputerManagementDsc]: https://github.com/dsccommunity/ComputerManagementDsc
[xPSDesiredStateConfiguration]: https://github.com/dsccommunity/xPSDesiredStateConfiguration

[AccessControlResourceHelper]: https://github.com/mcollera/AccessControlDsc
[ActiveDirectoryAccessEntry]: https://github.com/mcollera/AccessControlDsc
[ActiveDirectoryAuditRuleEntry]: https://github.com/mcollera/AccessControlDsc
[FileSystemAuditRuleEntry]: https://github.com/mcollera/AccessControlDsc
[NTFSAccessEntry]: https://github.com/mcollera/AccessControlDsc
[RegistryAccessEntry]: https://github.com/mcollera/AccessControlDsc

[ChocolateyFeature]: https://github.com/gaelcolas/Chocolatey
[ChocolateyPackage]: https://github.com/gaelcolas/Chocolatey
[ChocolateyPin]: https://github.com/gaelcolas/Chocolatey
[ChocolateySetting]: https://github.com/gaelcolas/Chocolatey
[ChocolateySoftware]: https://github.com/gaelcolas/Chocolatey
[ChocolateySource]: https://github.com/gaelcolas/Chocolatey

[Computer]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/Computer
[IEEnhancedSecurityConfiguration]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/IEEnhancedSecurityConfiguration
[OfflineDomainJoin]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/OfflineDomainJoin
[PendingReboot]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/PendingReboot
[PowerPlan]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/PowerPlan
[PowerShellExecutionPolicy]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/PowerShellExecutionPolicy
[RemoteDesktopAdmin]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/RemoteDesktopAdmin
[ScheduledTask]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/ScheduledTask
[SmbServerConfiguration]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/SmbServerConfiguration
[SmbShare]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/SmbShare
[SystemLocale]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/SystemLocale
[TimeZone]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/TimeZone
[UserAccountControl]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/UserAccountControl
[VirtualMemory]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/VirtualMemory
[WindowsCapability]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/WindowsCapability
[WindowsEventLog]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/WindowsEventLog
[xWindowsFeature]: https://github.com/dsccommunity/xPSDesiredStateConfiguration

