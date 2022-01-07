# WaitForVolume

## Parameters

| Parameter            | Attribute  | DataType   | Description                                                                  | Allowed Values |
| -------------------- | ---------- | ---------- | ---------------------------------------------------------------------------- | -------------- |
| **DriveLetter**      | *Required* | `[String]` | Specifies the drive letter of the volume to wait for.                        |                |
| **RetryIntervalSec** |            | `[UInt32]` | Specifies the number of seconds to wait for the volume to become available.  |                |
| **RetryCount**       |            | `[UInt32]` | The number of times to loop the retry interval while waiting for the volume. |                |

## Description

The resource is used to wait for a drive to be mounted and become available.

## Examples

### Example 1

This configuration will mount a VHD file and wait for it to become available.

```powershell
configuration WaitForVolume_VHD
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

### Example 2

This configuration will mount an ISO file as drive S:.

```powershell
configuration WaitForVolume_ISO
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

