# Bitlocker

The **Bitlocker** allows you to configure Bitlocker on a single disk, configure a TPM chip, or automatically enable Bitlocker on multiple disks.

<br />

## Project Information

|                  |                                                                                                                          |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/Bitlocker     |
| **Dependencies** | [xBitlocker][xBitlocker], [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]                                   |
| **Resources**    | [xBLTpm][xBLTpm], [xBLBitlocker][xBLBitlocker], [xBLAutoBitlocker][xBLAutoBitlocker], [xWindowsFeature][xWindowsFeature] |

<br />

## Parameters

<br />

### Table. Attributes of `Bitlocker`

| Parameter     | Attribute  | DataType        | Description                                                                                                                     | Allowed Values                           |
| :------------ | :--------- | :-------------- | :------------------------------------------------------------------------------------------------------------------------------ | :--------------------------------------- |
| **Tpm**       | *Required* | `[Hashtable]`   | Specifies an xBLTpm DSC resource, used to initilize a TPM chip on a target node.                                                | See [xBLTpm][xBLTpm]                     |
| **Disks**     | *Required* | `[Hashtable[]]` | Specifies a list of xBLBitlocker DSC resources to encrypt disks on target nodes.                                                | See [xBLBitlocker][xBLBitlocker]         |
| **AutoDisks** | *Required* | `[Hashtable[]]` | Specifies a list of xBLAutoBitlocker DSC resources used to automatically enable Bitlocker on drives of type Fixed or Removable. | See [xBLAutoBitlocker][xBLAutoBitlocker] |

---

#### Table. Attributes of `Tpm`

| Parameter                 | Attribute | DataType | Description                                                                                                                                   | Allowed Values |
| :------------------------ | :-------- | :------- | :-------------------------------------------------------------------------------------------------------------------------------------------- | :------------- |
| **AllowClear**            |           | `[bool]` | Indicates that the provisioning process clears the TPM, if necessary, to move the TPM closer to complying with Windows Server 2012 standards. |                |
| **AllowImmediateReboot**  |           | `[bool]` | Indicates that the provisioning process may send physical presence commands that require a user to be present in order to continue.           |                |
| **AllowPhysicalPresence** |           | `[bool]` | Whether the computer can rebooted immediately after initializing the TPM.                                                                     |                |

---

#### Table. Attributes of `Disks`

