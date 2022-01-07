# FilesAndFolders

The **FilesAndFolders** DSC configuration provides a mechanism to manage files and folders, along with file system permissions, on the target node.

<br />

## Project Information

|                  |                                                                                                                            |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/FilesAndFolders |
| **Dependencies** | [FileSystemDsc][FileSystemDsc], [PSDesiredStateConfiguration][PSDesiredStateConfiguration]                                 |
| **Resources**    | [File][File], [FileSystemAccessRule][FileSystemAccessRule]                                                                 |

<br />

## Parameters

<br />

### Table. Attributes of `FilesAndFolders`

| Parameter | Attribute | DataType        | Description                                         | Allowed Values |
| :-------- | :-------- | :-------------- | :-------------------------------------------------- | :------------- |
| **Items** |           | `[Hashtable[]]` | A list of files and directories on the target node. |                |

---

#### Table. Attributes of `Items`

The table below are valid attributes when the resource is a `Directory` type.

| Parameter           | Attribute  | DataType         | Description                                                                                                   | Allowed Values                            |
| :------------------ | :--------- | :--------------- | :------------------------------------------------------------------------------------------------------------ | :---------------------------------------- |
| **DestinationPath** | *Required* | `[string]`       | The file system path location on the target node.                                                             |                                           |
| **Type**            |            | `[string]`       | The type of file system resource being configured. This table is for type `Directory`.                        | `Directory`, `File` *(Default)*           |
| **SourcePath**      |            | `[string]`       | The path from which to copy the folder resource.                                                              |                                           |
| **Attributes**      |            | `[string[]]`     | The desired state of the attributes for the directory.                                                        | `Archive`, `Hidden`, `ReadOnly`, `System` |
| **MatchSource**     |            | `[bool]`         | Determines if the resource should monitor for new files added to the source directory after the initial copy. |                                           |
| **Force**           |            | `[bool]`         | Overrides access operations, including deleting a non-empty directory.                                        |                                           |
| **Recurse**         |            | `[bool]`         | Performs the state operation recursively to all directory content, subdirectories, and subdirectory content.  |                                           |
| **Credential**      |            | `[PSCredential]` | The credentials that are required to access resources, such as source files.                                  |                                           |
| **Ensure**          |            | `[string]`       | Determines whether the directory and contents at the `DestinationPath` should exist or not.                   | `Present` *(Default)*, `Absent`           |
| **Permissions**     |            | `[Hashtable[]]`  | A list of file system access rules for the directory resource.                                                |                                           |

---

The table below are valid attributes when the resource is a `File` type.

| Parameter            | Attribute  | DataType         | Description                                                                                                                  | Allowed Values                                               |
| :------------------- | :--------- | :--------------- | :--------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------- |
| **DestinationPath**  | *Required* | `[string]`       | The file system path location on the target node.                                                                            |                                                              |
| **Type**             |            | `[string]`       | The type of file system resource being configured. This table is for type `File`.                                            | `Directory`, `File` *(Default)*                              |
| **SourcePath**       |            | `[string]`       | The path from which to copy the file resource.                                                                               |                                                              |
| **Attributes**       |            | `[string[]]`     | The desired state of the attributes for the targeted file.                                                                   | `Archive`, `Hidden`, `ReadOnly`, `System`                    |
| **Checksum**         |            | `[string]`       | The checksum type to use when determining whether two files are the same.                                                    | `CreatedDate`, `ModifiedDate`, `SHA-1`, `SHA-256`, `SHA-512` |
| **Contents**         |            | `[String]`       | Specity literal string contents to be appended to the file resource.                                                         |                                                              |
| **ContentsFromFile** |            | `[string]`       | Loading contents from the specified file during DSC pipeline builds. Can reference a file located in the project repository. |                                                              |
| **Force**            |            | `[bool]`         | Overrides access operations, including overwriting an existing file.                                                         |                                                              |
| **Credential**       |            | `[PSCredential]` | The credentials that are required to access resources, such as source files.                                                 |                                                              |
| **Ensure**           |            | `[string]`       | Determines whether the directory and contents at the `DestinationPath` should exist or not.                                  | `Present` *(Default)*, `Absent`                              |
| **Permissions**      |            | `[Hashtable[]]`  | A list of file system access rules for the file resource.                                                                    |                                                              |

