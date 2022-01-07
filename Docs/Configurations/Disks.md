# Disks

The **Disks** DSC configuration is used to initialize, format and mount the partition/volume as a drive letter.

<br />

## Project Information

|                  |                                                                                                                  |
| ---------------- | ---------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/Disks |
| **Dependencies** | [StorageDsc][StorageDsc]                                                                                         |
| **Resources**    | [Disk][Disk]                                                                                                   |

<br />

## Parameters

<br />

### Table. Attributes of `Disks`

| Parameter | Attribute  | DataType        | Description                  | Allowed Values |
| :-------- | :--------- | :-------------- | :--------------------------- | :------------- |
| **Disks** | *Required* | `[Hashtable[]]` | List of disk specifications. |                |

---

#### Table. Attributes of `Disks`

| Parameter              | Attribute  | DataType    | Description                                                                                                                                                   | Allowed Values                                       |
| :--------------------- | :--------- | :---------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------ | :--------------------------------------------------- |
| **DriveLetter**        | *Required* | `[String]`  | Specifies the identifier for which disk to modify.                                                                                                            |                                                      |
| **DiskId**             | *Required* | `[String]`  | Specifies the disk identifier for the disk to modify.                                                                                                         |                                                      |
| **DiskIdType**         |            | `[String]`  | Specifies the identifier type the DiskId contains. See additional notes in [Using Disk ID Types](#####using-disk-id-types).                                   | `Number` *(Default)*, `UniqueId`, `Guid`, `Location` |
| **PartitionStyle**     |            | `[String]`  | Specifies the partition style of the disk. Defaults to GPT.                                                                                                   | `MBR`, `GPT`                                         |
| **Size**               |            | `[UInt64]`  | Specifies the size of new volume. Leave empty to use the remaining free space.                                                                                |                                                      |
| **FSLabel**            |            | `[String]`  | Define volume label if required.                                                                                                                              |                                                      |
| **AllocationUnitSize** |            | `[UInt32]`  | Specifies the allocation unit size to use when formatting the volume.                                                                                         |                                                      |
| **FSFormat**           |            | `[String]`  | Specifies the file system format of the new volume.                                                                                                           | `NTFS`, `ReFS`                                       |
| **AllowDestructive**   |            | `[Boolean]` | Specifies if potentially destructive operations may occur.                                                                                                    |                                                      |
| **ClearDisk**          |            | `[Boolean]` | Specifies if the disks partition schema should be removed entirely, even if data and OEM partitions are present. Only possible with AllowDestructive enabled. |                                                      |

---

##### Using Disk ID Types

The disk to add the partition/volume to is selected by specifying the `DiskId` and optionally `DiskIdType`.

The `DiskId` value can be identified by follwing types:

- **Disk Number**
- **Unique Id**
- **Guid**
- **Location**

> **Important**: The **Disk Number** is not a reliable method of selecting a disk because it has been shown to change between reboots in some environments. It is recommended to use the **Unique Id** if possible.
{.is-warning}

The **Disk Number**, **Unique Id**_, **Guid** and **Location** can be identified for a disk on a target node by using the PowerShell command:

```powershell
$ Get-Disk | Select-Object -Property FriendlyName, DiskNumber, UniqueId, Guid, Location

FriendlyName : Intel Raid 5 Volume
DiskNumber   : 1
UniqueId     : 8DBF62B101000000001517FFFF0AEB84
Guid         : {81a93a9b-b437-4d45-b0b1-b4aeea9719ba}
Location     : Integrated : Bus 0 : Device 23 : Function 0 : Adapter 1 : Port 6 : Target 8 : LUN 0
```

> Note: The **Guid** for a disk is only assigned once the partition table for the disk has been created *(e.g. the disk has been initialized)*. Therefore to use this method of disk selection the disk must have been initialized by some other method.
{.is-info}

---

<br />

## Example `Disks`

```yaml
Disks:
  Disks:
    - DiskId:             0
      DiskIdType:         Number
      DriveLetter:        C
      PartitionStyle:     GPT
      FSLabel:            System
      Size:               1000000
      AllocationUnitSize: 4096
      FSFormat:           NTFS
      AllowDestructive:   true
      ClearDisk:          true

    - DiskId: 5E1E50A401000000001517FFFF0AEB81
      DiskIdType: UniqueId
      DriveLetter: D
      FSLabel: Data
      Size: 1GB
      AllocationUnitSize: 2KB
```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  Disks:
    merge_hash: deep
  Disks\Disks:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - DiskId

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

[StorageDsc]: https://github.com/dsccommunity/StorageDsc
[Disk]: https://github.com/dsccommunity/StorageDsc/wiki/Disk
[DiskAccessPath]: https://github.com/dsccommunity/StorageDsc/wiki/DiskAccessPath
[MountImage]: https://github.com/dsccommunity/StorageDsc/wiki/MountImage
[OpticalDiskDriveLetter]: https://github.com/dsccommunity/StorageDsc/wiki/OpticalDiskDriveLetter
[WaitForDisk]: https://github.com/dsccommunity/StorageDsc/wiki/WaitForDisk
[WaitForVolume]: https://github.com/dsccommunity/StorageDsc/wiki/WaitForVolume