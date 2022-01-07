# OpticalDiskDriveLetter

## Parameters

| Parameter       | Attribute  | DataType   | Description                                                                                                                                                         | Allowed Values      |
| --------------- | ---------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- |
| **DiskId**      | *Required* | `[String]` | Specifies the optical disk number for the disk to assign the drive letter to.                                                                                       |                     |
| **DriveLetter** | *Required* | `[String]` | Specifies the drive letter to assign to the optical disk. Can be a single letter, optionally followed by a colon. This value is ignored if Ensure is set to Absent. |                     |
| **Ensure**      |            | `[String]` | Determines whether a drive letter should be assigned to the optical disk. Defaults to 'Present'.                                                                    | `Present`, `Absent` |

## Description

The resource is used to set the drive letter of an optical disk drive (e.g.
a CDROM or DVD drive).

It can be used to set the drive letter of a specific optical disk drive if
there are multiple in the system by specifying a value greater than 1 for
the `DiskId` parameter.

In a system with a single optical disk drive then the `DiskId` should
be set to 1.

In systems with multiple optical disks, the `DiskId` should be set to
the ordinal number of the required optical disk found in the list
returned when executing the following cmdlet:

```powershell
Get-CimInstance -ClassName Win32_CDROMDrive
```

Warning: Adding and removing optical drive devices to a system may cause the
order the optical drives appear in the system to change. Therefore, the
drive ordinal number may be affected in these situations.

It is designed to ignore _temporary_ optical disk drives that are created
when mounting ISOs on Windows Server 2012+.

With the Device ID, we look for the length of the string after the final
backslash (crude, but appears to work so far).

Example:

```powershell
# DeviceID for a virtual drive in a Hyper-V VM
"SCSI\CDROM&VEN_MSFT&PROD_VIRTUAL_DVD-ROM\**000006**"

# DeviceID for a mounted ISO in a Hyper-V VM
"SCSI\CDROM&VEN_MSFT&PROD_VIRTUAL_DVD-ROM\**2&1F4ADFFE&0&000002**"
```

## Examples

### Example 1

This configuration will set the drive letter of the first
optical disk drive in the system to 'Z'.

```powershell
Configuration OpticalDiskDriveLetter_SetDriveLetter
{
    Import-DSCResource -ModuleName StorageDsc

    Node localhost
    {
        OpticalDiskDriveLetter SetFirstOpticalDiskDriveLetterToZ
        {
            DiskId      = 1
            DriveLetter = 'Z'
        }
    }
}
```

### Example 2

This configuration will remove the drive letter of the first
optical disk drive.

```powershell
Configuration OpticalDiskDriveLetter_RemoveDriveLetter
{
    Import-DSCResource -ModuleName StorageDsc

    Node localhost
    {
        OpticalDiskDriveLetter RemoveFirstOpticalDiskDriveLetter
        {
            DiskId      = 1
            DriveLetter = 'X' # This value is ignored
            Ensure      = 'Absent'
        }
    }
}
```

### Example 3

This configuration will set the drive letter of the first
optical disk drive in the system to 'Y'. It will set the
drive letter of the second optical disk drive to 'Z'. It
will remove the drive letter from the third optical disk
drive in the system.

```powershell
Configuration OpticalDiskDriveLetter_SetDriveLetterMulti
{
    Import-DSCResource -ModuleName StorageDsc

    Node localhost
    {
        OpticalDiskDriveLetter SetFirstOpticalDiskDriveLetterToY
        {
            DiskId      = 1
            DriveLetter = 'Y'
        }

        OpticalDiskDriveLetter SetSecondOpticalDiskDriveLetterToZ
        {
            DiskId      = 2
            DriveLetter = 'Z'
        }

        OpticalDiskDriveLetter RemoveThirdOpticalDiskDriveLetter
        {
            DiskId      = 3
            DriveLetter = 'A'
            Ensure      = 'Absent'
        }
    }
}
```