---

##### Table. Attributes of `Permissions`

| Parameter                   | Attribute  | DataType     | Description                                                                                          | Allowed Values                               |
| :-------------------------- | :--------- | :----------- | :--------------------------------------------------------------------------------------------------- | :------------------------------------------- |
| **Identity**                | *Required* | `[String]`   | The identity to set permissions for.                                                                 |                                              |
| **Rights**                  | *Required* | `[String[]]` | The permissions to include in this rule. **Optional** if `Ensure` is set to value `'Absent'`.        | See [NTFS Access Rules](##ntfs-access-rules) |
| **Ensure**                  |            | `[String]`   | Present to create the rule, Absent to remove an existing rule. Default value is 'Present'.           | `Present`, `Absent`                          |
| **ProcessOnlyOnActiveNode** |            | `[Boolean]`  | Only determine if a change is needed if the target node is the active host of the filesystem object. |                                              |

---

<br />

## NTFS Access Rules

NTFS permissions determine access rights to files or folders on a Windows system. These permissions can be assigned to individual users or groups.

Different types of permissions can be assigned to a file system object. The types of NTFS permissions change depending on if you are working with a file or folder.

<br />

### Table. NTFS Directory Permissions

This table lists and describes the *basic* access rights to a **directory** that can be allowed for a user or group.

| Access Right       | Class   | ObjectType     | Description                                                                                                                                             |
| :----------------- | :------ | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **FullControl**    | *Basic* | Directory/File | Grants all available permissions for a folder.                                                                                                          |
| **ListDirectory**  | *Basic* | Directory      | List the contents of a folder, including child files and folders. Does not allow running any of the programs or read any of the data within the folder. |
| **Modify**         | *Basic* | Directory/File | Modify the contents of a folder. More restrictive than full control, as it does not allow changes to permissions or ownership of the folder.            |
| **Read**           | *Basic* | Directory/File | Read the data within a folder. As opposed to `ReadAndExecute`, if there is an executable file within the folder, the identity will be unable to run it. |
| **ReadAndExecute** | *Basic* | Directory      | Read the data within a folder and execute the any programs the folder contains.                                                                         |
| **Write**          | *Basic* | Directory/File | Create files and folders, write data, and write attributes for a folder. The write permission implies the ability to read all data within the folder.   |

---

The table lists and describes the *special* access rights to a **directory** that can be allowed for a user or group.

| Access Right                     | Class     | ObjectType     | Description                                                                                                                                          |
| :------------------------------- | :-------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------- |
| **ChangePermissions**            | *Special* | Directory/File | Grants right to add/modify/delete permissions of the working folder.                                                                                 |
| **CreateDirectories**            | *Special* | Directory      | Create new folder objects within the working folder.                                                                                                 |
| **CreateFiles**                  | *Special* | Directory      | Create new file objects within the working folder.                                                                                                   |
| **Delete**                       | *Special* | Directory/File | Grants rights to delete the working folder object.                                                                                                   |
| **DeleteSubdirectoriesAndFiles** | *Special* | Directory      | Grants rights to delete child folders contained within the working folder object.                                                                    |
| **ReadAttributes**               | *Special* | Directory/File | View basic attributes of an object (read-only, system, archive, and hidden)                                                                          |
| **ReadExtendedAttributes**       | *Special* | Directory/File | View the extended attributes of an object. These attributes vary from program to program.                                                            |
| **ReadPermissions**              | *Special* | Directory/File | Grants right to only view the current set of permissions of the working folder.                                                                      |
| **Synchronize**                  | *Special* | Directory/File | Grants ability for different threads to wait on the handle of the folder and synchronize with another thread that may signal it.                     |
| **TakeOwnership**                | *Special* | Directory/File | Grants rights to take ownership of a folder. The owner of a folder can always change permissions on it, regardless of any other access restrictions. |
| **Traverse**                     | *Special* | Directory      | Grants access a folder nested within a tree, even if parent folders in that tree deny said user/group access to the contents of those folders.       |
| **WriteAttributes**              | *Special* | Directory/File | Write basic attributes of folder object (read-only, system, archive, and hidden)                                                                     |
| **WriteExtendedAttributes**      | *Special* | Directory/File | Write extended attributes of a folder object. These attributes vary from program to program.                                                         |

---

<br />

### Table. NTFS File Permissions

This table lists and describes the *basic* access rights to a **file** that can be allowed for a user or group.

| Access Right       | Class   | ObjectType     | Description                                                                                                                                     |
| :----------------- | :------ | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------- |
| **FullControl**    | *Basic* | Directory/File | Grant all available permissions for a file.                                                                                                     |
| **Modify**         | *Basic* | Directory/File | Modify the contents of a file. More restrictive than full control, as it does not allow changes to permissions or ownership of the file.        |
| **Read**           | *Basic* | Directory/File | Read the file's data. As opposed to `ReadAndExecute`, if the file in question is an executable, the identity will be unable to run it.          |
| **ReadAndExecute** | *Basic* | Directory/File | Read the contents of a file and execute the programs of said file.                                                                              |
| **Write**          | *Basic* | Directory/File | Change the content or, in other terms, write data to a file. The write permission implies the ability to read all the data contained in a file. |

---

The table lists and describes the *special* access rights to a **file** that can be allowed for a user or group.

| Access Right                | Class     | ObjectType     | Description                                                                                                                                      |
| :-------------------------- | :-------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------- |
| **AppendData**              | *Special* | File           | Make changes to **the end of an existing file**, but not changing/deleting/overwriting existing data within that file.                           |
| **ChangePermissions**       | *Special* | Directory/File | Grants right to add/modify/delete permissions of the working folder.                                                                             |
| **Delete**                  | *Special* | Directory/File | Grants rights to delete the working folder object.                                                                                               |
| **ExecuteFile**             | *Special* | File           | Allows the identity to run a program *(executable file)*.                                                                                        |
| **ReadAttributes**          | *Special* | Directory/File | View basic attributes of an object (read-only, system, archive, and hidden)                                                                      |
| **ReadData**                | *Special* | File           | Open a file and view it's contents.                                                                                                              |
| **ReadExtendedAttributes**  | *Special* | Directory/File | View the extended attributes of an object. These attributes vary from program to program.                                                        |
| **ReadPermissions**         | *Special* | Directory/File | Grants right to only view the current set of permissions of the working file.                                                                    |
| **Synchronize**             | *Special* | Directory/File | Grants ability for different threads to wait on the handle of the file and synchronize with another thread that may signal it.                   |
| **TakeOwnership**           | *Special* | Directory/File | Grants rights to take ownership of a file. The owner of a file can always change permissions on it, regardless of any other access restrictions. |
| **WriteAttributes**         | *Special* | Directory/File | Write basic attributes of file object (read-only, system, archive, and hidden)                                                                   |
| **WriteData**               | *Special* | File           | Make changes to a file and overwrite existing content.                                                                                           |
| **WriteExtendedAttributes** | *Special* | Directory/File | Write extended attributes of a file object. These attributes vary from program to program.                                                       |

---

> **Note**: *File* permissions override *folder* permissions, unless the **FullControl** permission has been granted to the *folder*.
{.is-info}

<br />

### Table. Basic NTFS Permissions Matrix

NTFS permissions are grouped in order to make it easier to assign complimentary *(special)* permissions to users and groups. These groupings are called *"basic"* permissions. The table below shows how permissions are assigned to *basic permissions* in each case.

| **Special Permissions**        |     **FullControl**     |       **Modify**        |   **ReadAndExecute**    |    **ListDirectory**    |        **Read**         |        **Write**        |
| :----------------------------- | :---------------------: | :---------------------: | :---------------------: | :---------------------: | :---------------------: | :---------------------: |
| Traverse / ExecuteFile         | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: |                         |                         |
| ListDirectory / ReadData       | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: |                         |
| ReadAttributes                 | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: |                         |
| ReadExtendedAttributes         | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: |                         |
| CreateFiles / WriteData        | :ballot_box_with_check: | :ballot_box_with_check: |                         |                         |                         | :ballot_box_with_check: |
| CreateDirectories / AppendData | :ballot_box_with_check: | :ballot_box_with_check: |                         |                         |                         | :ballot_box_with_check: |
| WriteAttributes                | :ballot_box_with_check: | :ballot_box_with_check: |                         |                         |                         | :ballot_box_with_check: |
| WriteExtendedAttributes        | :ballot_box_with_check: | :ballot_box_with_check: |                         |                         |                         | :ballot_box_with_check: |
| DeleteSubdirectoriesAndFiles   | :ballot_box_with_check: |                         |                         |                         |                         |                         |
| Delete                         | :ballot_box_with_check: | :ballot_box_with_check: |                         |                         |                         |                         |
| ReadPermissions                | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: |
| ChangePermissions              | :ballot_box_with_check: |                         |                         |                         |                         |                         |
| TakeOwnership                  | :ballot_box_with_check: |                         |                         |                         |                         |                         |
| Synchronize                    | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: | :ballot_box_with_check: |

---

<br />

## Example `FilesAndFolders`

```yaml
FilesAndFolders:
  Items:
    - DestinationPath: C:\TestContents.txt
      Type: File
      Contents: |2
        This file contains test content to be added to the file resource.

        The content in this test file is multi-line.
      Force: true
      Ensure: Present

    - DestinationPath: C:\TestContentsFromFile.txt
      Type: File
      ContentsFromFile: .\Sources\Test\TestContentsFromFile.txt
      Force: true
      Ensure: Present

    - DestinationPath: C:\TestDirectory
      Type: Directory
      SourcePath: C:\Source
      MatchSource: true
      Force: true
      Recurse: true
      Ensure: Present

    - DestinationPath: C:\TestShare
      Type: Directory
      Force: true
      Ensure: Present
      Permissions:
        - Identity: Administrators
          Rights:   FullControl
        # ---
        - Identity: Users
          Rights:
            - Read
            - Write
            - ReadAndExecute

```

<br />

## Lookup Options in Datum.yml

```yaml
lookup_options:

  FilesAndFolders:
    merge_hash: deep
  FilesAndFolders\Items:
    merge_baseType_array: Unique
    merge_hash_array: DeepTuple
    merge_options:
      tuple_keys:
        - DestinationPath
        - Type
  FilesAndFolders\Items\Permissions:
    merge_baseType_array: Unique
    merge_hash_array: DeepTuple
    merge_options:
      tuple_keys:
        - Identity

```

<br />

[AccessControlDsc]: https://github.com/mcollera/AccessControlDsc
[Chocolatey]: https://github.com/gaelcolas/Chocolatey
[ComputerManagementDsc]: https://github.com/dsccommunity/ComputerManagementDsc
[PSDesiredStateConfiguration]: https://docs.microsoft.com/en-us/powershell/dsc/overview?view=dsc-3.0
[File]: https://docs.microsoft.com/en-us/powershell/dsc/reference/resources/windows/fileresource?view=dsc-1.1&viewFallbackFrom=dsc-3.0

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

[xPSDesiredStateConfiguration]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xArchive]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xDSCWebService]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xEnvironment]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xFileUpload]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xGroup]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xGroupSet]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xMsiPackage]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xPackage]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xProcessSet]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xPSEndpoint]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xRegistry]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xRemoteFile]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xScript]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xService]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xServiceSet]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xUser]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsFeature]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsFeatureSet]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsOptionalFeature]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsOptionalFeatureSet]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsPackageCab]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
[xWindowsProcess]: https://github.com/dsccommunity/xPSDesiredStateConfiguration

[FileSystemDsc]: https://github.com/dsccommunity/FileSystemDsc
[FileSystemAccessRule]: https://github.com/dsccommunity/FileSystemDsc/wiki/FileSystemAccessRule