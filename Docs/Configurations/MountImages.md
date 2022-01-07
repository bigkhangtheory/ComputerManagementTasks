# MountImages

The **MountImages** DSC configuration is used to mount or unmount an ISO/VHD disk image. It can be mounted as read-only (ISO, VHD, VHDx) or read/write (VHD, VHDx).

<br />

## Project Information

|                  |                                                                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/MountImages |
| **Dependencies** | [StorageDsc][StorageDsc], [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]                                 |
| **Resources**    | [MountImage][MountImage], [xWindowsFeature][xWindowsFeature]                                                           |

<br />

## Parameters

<br />

### Table. Attributes of `MountImages`

| Parameter  | Attribute | DataType        | Description                                   | Allowed Values |
| :--------- | :-------- | :-------------- | :-------------------------------------------- | :------------- |
| **Images** |           | `[Hashtable[]]` | A list of [MountImage][MountImage] resources. |                |

---

#### Table. Attributes of `Images`

| Parameter       | Attribute  | DataType   | Description                                                                                                                                              | Allowed Values                 |
| :-------------- | :--------- | :--------- | :------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------- |
| **ImagePath**   | *Required* | `[String]` | Specifies the path of the VHD or ISO file.                                                                                                               |                                |
| **DriveLetter** |            | `[String]` | Specifies the drive letter to mount this VHD or ISO to.                                                                                                  |                                |
| **StorageType** |            | `[String]` | Specifies the storage type of a file. If the StorageType parameter is not specified, then the storage type is determined by file extension.              | `ISO`, `VHD`, `VHDx`, `VHDSet` |
| **Access**      |            | `[String]` | Allows a VHD file to be mounted in read-only or read-write mode. ISO files are mounted in read-only mode regardless of what parameter value you provide. | `ReadOnly`, `ReadWrite`        |
| **Ensure**      |            | `[String]` | Determines whether the VHD or ISO should be mounted or not.                                                                                              | `Present`, `Absent`            |

---

<br />

## Example `MountImages`

```yaml
MountImages:
  Images:
    - ImagePath: C:\ISO\Test.iso
      DriveLetter: F
      StorageType: ISO
      Access: ReadOnly
      Ensure: Present

    - ImagePath: C:\ISO\Test.vhd
      DriveLetter: G
      StorageType: VHDx
      Access: ReadWrite

    - ImagePath: C:\ISO\Test2.iso

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  MountImages:
    merge_hash: deep
  MountImages\Images:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - ImagePath

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