| Parameter                     | Attribute | DataType         | Description                                                                                                                                                                             | Allowed Values                                                                          |
| :---------------------------- | :-------- | :--------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------- |
| **MountPoint**                |           | `[string]`       | The MountPoint name as reported in `Get-BitLockerVolume`.                                                                                                                               |                                                                                         |
| **PrimaryProtector**          |           | `[string]`       | The type of key protector that will be used as the primary key protector.                                                                                                               | `PasswordProtector`, `RecoveryPasswordProtector`, `StartupKeyProtector`, `TpmProtector` |
| **AdAccountOrGroup**          |           | `[string]`       | Specifies an account using the format `Domain\User`.                                                                                                                                    |                                                                                         |
| **AdAccountOrGroupProtector** |           | `[bool]`         | Indicates that BitLocker uses an AD DS account as a protector for the volume encryption key.                                                                                            |                                                                                         |
| **AllowImmediateReboot**      |           | `[bool]`         | Whether the computer can be immediately rebooted after enabling Bitlocker on an OS drive. Defaults to `$false`.                                                                         |                                                                                         |
| **AutoUnlock**                |           | `[bool]`         | Whether volumes should be enabled for auto unlock using `Enable-BitlockerAutoUnlock`                                                                                                    |                                                                                         |
| **EncryptionMethod**          |           | `[string]`       | Specifies the encryption algorithm to be used on the volume                                                                                                                             | `Aes128`, `Aes256`                                                                      |
| **HardwareEncryption**        |           | `[bool]`         | Indicates that the volume uses hardware encryption.                                                                                                                                     |                                                                                         |
| **Password**                  |           | `[PSCredential]` | Specifies a secure string object that contains a password. Username doesn’t matter for the credential. Just put the Password in the Password field.                                     |                                                                                         |
| **PasswordProtector**         |           | `[bool]`         | Indicates that BitLocker uses a password as a protector for the volume encryption key.                                                                                                  |                                                                                         |
| **Pin**                       |           | `[PSCredential]` | Specifies a secure string object that contains a PIN. A `TpmProtector` must be used if Pin is used. Username doesn’t matter for the credential. Just put the Pin in the Password field. |                                                                                         |
| **RecoveryKeyPath**           |           | `[string]`       | Specifies a path to a recovery key.                                                                                                                                                     |                                                                                         |
| **RecoveryKeyProtector**      |           | `[bool]`         | Indicates that BitLocker uses a recovery key as a protector for the volume encryption key.                                                                                              |                                                                                         |
| **RecoveryPasswordProtector** |           | `[bool]`         | Indicates that BitLocker uses a recovery password as a protector for the volume encryption key.                                                                                         |                                                                                         |
| **Service**                   |           | `[bool]`         | Indicates that the system account for this computer unlocks the encrypted volume.                                                                                                       |                                                                                         |
| **SkipHardwareTest**          |           | `[bool]`         | Indicates that BitLocker does not perform a hardware test before it begins encryption.                                                                                                  |                                                                                         |
| **StartupKeyPath**            |           | `[string]`       | Specifies a path to a startup key.                                                                                                                                                      |                                                                                         |
| **StartupKeyProtector**       |           | `[bool]`         | Indicates that BitLocker uses a startup key as a protector for the volume encryption key.                                                                                               |                                                                                         |
| **TpmProtector**              |           | `[bool]`         | Indicates that BitLocker uses the TPM as a protector for the volume encryption key. If `TpmProtector` is used, it must be the `PrimaryProtector`.                                       |                                                                                         |
| **UsedSpaceOnly**             |           | `[bool]`         | Indicates that BitLocker does not encrypt disk space which contains unused data.                                                                                                        |                                                                                         |

---

#### Table. Attributes of `AutoDisks`

