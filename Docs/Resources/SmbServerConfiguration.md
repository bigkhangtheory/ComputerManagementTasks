# SmbServerConfiguration

## Parameters

| Parameter                           | Attribute  | DataType    | Description                                                                                                                     | Allowed Values |
| ----------------------------------- | ---------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| **IsSingleInstance**                | *Required* | `[String]`  | Specifies the resource is a single instance, the value must be 'Yes'                                                            | `Yes`          |
| **AnnounceComment**                 |            | `[String]`  | Specifies the announce comment string.                                                                                          |                |
| **AnnounceServer**                  |            | `[Boolean]` | Specifies whether this server announces itself by using browser announcements.                                                  |                |
| **AsynchronousCredits**             |            | `[UInt32]`  | Specifies the asynchronous credits.                                                                                             |                |
| **AuditSmb1Access**                 |            | `[Boolean]` | Enables auditing of SMB version 1 protocol in Windows Event Log.                                                                |                |
| **AutoDisconnectTimeout**           |            | `[UInt32]`  | Specifies the auto disconnect time-out.                                                                                         |                |
| **AutoShareServer**                 |            | `[Boolean]` | Specifies that the default server shares are shared out.                                                                        |                |
| **AutoShareWorkstation**            |            | `[Boolean]` | Specifies whether the default workstation shares are shared out.                                                                |                |
| **CachedOpenLimit**                 |            | `[UInt32]`  | Specifies the maximum number of cached open files.                                                                              |                |
| **DurableHandleV2TimeoutInSeconds** |            | `[UInt32]`  | Specifies the durable handle v2 time-out period, in seconds.                                                                    |                |
| **EnableAuthenticateUserSharing**   |            | `[Boolean]` | Specifies whether authenticate user sharing is enabled.                                                                         |                |
| **EnableDownlevelTimewarp**         |            | `[Boolean]` | Specifies whether down-level timewarp support is disabled.                                                                      |                |
| **EnableForcedLogoff**              |            | `[Boolean]` | Specifies whether forced logoff is enabled.                                                                                     |                |
| **EnableLeasing**                   |            | `[Boolean]` | Specifies whether leasing is disabled.                                                                                          |                |
| **EnableMultiChannel**              |            | `[Boolean]` | Specifies whether multi-channel is disabled.                                                                                    |                |
| **EnableOplocks**                   |            | `[Boolean]` | Specifies whether the opportunistic locks are enabled.                                                                          |                |
| **EnableSMB1Protocol**              |            | `[Boolean]` | Specifies whether the SMB1 protocol is enabled.                                                                                 |                |
| **EnableSMB2Protocol**              |            | `[Boolean]` | Specifies whether the SMB2 protocol is enabled.                                                                                 |                |
| **EnableSecuritySignature**         |            | `[Boolean]` | Specifies whether the security signature is enabled.                                                                            |                |
| **EnableStrictNameChecking**        |            | `[Boolean]` | Specifies whether the server should perform strict name checking on incoming connects.                                          |                |
| **EncryptData**                     |            | `[Boolean]` | Specifies whether the sessions established on this server are encrypted.                                                        |                |
| **IrpStackSize**                    |            | `[UInt32]`  | Specifies the default IRP stack size.                                                                                           |                |
| **KeepAliveTime**                   |            | `[UInt32]`  | Specifies the keep alive time.                                                                                                  |                |
| **MaxChannelPerSession**            |            | `[UInt32]`  | Specifies the maximum channels per session.                                                                                     |                |
| **MaxMpxCount**                     |            | `[UInt32]`  | Specifies the maximum MPX count for SMB1.                                                                                       |                |
| **MaxSessionPerConnection**         |            | `[UInt32]`  | Specifies the maximum sessions per connection.                                                                                  |                |
| **MaxThreadsPerQueue**              |            | `[UInt32]`  | Specifies the maximum threads per queue.                                                                                        |                |
| **MaxWorkItems**                    |            | `[UInt32]`  | Specifies the maximum SMB1 work items.                                                                                          |                |
| **NullSessionPipes**                |            | `[String]`  | Specifies the null session pipes.                                                                                               |                |
| **NullSessionShares**               |            | `[String]`  | Specifies the null session shares.                                                                                              |                |
| **OplockBreakWait**                 |            | `[UInt32]`  | Specifies how long the create caller waits for an opportunistic lock break.                                                     |                |
| **PendingClientTimeoutInSeconds**   |            | `[UInt32]`  | Specifies the pending client time-out period, in seconds.                                                                       |                |
| **RejectUnencryptedAccess**         |            | `[Boolean]` | Specifies whether the client that does not support encryption is denied access if it attempts to connect to an encrypted share. |                |
| **RequireSecuritySignature**        |            | `[Boolean]` | Specifies whether the security signature is required.                                                                           |                |
| **ServerHidden**                    |            | `[Boolean]` | Specifies whether the server announces itself.                                                                                  |                |
| **Smb2CreditsMax**                  |            | `[UInt32]`  | Specifies the maximum SMB2 credits.                                                                                             |                |
| **Smb2CreditsMin**                  |            | `[UInt32]`  | Specifies the minimum SMB2 credits.                                                                                             |                |
| **SmbServerNameHardeningLevel**     |            | `[UInt32]`  | Specifies the SMB Service name hardening level.                                                                                 |                |
| **TreatHostAsStableStorage**        |            | `[Boolean]` | Specifies whether the host is treated as the stable storage.                                                                    |                |
| **ValidateAliasNotCircular**        |            | `[Boolean]` | Specifies whether the aliases that are not circular are validated.                                                              |                |
| **ValidateShareScope**              |            | `[Boolean]` | Specifies whether the existence of share scopes is checked during share creation.                                               |                |
| **ValidateShareScopeNotAliased**    |            | `[Boolean]` | Specifies whether the share scope being aliased is validated.                                                                   |                |
| **ValidateTargetName**              |            | `[Boolean]` | Specifies whether the target name is validated.                                                                                 |                |

