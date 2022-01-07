# WaitForDisk

## Parameters

| Parameter            | Attribute  | DataType    | Description                                                                | Allowed Values                           |
| -------------------- | ---------- | ----------- | -------------------------------------------------------------------------- | ---------------------------------------- |
| **DiskId**           | *Required* | `[String]`  | Specifies the disk identifier for the disk to wait for.                    |                                          |
| **DiskIdType**       |            | `[String]`  | Specifies the identifier type the DiskId contains. Defaults to Number.     | `Number`, `UniqueId`, `Guid`, `Location` |
| **RetryIntervalSec** |            | `[UInt32]`  | Specifies the number of seconds to wait for the disk to become available.  |                                          |
| **RetryCount**       |            | `[UInt32]`  | The number of times to loop the retry interval while waiting for the disk. |                                          |
| **IsAvailable**      | Read       | `[Boolean]` | Will indicate whether Disk is available.                                   |                                          |

## Description

This resource is used to wait for a disk to become available.
The disk to wait for is selected by specifying the _DiskId_ and optionally
_DiskIdType_.
The _DiskId_ value can be a _Disk Number_, _Unique Id_, _Guid_ or _Location_.

**Important: The _Disk Number_ is not a reliable method of selecting a disk because
it has been shown to change between reboots in some environments.
It is recommended to use the _Unique Id_ if possible.**

The _Disk Number_, _Unique Id_, _Guid_ and _Location_ can be identified for a
disk by using the PowerShell command:

```powershell
Get-Disk | Select-Object -Property FriendlyName,DiskNumber,UniqueId,Guid,Location
```

Note: The _Guid_ for a disk is only assigned once the partition table for the disk
has been created (e.g. the disk has been initialized). Therefore to use this method
of disk selection the disk must have been initialized by some other method.

## Known Issues

### Null Location

The _Location_ for a disk may be `null` for some types of disk,
e.g. file-based virtual disks. Physical disks or Virtual disks provided via a
hypervisor or other hardware virtualization platform should not be affected.

## Examples

### Example 1

This configuration will wait for disk 2 to become available, and then make the disk available as
two new formatted volumes, 'G' and 'J', with 'J' using all available space after 'G' has been
created. It also creates a new ReFS formated volume on Disk 3 attached as drive letter 'S'.

```powershell
Configuration WaitForDisk_InitializeDataDisk
{
    Import-DSCResource -ModuleName StorageDsc

    Node localhost
    {
        WaitForDisk Disk2
        {
             DiskId = 2
             RetryIntervalSec = 60
             RetryCount = 60
        }

        Disk GVolume
        {
             DiskId = 2
             DriveLetter = 'G'
             Size = 10GB
        }

        Disk JVolume
        {
             DiskId = 2
             DriveLetter = 'J'
             FSLabel = 'Data'
             DependsOn = '[Disk]GVolume'
        }

        Disk DataVolume
        {
             DiskId = 3
             DriveLetter = 'S'
             Size = 100GB
             FSFormat = 'ReFS'
             AllocationUnitSize = 64KB
        }
    }
}
```

### Example 2

This configuration will wait for disk 2 to become available, and then make the disk available as
two new formatted volumes mounted to folders c:\SQLData and c:\SQLLog, with c:\SQLLog using all
available space after c:\SQLData has been created.

```powershell
Configuration WaitForDisk_InitializeDataDiskWithAccessPath
{
    Import-DSCResource -ModuleName StorageDsc

    Node localhost
    {
        WaitForDisk Disk2
        {
             DiskId = 2
             RetryIntervalSec = 60
             RetryCount = 60
        }

        DiskAccessPath DataVolume
        {
             DiskId = 2
             AccessPath = 'c:\SQLData'
             Size = 10GB
             FSLabel = 'SQLData1'
             DependsOn = '[WaitForDisk]Disk2'
        }

        DiskAccessPath LogVolume
        {
             DiskId = 2
             AccessPath = 'c:\SQLLog'
             FSLabel = 'SQLLog1'
             DependsOn = '[DiskAccessPath]DataVolume'
        }
    }
}
```

### Example 3

This configuration will wait for disk with Unique Id '5E1E50A401000000001517FFFF0AEB84' to become
available, and then make the disk available as two new formatted volumes mounted to folders
c:\SQLData and c:\SQLLog, with c:\SQLLog using all available space after c:\SQLData has been created.

```powershell
Configuration WaitForDisk_InitializeDataDiskWithAccessPathUsingUniqueId
{
    Import-DSCResource -ModuleName StorageDsc

    Node localhost
    {
        WaitForDisk Disk2
        {
             DiskId = '5E1E50A401000000001517FFFF0AEB84'
             DiskIdType = 'UniqueId'
             RetryIntervalSec = 60
             RetryCount = 60
        }

        DiskAccessPath DataVolume
        {
             DiskId = '5E1E50A401000000001517FFFF0AEB84'
             DiskIdType = 'UniqueId'
             AccessPath = 'c:\SQLData'
             Size = 10GB
             FSLabel = 'SQLData1'
             DependsOn = '[WaitForDisk]Disk2'
        }

        DiskAccessPath LogVolume
        {
             DiskId = '5E1E50A401000000001517FFFF0AEB84'
             DiskIdType = 'UniqueId'
             AccessPath = 'c:\SQLLog'
             FSLabel = 'SQLLog1'
             DependsOn = '[DiskAccessPath]DataVolume'
        }
    }
}
```