| Parameter                     | Attribute | DataType         | Description                                                                                                                                                                             | Allowed Values                                                                          |
| :---------------------------- | :-------- | :--------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------- |
| **DriveType**                 |           | `[string]`       | The type of volume, as reported by `Get-Volume`, to auto apply Bitlocker to                                                                                                             | `Fixed`, `Removable`                                                                    |
| **MinDiskCapacityGB**         |           | `[Int32]`        | If specified, only disks this size or greater will auto apply Bitlocker.                                                                                                                |                                                                                         |
| **PrimaryProtector**          |           | `[string]`       | The type of key protector that will be used as the primary key protector.                                                                                                               | `PasswordProtector`, `RecoveryPasswordProtector`, `StartupKeyProtector`, `TpmProtector` |
| **AdAccountOrGroup**          |           | `[string]`       | Specifies an account using the format `Domain\User`.                                                                                                                                    |                                                                                         |
| **AdAccountOrGroupProtector** |           | `[bool]`         | Indicates that BitLocker uses an AD DS account as a protector for the volume encryption key.                                                                                            |                                                                                         |
| **AllowImmediateReboot**      |           | `[bool]`         | Whether the computer can be immediately rebooted after enabling Bitlocker on an OS drive. Defaults to `$false`.                                                                         |                                                                                         |
| **AutoUnlock**                |           | `[bool]`         | Whether volumes should be enabled for auto unlock using `Enable-BitlockerAutoUnlock`                                                                                                    |                                                                                         |
| **EncryptionMethod**          |           | `[string]`       | Specifies the encryption algorithm to be used on the volume                                                                                                                             | `Aes128`, `Aes256`                                                                      |
| **HardwareEncryption**        |           | `[bool]`         | Indicates that the volume uses hardware encryption.                                                                                                                                     |                                                                                         |
| **Password**                  |           | `[PSCredential]` | Specifies a secure string object that contains a password. Username doesn’t matter for the credential. Just put the Password in the Password field.                                     |                                                                                         |
| **PasswordProtector**         |           | `[bool]`         | Indicates that BitLocker uses a password as a protector for the volume encryption key.                                                                                                  |                                                                                         |
| **Pin**                       |           | `[PSCredential]` | Specifies a secure string object that contains a PIN. A `TpmProtector` must be used if Pin is used. Username doesn’t matter for the credential. Just put the Pin in the Password field. |                                                                                         |
| **RecoveryKeyPath**           |           | `[string]`       | Specifies a path to a recovery key.                                                                                                                                                     |                                                                                         |
| **RecoveryKeyProtector**      |           | `[bool]`         | Indicates that BitLocker uses a recovery key as a protector for the volume encryption key.                                                                                              |                                                                                         |
| **RecoveryPasswordProtector** |           | `[bool]`         | Indicates that BitLocker uses a recovery password as a protector for the volume encryption key.                                                                                         |                                                                                         |
| **Service**                   |           | `[bool]`         | Indicates that the system account for this computer unlocks the encrypted volume.                                                                                                       |                                                                                         |
| **SkipHardwareTest**          |           | `[bool]`         | Indicates that BitLocker does not perform a hardware test before it begins encryption.                                                                                                  |                                                                                         |
| **StartupKeyPath**            |           | `[string]`       | Specifies a path to a startup key.                                                                                                                                                      |                                                                                         |
| **StartupKeyProtector**       |           | `[bool]`         | Indicates that BitLocker uses a startup key as a protector for the volume encryption key.                                                                                               |                                                                                         |
| **TpmProtector**              |           | `[bool]`         | Indicates that BitLocker uses the TPM as a protector for the volume encryption key. If `TpmProtector` is used, it must be the `PrimaryProtector`.                                       |                                                                                         |
| **UsedSpaceOnly**             |           | `[bool]`         | Indicates that BitLocker does not encrypt disk space which contains unused data.                                                                                                        |                                                                                         |

---

<br />

## Example `Bitlocker`

```yaml
Bitlocker:
  Tpm:
    AllowClear: False
    AllowPhysicalPresence: True
    AllowImmediateReboot: True

 Disks:
   # System Drive at first
   - MountPoint:                'C:'
     PrimaryProtector:          TpmProtector
     TpmProtector:              True
     AllowImmediateReboot:      True
     UsedSpaceOnly:             True
   - MountPoint:                'D:'
     PrimaryProtector:          RecoveryPasswordProtector
     StartupKeyProtector:       True
     StartupKeyPath:            'A:'
     RecoveryPasswordProtector: True
     AllowImmediateReboot:      True
     UsedSpaceOnly:             True
     
 AutoDisks:
   - DriveType:                 Fixed
     PrimaryProtector:          TpmProtector
     TpmProtector:              True
     UsedSpaceOnly:             True
   - DriveType:                 Removable
     MinDiskCapacityGB:         16
     PrimaryProtector:          RecoveryPasswordProtector
     StartupKeyProtector:       True
     StartupKeyPath:            'A:'
     RecoveryPasswordProtector: True
     UsedSpaceOnly:             True

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  Bitlocker:
    merge_hash: deep
  Bitlocker\Disks:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - MountPoint
  Bitlocker\AutoDisks:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - DriveType

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

[xBitlocker]: https://github.com/dsccommunity/xBitlocker
[xBLTpm]: https://github.com/dsccommunity/xBitlocker
[xBLBitlocker]: https://github.com/dsccommunity/xBitlocker
[xBLAutoBitlocker]: https://github.com/dsccommunity/xBitlocker