## Description

The resource is used to manage SMB Server Settings.

## Requirements

Windows Server 2012 or newer.

## Examples

### Example 1

This example configures all supported SMB Server settings for a node
to ensure they are set to known values.

```powershell
Configuration SmbServerConfiguration_AllProperties_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        SmbServerConfiguration SmbServer
        {
            IsSingleInstance                = 'Yes'
            AnnounceComment                 = 'SMB server hello'
            AnnounceServer                  = $true
            AsynchronousCredits             = 64
            AuditSmb1Access                 = $false
            AutoDisconnectTimeout           = 15
            AutoShareServer                 = $true
            AutoShareWorkstation            = $true
            CachedOpenLimit                 = 10
            DurableHandleV2TimeoutInSeconds = 180
            EnableAuthenticateUserSharing   = $false
            EnableDownlevelTimewarp         = $false
            EnableForcedLogoff              = $true
            EnableLeasing                   = $true
            EnableMultiChannel              = $true
            EnableOplocks                   = $true
            EnableSecuritySignature         = $false
            EnableSMB1Protocol              = $false
            EnableSMB2Protocol              = $true
            EnableStrictNameChecking        = $true
            EncryptData                     = $false
            IrpStackSize                    = 15
            KeepAliveTime                   = 2
            MaxChannelPerSession            = 32
            MaxMpxCount                     = 50
            MaxSessionPerConnection         = 16384
            MaxThreadsPerQueue              = 20
            MaxWorkItems                    = 1
            NullSessionPipes                = 'NullPipe'
            NullSessionShares               = 'NullShare'
            OplockBreakWait                 = 35
            PendingClientTimeoutInSeconds   = 120
            RejectUnencryptedAccess         = $true
            RequireSecuritySignature        = $false
            ServerHidden                    = $true
            Smb2CreditsMax                  = 2048
            Smb2CreditsMin                  = 128
            SmbServerNameHardeningLevel     = 0
            TreatHostAsStableStorage        = $false
            ValidateAliasNotCircular        = $true
            ValidateShareScope              = $true
            ValidateShareScopeNotAliased    = $true
            ValidateTargetName              = $true
        }
    }
}
```

### Example 2

This example configures the SMB Server to disable SMB1.

```powershell
Configuration SmbServerConfiguration_DisableSmb1_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        SmbServerConfiguration SmbServer
        {
            IsSingleInstance                = 'Yes'
            AuditSmb1Access                 = $false
            EnableSMB1Protocol              = $false
        }
    }
}
```

