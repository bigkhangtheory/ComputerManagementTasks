# HostsFile

## Parameters

| Parameter     | Attribute  | DataType   | Description                                                              | Allowed Values      |
| ------------- | ---------- | ---------- | ------------------------------------------------------------------------ | ------------------- |
| **HostName**  | *Required* | `[String]` | Specifies the name of the computer that will be mapped to an IP address. |                     |
| **IPAddress** |            | `[String]` | Specifies the IP Address that should be mapped to the host name.         |                     |
| **Ensure**    |            | `[String]` | Specifies if the hosts file entry should be created or deleted.          | `Present`, `Absent` |

## Description

This resource is used to control entries on a the host file for a node.

## Examples

### Example 1

Add a new host to the host file.

```powershell
Configuration HostsFile_AddEntry_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        HostsFile HostsFileAddEntry
        {
            HostName  = 'Host01'
            IPAddress = '192.168.0.1'
            Ensure    = 'Present'
        }
    }
}
```

### Example 2

Remove a host from the hosts file.

```powershell
Configuration HostsFile_RemoveEntry_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        HostsFile HostsFileRemoveEntry
        {
            HostName  = 'Host01'
            IPAddress = '192.168.0.1'
            Ensure    = 'Absent'
        }
    }
}
```

