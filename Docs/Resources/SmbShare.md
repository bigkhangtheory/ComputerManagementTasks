# SmbShare

## Parameters

| Parameter                 | Attribute  | DataType     | Description                                                                                                                                                                                                      | Allowed Values                                           |
| ------------------------- | ---------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| **Name**                  | *Required* | `[String]`   | Specifies the name of the SMB share.                                                                                                                                                                             |                                                          |
| **Path**                  | Required   | `[String]`   | Specifies the path of the SMB share.                                                                                                                                                                             |                                                          |
| **Description**           |            | `[String]`   | Specifies the description of the SMB share.                                                                                                                                                                      |                                                          |
| **ChangeAccess**          |            | `[String[]]` | Specifies which accounts will be granted modify permission to access the SMB share.                                                                                                                              |                                                          |
| **ConcurrentUserLimit**   |            | `[UInt32]`   | Specifies the maximum number of concurrently connected users that the new SMB share may accommodate. If this parameter is set to zero (0), then the number of users is unlimited. The default value is zero (0). |                                                          |
| **EncryptData**           |            | `[Boolean]`  | Indicates that the SMB share is encrypted.                                                                                                                                                                       |                                                          |
| **FolderEnumerationMode** |            | `[String]`   | Specifies which files and folders in the new SMB share are visible to users.                                                                                                                                     | `AccessBased`, `Unrestricted`                            |
| **CachingMode**           |            | `[String]`   | Specifies the caching mode of the offline files for the SMB share.                                                                                                                                               | `None`, `Manual`, `Programs`, `Documents`, `BranchCache` |
| **ContinuouslyAvailable** |            | `[Boolean]`  | Specifies whether the SMB share should be continuously available.                                                                                                                                                |                                                          |
| **FullAccess**            |            | `[String[]]` | Specifies which accounts are granted full permission to access the SMB share.                                                                                                                                    |                                                          |
| **NoAccess**              |            | `[String[]]` | Specifies which accounts are denied access to the SMB share.                                                                                                                                                     |                                                          |
| **ReadAccess**            |            | `[String[]]` | Specifies which accounts is granted read permission to access the SMB share.                                                                                                                                     |                                                          |
| **Ensure**                |            | `[String]`   | Specifies if the SMB share should be added or removed.                                                                                                                                                           | `Present`, `Absent`                                      |
| **Force**                 |            | `[Boolean]`  | Specifies if the SMB share is allowed to be dropped and recreated (required when the path changes).                                                                                                              |                                                          |
| **ScopeName**             |            | `[String]`   | Specifies the scope in which the share should be created.                                                                                                                                                        |                                                          |
| **ShareState**            | Read       | `[String]`   | Specifies the state of the SMB share.                                                                                                                                                                            |                                                          |
| **ShareType**             | Read       | `[String]`   | Specifies the type of the SMB share.                                                                                                                                                                             |                                                          |
| **ShadowCopy**            | Read       | `[Boolean]`  | Specifies if this SMB share is a ShadowCopy.                                                                                                                                                                     |                                                          |
| **Special**               | Read       | `[Boolean]`  | Specifies if this SMB share is a special share. E.g. an admin share, default shares, or IPC$ share.                                                                                                              |                                                          |

## Description

The resource is used to manage SMB shares, and access permissions to
SMB shares.

## Requirements

### Cluster Shares

The property `ContinuouslyAvailable` can only be set to `$true` when
the SMB share is a cluster share in a failover cluster. Also in the blog
[SMB Transparent Failover – making file shares continuously available](https://blogs.technet.microsoft.com/filecab/2016/03/25/smb-transparent-failover-making-file-shares-continuously-available-2)
by [Claus Joergensen](https://github.com/clausjor) it is mentioned that
SMB Transparent Failover does not support cluster disks with 8.3 name
generation enabled.

### Access permissions

It is not allowed to provide empty collections in the configuration for
the access permissions parameters. The configuration below will cause an
exception to be thrown.

```powershell
SmbShare 'Integration_Test'
{
    Name         = 'TestShare'
    Path         = 'C:\Temp'
    FullAccess   = @()
    ChangeAccess = @()
    ReadAccess   = @()
    NoAccess     = @()
}
```

The access permission parameters must either be all removed to manage
the access permission manually, or add at least one member to one of
the access permission parameters. If all the access permission parameters
are removed, then by design, the cmdlet New-SmbShare will add
the *Everyone* group with read access permission to the SMB share.
To prevent that, add a member to either access permission parameters.

## Examples

### Example 1

This example creates an SMB share named 'Temp' for the path 'C:\Temp',
using the default values of the cmdlet `New-SmbShare`.

.NOTES
To know the default values, see the documentation for the cmdlet
`New-SmbShare`.

```powershell
Configuration SmbShare_CreateShare_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        SmbShare 'TempShare'
        {
            Name = 'Temp'
            Path = 'C:\Temp'
        }
    }
}
```

### Example 2

This example creates an SMB share named 'Temp' for the path 'C:\Temp',
using specific values for each supported property.

.NOTES
Any other property not yet súpported will use the default values of the
cmdlet `New-SmbShare`.To know the default values, see the documentation
for the cmdlet `New-SmbShare`.

```powershell
Configuration SmbShare_CreateShareAllProperties_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        SmbShare 'TempShare'
        {
            Name = 'Temp'
            Path = 'C:\Temp'
            Description = 'Some description'
            ConcurrentUserLimit = 20
            EncryptData = $false
            FolderEnumerationMode = 'AccessBased'
            CachingMode = 'Manual'
            ContinuouslyAvailable = $false
            FullAccess = @()
            ChangeAccess = @('AdminUser1')
            ReadAccess = @('Everyone')
            NoAccess = @('DeniedUser1')
        }
    }
}
```

### Example 3

This example removes a SMB share named 'Temp'.

.NOTES
Path must be specified because it is a mandatory parameter,
but it can be set to any value.

```powershell
Configuration SmbShare_RemoveShare_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        SmbShare 'TempShare'
        {
            Ensure = 'Absent'
            Name = 'Temp'
            Path = 'NotUsed'
        }
    }
}
```

### Example 4

This example creates an SMB share named 'Share' for the path 'C:\Share1',
using the default values of the cmdlet `New-SmbShare`. If the share
already exists, it will drop the share and recreate it on the new path
because Force is set to true.

.NOTES
To know the default values, see the documentation for the cmdlet
`New-SmbShare`.

```powershell
Configuration SmbShare_RecreateShare_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        SmbShare 'RecreateShare'
        {
            Name = 'Share'
            Path = 'C:\Share1'
            Force = $true
        }
    }
}
```

