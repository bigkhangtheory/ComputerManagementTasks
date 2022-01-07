# FileSystemAccessRule

## Parameters

| Parameter | Attribute | DataType | Description | Allowed Values |
| --- | --- | --- | --- | --- |
| **Path** | Key | String | The path to the item that should have permissions set. | |
| **Identity** | Key | String | The identity to set permissions for. | |
| **Rights** | Write | StringArray[] | The permissions to include in this rule. Optional if Ensure is set to value 'Absent'. | `ListDirectory`, `ReadData`, `WriteData`, `CreateFiles`, `CreateDirectories`, `AppendData`, `ReadExtendedAttributes`, `WriteExtendedAttributes`, `Traverse`, `ExecuteFile`, `DeleteSubdirectoriesAndFiles`, `ReadAttributes`, `WriteAttributes`, `Write`, `Delete`, `ReadPermissions`, `Read`, `ReadAndExecute`, `Modify`, `ChangePermissions`, `TakeOwnership`, `Synchronize`, `FullControl` |
| **Ensure** | Write | String | Present to create the rule, Absent to remove an existing rule. Default value is 'Present'. | `Present`, `Absent` |
| **ProcessOnlyOnActiveNode** | Write | Boolean | Specifies that the resource will only determine if a change is needed if the target node is the active host of the filesystem object. The user the configuration is run as must have permission to the Windows Server Failover Cluster. | |
| **IsActiveNode** | Read | Boolean | Determines if the current node is actively hosting the filesystem object. | |

## Description

The DSC resource `FileSystemAccessRule` will manage permissions on paths
in the file system.

If the parameter `Rights` is not used or no rights are provided (using
`Rights = @()`), and `Ensure` is set to `'Absent'` then all the allow
access rules for the identity will be removed. If specific rights are
specified then only those rights will be removed when `Ensure` is set to
`'Absent'`.

When calling the method `Get` the property `Ensure` will be set to `'Present'`
if the identity is found with an access rule on the specified path.

If the resource is used for a path that belongs to a Windows Server Failover
Cluster's cluster disk partition and if the node it runs on is not the
active node, then the method `Get` will return the value `Present` for
the property `Ensure`, but the property `Rights` will be empty.

## Requirements

- Currently only works with the Windows file system.

## Examples

### Example 1

This configuration will add the full control right to the folder
'C:\some\path' for the identity NT AUTHORITY\NETWORK SERVICE, and
add the read right to the folder 'C:\other\path' for the local group
Users.

```powershell
Configuration FileSystemAccessRule_SetPermissionOnFolder_Config
{
    Import-DscResource -ModuleName FileSystemDsc

    node localhost
    {
        FileSystemAccessRule 'AddRightFullControl'
        {
            Path = 'C:\some\path'
            Identity = 'NT AUTHORITY\NETWORK SERVICE'
            Rights = @('FullControl')
        }

        FileSystemAccessRule 'AddRightRead'
        {
            Path = 'C:\other\path'
            Identity = 'Users'
            Rights = @('Read')
        }
    }
}
```

