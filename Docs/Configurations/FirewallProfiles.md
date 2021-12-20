# FirewallProfiles

The **FirewallProfiles** DSC configuration is used to enable or disable and configure Windows Firewall with Advanced Security profiles.

<br />

## Project Information

|                  |                                                                                                                                                 |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/FirewallProfiles |
| **Dependencies** | [NetworkingDsc][NetworkingDsc], [PSDesiredStateConfiguration][PSDesiredStateConfiguration]                                                      |
| **Resources**    | [FirewallProfile][FirewallProfile]                                                                                                              |

<br />

## Parameters

<br />

### Table. Attributes of `FirewallProfiles`

| Parameter    | Attribute | DataType        | Description                                                          | Allowed Values |
| :----------- | :-------- | :-------------- | :------------------------------------------------------------------- | :------------- |
| **Profiles** |           | `[Hashtable[]]` | Specifies a list of Windows Firewall Advanced Profiles to configure. |                |

---

<br />

#### Table. Attributes of `Profiles`

| Parameter                           | Attribute  | DataType     | Description                                                                                                          | Allowed Values                    |
| ----------------------------------- | ---------- | ------------ | -------------------------------------------------------------------------------------------------------------------- | --------------------------------- |
| **Name**                            | *Required* | `[String]`   | The name of the firewall profile to configure.                                                                       | `Domain`, `Public`, `Private`     |
| **Enabled**                         |            | `[String]`   | Specifies that devolution is activated.                                                                              | `True`, `False`, `NotConfigured`  |
| **AllowInboundRules**               |            | `[String]`   | Specifies that the firewall blocks inbound traffic.                                                                  | `True`, `False`, `NotConfigured`  |
| **AllowLocalFirewallRules**         |            | `[String]`   | Specifies that the local firewall rules should be merged into the effective policy along with Group Policy settings. | `True`, `False`, `NotConfigured`  |
| **AllowLocalIPsecRules**            |            | `[String]`   | Specifies that the local IPsec rules should be merged into the effective policy along with Group Policy settings.    | `True`, `False`, `NotConfigured`  |
| **AllowUnicastResponseToMulticast** |            | `[String]`   | Allows unicast responses to multi-cast traffic.                                                                      | `True`, `False`, `NotConfigured`  |
| **AllowUserApps**                   |            | `[String]`   | Specifies that traffic from local user applications is allowed through the firewall.                                 | `True`, `False`, `NotConfigured`  |
| **AllowUserPorts**                  |            | `[String]`   | Specifies that traffic is allowed through local user ports.                                                          | `True`, `False`, `NotConfigured`  |
| **DefaultInboundAction**            |            | `[String]`   | Specifies how to filter inbound traffic.                                                                             | `Block`, `Allow`, `NotConfigured` |
| **DefaultOutboundAction**           |            | `[String]`   | Specifies how to filter outbound traffic.                                                                            | `Block`, `Allow`, `NotConfigured` |
| **DisabledInterfaceAliases**        |            | `[String[]]` | Specifies a list of interfaces on which firewall settings are excluded.                                              |                                   |
| **EnableStealthModeForIPsec**       |            | `[String]`   | Enables stealth mode for IPsec traffic.                                                                              | `True`, `False`, `NotConfigured`  |
| **LogAllowed**                      |            | `[String]`   | Specifies how to log the allowed packets in the location specified by the LogFileName parameter.                     | `True`, `False`, `NotConfigured`  |
| **LogBlocked**                      |            | `[String]`   | Specifies how to log the dropped packets in the location specified by the LogFileName parameter.                     | `True`, `False`, `NotConfigured`  |
| **LogFileName**                     |            | `[String]`   | Specifies the path and filename of the file to which Windows Server writes log entries.                              |                                   |
| **LogIgnored**                      |            | `[String]`   | Specifies how to log the ignored packets in the location specified by the LogFileName parameter.                     | `True`, `False`, `NotConfigured`  |
| **LogMaxSizeKilobytes**             |            | `[UInt64]`   | Specifies the maximum file size of the log, in kilobytes. The acceptable values are: 1 through 32767.                |                                   |
| **NotifyOnListen**                  |            | `[String]`   | Allows the notification of listening for inbound connections by a service.                                           | `True`, `False`, `NotConfigured`  |

---

## Example *FirewallProfiles*

```yaml
FirewallProfiles:
  Profiles:
    - Name: Domain
      Enabled: true
      DefaultInboundAction: Block
      DefaultOutboundAction: Allow
      AllowInboundRules: true
      AllowLocalFirewallRules: true
      AllowUserApps: true
      AllowUserPorts: true
      NotifyOnListen: true
      LogFileName: C:\Windows\System32\LogFiles\Firewall\firewall.log
      LogMaxSizeKilobytes: 16384
      LogAllowed: false
      LogBlocked: true
      LogIgnored: NotConfigured

    - Name: Private
      Enabled: True
      DefaultInboundAction: Block
      DefaultOutboundAction: Allow
      AllowInboundRules: True
      AllowLocalFirewallRules: False
```

<br />

## Lookup Options in `Datum.yml`

```yaml
lookup_options:

  FirewallProfiles:
    merge_hash: deep
  FirewallProfiles\Profiles:
    merge_baseType_array: Unique
    merge_hash_array: DeepTuple
    merge_options:
      tuple_keys:
        - Name
        - Enabled
```

[NetworkingDsc]: https://github.com/dsccommunity/NetworkingDsc
[PSDesiredStateConfiguration]: https://docs.microsoft.com/en-us/powershell/module/psdesiredstateconfiguration/?view=powershell-7.1
[FirewallProfile]: https://github.com/dsccommunity/NetworkingDsc/wiki/FirewallProfile
[WindowsFeature]: https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/windowsfeatureresource?view=powershell-7.2