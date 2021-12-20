# VirtualMemory

## Parameters

| Parameter       | Attribute  | DataType   | Description                                                                                                                                                                                      | Allowed Values                                                            |
| --------------- | ---------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------- |
| **Drive**       | *Required* | `[String]` | The drive letter for which paging settings should be set. Can be letter only, letter and colon or letter with colon and trailing slash.                                                          |                                                                           |
| **Type**        | *Required* | `[String]` | The type of the paging setting to use. If set to AutoManagePagingFile, the drive letter will be ignored. If set to SystemManagedSize, the values for InitialSize and MaximumSize will be ignored | `AutoManagePagingFile`, `CustomSize`, `SystemManagedSize`, `NoPagingFile` |
| **InitialSize** |            | SInt64     | The initial size of the page file in Megabyte                                                                                                                                                    |                                                                           |
| **MaximumSize** |            | SInt64     | The maximum size of the page file in Megabyte                                                                                                                                                    |                                                                           |

## Description

The resource allows configuration of properties of the paging file on
the local computer.

## Examples

### Example 1

Example script that sets the paging file to reside on
drive C with the custom size 2048MB.

```powershell
Configuration VirtualMemory_SetVirtualMemory_Config
{
    Import-DSCResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        VirtualMemory PagingSettings
        {
            Type        = 'CustomSize'
            Drive       = 'C'
            InitialSize = '2048'
            MaximumSize = '2048'
        }
    }
}
```

