# SmbFileShares



<br />

## Project Information

|                  |                                                                                                                          |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/SmbFileShares |
| **Dependencies** | [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]                                 |
| **Resources**    | [xWindowsFeature][xWindowsFeature]                                                               |

<br />

## Parameters

<br />

### Table. Attributes of `SmbFileShares`

| Parameter              | Attribute  | DataType        | Description                                                                                         | Allowed Values |
| :--------------------- | :--------- | :-------------- | :-------------------------------------------------------------------------------------------------- | :------------- |

---

#### Table. Attributes of ``

| Parameter              | Attribute  | DataType        | Description                                                                                         | Allowed Values |
| :--------------------- | :--------- | :-------------- | :-------------------------------------------------------------------------------------------------- | :------------- |

---

<br />

## Example `SmbFileShares`

```yaml
SmbFileShares:
ServerConfiguration: 
   AnnounceComment: SMB server hello 
   AnnounceServer: true 
   AsynchronousCredits: 64 
   AuditSmb1Access: false 
   AutoDisconnectTimeout: 15 
   AutoShareServer: true 
   AutoShareWorkstation: true 
   CachedOpenLimit: 10 
   DurableHandleV2TimeoutInSeconds: 180 
   EnableAuthenticateUserSharing: false 
   EnableDownlevelTimewarp: false 
   EnableForcedLogoff: true 
   EnableLeasing: true 
   EnableMultiChannel: true 
   EnableOplocks: true 
   EnableSecuritySignature: false 
   EnableSMB1Protocol: false 
   EnableSMB2Protocol: true 
   EnableStrictNameChecking: true 
   EncryptData: false 
   IrpStackSize: 15 
   KeepAliveTime: 2 
   MaxChannelPerSession: 32 
   MaxMpxCount: 50 
   MaxSessionPerConnection: 16384 
   MaxThreadsPerQueue: 20 
   MaxWorkItems: 1 
   NullSessionPipes: NullPipe 
   NullSessionShares: NullShare 
   OplockBreakWait: 35 
   PendingClientTimeoutInSeconds: 120 
   RejectUnencryptedAccess: true 
   RequireSecuritySignature: false 
   ServerHidden: true 
   Smb2CreditsMax: 2048 
   Smb2CreditsMin: 128 
   SmbServerNameHardeningLevel: 0 
   TreatHostAsStableStorage: false 
   ValidateAliasNotCircular: true 
   ValidateShareScope: true 
   ValidateShareScopeNotAliased: true 
   ValidateTargetName: true 
 Shares: 
   - Name: Temp 
     Path: C:\Temp 
     Description: Some description 
     ConcurrentUserLimit: 20 
     EncryptData: false 
     FolderEnumerationMode: AccessBased 
     CachingMode: Manual 
     ContinuouslyAvailable: false 
     FullAccess: 
     ChangeAccess: AdminUser1 
     ReadAccess: Everyone 
     NoAccess: 
       - DeniedUser1 
       - DeniedUser2 
   - Name: Temp2 
     Path: C:\Temp2 
   - Name: Temp3 
     Path: C:\ 
   - Name: Temp4$ 
     Path: C:\ 
   - Name: Temp-Old 
     Ensure: Absent 

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  SmbFileShares:
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
