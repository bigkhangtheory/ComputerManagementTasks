# MountImage

## Parameters

| Parameter       | Attribute  | DataType   | Description                                                                                                                                              | Allowed Values                 |
| --------------- | ---------- | ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| **ImagePath**   | *Required* | `[String]` | Specifies the path of the VHD or ISO file.                                                                                                               |                                |
| **DriveLetter** |            | `[String]` | Specifies the drive letter to mount this VHD or ISO to.                                                                                                  |                                |
| **StorageType** |            | `[String]` | Specifies the storage type of a file. If the StorageType parameter is not specified, then the storage type is determined by file extension.              | `ISO`, `VHD`, `VHDx`, `VHDSet` |
| **Access**      |            | `[String]` | Allows a VHD file to be mounted in read-only or read-write mode. ISO files are mounted in read-only mode regardless of what parameter value you provide. | `ReadOnly`, `ReadWrite`        |
| **Ensure**      |            | `[String]` | Determines whether the VHD or ISO should be mounted or not.                                                                                              | `Present`, `Absent`            |

## Description

The resource is used to mount or unmount an ISO/VHD disk image. It can be
mounted as read-only (ISO, VHD, VHDx) or read/write (VHD, VHDx).

## Examples

### Example 1

This configuration will unmount the ISO file 'c:\Sources\SQL.iso'
if mounted as a drive.

```powershell
configuration MountImage_DismountISO
{
    Import-DscResource -ModuleName StorageDsc

    MountImage ISO
    {
        ImagePath = 'c:\Sources\SQL.iso'
        Ensure = 'Absent'
    }
}
```

### Example 2

This configuration will mount an ISO file as drive S:.

```powershell
configuration MountImage_MountISO
{
    Import-DscResource -ModuleName StorageDsc

    MountImage ISO
    {
        ImagePath   = 'c:\Sources\SQL.iso'
        DriveLetter = 'S'
    }

    WaitForVolume WaitForISO
    {
        DriveLetter      = 'S'
        RetryIntervalSec = 5
        RetryCount       = 10
    }
}
```

### Example 3

This configuration will mount a VHD file and wait for it to become available.

```powershell
configuration MountImage_MountVHD
{
    Import-DscResource -ModuleName StorageDsc

    MountImage MountVHD
    {
        ImagePath   = 'd:\Data\Disk1.vhd'
        DriveLetter = 'V'
    }

    WaitForVolume WaitForVHD
    {
        DriveLetter      = 'V'
        RetryIntervalSec = 5
        RetryCount       = 10
    }
}
```

