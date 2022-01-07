# WindowsEventForwarding

The **WindowsEventForwarding** DSC configuration is used to configure a server to become an Event Collector role and create complex Subscriptions.

<br />

## Project Information

|                  |                                                                                                                                   |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/WindowsEventForwarding |
| **Dependencies** | [xWindowsEventForwarding][xWindowsEventForwarding]                                                                                |
| **Resources**    | [xWEFCollector][xWEFCollector], [xWEFSubscription][xWEFSubscription]                                                              |

<br />

## Parameters

<br />

### Table. Attributes of `WindowsEventForwarding`

| Parameter          | Attribute                      | DataType      | Description                                                                                                                                                                                                    | Allowed Values        |
| :----------------- | :----------------------------- | :------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------- |
| **NodeType**       | `Required`                     | `[String]`    | Defines the type of the current node. On a Collector node at least one Subscription must be defined. On a Source node the machine account of the Collector will be added to the local group Event Log Readers. | `Collector`, `Source` |
| **CollectorName**  | `Required` *(on Source nodes)* | `[String]`    | Machine account of the Collector node.                                                                                                                                                                         |                       |
| **FixWsManUrlAcl** |                                | `[Boolean]`   | Fix WsMan communication problem on Windows Server see KB4494462: Events are not forwarded if the collector is running Windows Server. Fix is only supported on NodeType Collector                              |                       |
| **Subscriptions**  |                                | `Hashtable[]` | List of complex Subscriptions. Note: Subscriptions are only supported on NodeType Collector                                                                                                                    |                       |

---

#### Table. Attributes of `Subscriptions`

| Parameter                        | Attribute | DataType     | Description                                                                                                                                                                | Allowed Values                            |
| :------------------------------- | :-------- | :----------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------- |
| **SubscriptionID**               |           | `[String]`   | Name of the Subscription                                                                                                                                                   |                                           |
| **SubscriptionType**             |           | `[String]`   | Type of Subscription to create                                                                                                                                             | `CollectorInitiated`, `SourceInitiated`   |
| **Description**                  |           | `[String]`   | Description of the Collector subscription                                                                                                                                  |                                           |
| **Address**                      |           | `[String[]]` | Expects an array of source node FQDNs.                                                                                                                                     |                                           |
| **AllowedSourceDomainComputers** |           | `[String]`   | In Source Initiated scenario this SDDL determines who can push events. Default: `O:NSG:NSD:(A;;GA;;;DC)(A;;GA;;;NS)` which equates to Domain Computers and Network Service |                                           |
| **ContentFormat**                |           | `[String]`   | Format that event logs will be submitted in                                                                                                                                |                                           |
| **CredentialsType**              |           | `[String]`   | Sets the credential type used for authenticating to WinRM. This attribute is only supported for `CollectorInitiated` subscriptions.                                        | `Basic`, `Default`, `Digest`, `Negotiate` |
| **DeliveryMode**                 |           | `[String]`   | Configures whether the collector will pull events from source nodes or if the source nodes will push events to the collector.                                              | `Pull`, `Push`                            |
| **Enabled**                      |           | `[String]`   | Sets whether the subscription will be enabled.                                                                                                                             | `True`, `False`                           |
| **Ensure**                       |           | `[String]`   | Determines whether to validate or remove the scubscription                                                                                                                 | `Present`, `Absent`                       |
| **HeartBeatInterval**            |           | `[UInt64]`   | Frequency to verify connectivity                                                                                                                                           |                                           |
| **Locale**                       |           | `[String]`   | Sets the subscription Locale                                                                                                                                               | Default: `en-US`                          |
| **LogFile**                      |           | `[String]`   | Sets the event log that the collected events will be written to                                                                                                            | Default: `ForwardedEvents`                |
| **MaxItems**                     |           | `[Int32]`    | The number of events that can occur on the source before they are submitted to the collector.                                                                              | Default: `1`                              |
| **MaxLatencyTime**               |           | `[UInt64]`   | The maximum amount of time that can pass before events are submitted to the collector.                                                                                     | Default: `20000`                          |
| **Query**                        |           | `[String[]]` | The maximum amount of time that can pass before events are submitted to the collector.                                                                                     | Default: `20000`                          |
| **ReadExistingEvents**           |           | `[String]`   | Should the collector read existing or only new events                                                                                                                      | `True`, `False`                           |
| **TransportName**                |           | `[String]`   | Determines whether to require SSL                                                                                                                                          | `HTTP`, `HTTPS`                           |
| **TransportPort**                |           | `[String]`   | Set the port number that WinRM should use to make a connection                                                                                                             | Default: `5985`                           |

---

<br />

## Example `Collector` node with `CollectorInitiated` subscriptions

```yaml
WindowsEventForwarding:
  NodeType: Collector
  Subscriptions:
    - SubscriptionID: TestSub
      Ensure: Present
      SubscriptionType: CollectorInitiated
      Address:
        - tester1.example.com
        - tester2.example.com
```

<br />

## Example `Source` node with `CollectorInitiated` subscriptions

```yaml
WindowsEventForwarding:
  NodeType:      Source
  CollectorName: EXAMPLE\collectorserver$
```

<br />

## Example `Collector` node with `SourceInitiated` subscriptions

```yaml
WindowsEventForwarding:
  NodeType: Collector
  FixWsManUrlAcl: true
  Subscriptions:
    - SubscriptionID: Domain Computer Events
      Ensure: Present
      Description: Important security events from domain computers
      SubscriptionType: SourceInitiated
      AllowedSourceDomainComputers: 'O:NSG:BAD:P(A;;GA;;;DC)(A;;GA;;;DD)S:'  # Domain Computers & Domain Controllers
      Query:
        - 'Security:*[System[(Level=1  or Level=2 or Level=3)]]'
```

<br />

## Example `Source` node with `SourceInitiated` subscriptions

```yaml
RegistryPolicies:
  Values:
    - Key: "Software\\Policies\\Microsoft\\Windows\\EventLog\\EventForwarding\\SubscriptionManager"
      ValueName: 1
      TargetType: ComputerConfiguration
      ValueData: 'Server=http://collectorserver.example.com:5985/wsman/SubscriptionManager/WEC,Refresh=300'
      ValueType: String
      Ensure: Present

    - Key: "Software\\Policies\\Microsoft\\Windows\\EventLog\\Security"
      ValueName: ChannelAccess
      TargetType: ComputerConfiguration
      ValueData: 'O:BAG:SYD:(A;;0xf0005;;;SY)(A;;0x5;;;BA)(A;;0x1;;;S-1-5-32-573)(A;;0x1;;;NS)'
      ValueType: String
      Ensure: Present

    - Key: "System\\CurrentControlSet\\Services\\EventLog\\Security"
      ValueName: CustomSD
      TargetType: ComputerConfiguration
      ValueData: 'O:BAG:SYD:(A;;0xf0005;;;SY)(A;;0x5;;;BA)(A;;0x1;;;S-1-5-32-573)(A;;0x1;;;NS)'
      ValueType: String
      Ensure: Present
```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  WindowsEventForwarding:
    merge_hash: deep
  WindowsEventForwarding\Subscription:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - SubscriptionID

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
[xWEFCollector]: https://github.com/dsccommunity/xWindowsEventForwarding
[xWEFSubscription]: https://github.com/dsccommunity/xWindowsEventForwarding
[xWindowsEventForwarding]: https://github.com/dsccommunity/xWindowsEventForwarding