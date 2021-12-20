# WindowsEventLog

## Parameters

| Parameter                 | Attribute  | DataType    | Description                                                                   | Allowed Values                     |
| ------------------------- | ---------- | ----------- | ----------------------------------------------------------------------------- | ---------------------------------- |
| **LogName**               | *Required* | `[String]`  | Specifies the name of a valid event log                                       |                                    |
| **IsEnabled**             |            | `[Boolean]` | Specifies whether the specified event log should be enabled or disabled       |                                    |
| **MaximumSizeInBytes**    |            | SInt64      | Specifies the maximum size in bytes for the specified event log               |                                    |
| **LogMode**               |            | `[String]`  | Specifies the log mode for the specified event log                            | `AutoBackup`, `Circular`, `Retain` |
| **SecurityDescriptor**    |            | `[String]`  | Specifies the SDDL for the specified event log                                |                                    |
| **LogFilePath**           |            | `[String]`  | Specifies the file name and path for the specified event log                  |                                    |
| **LogRetentionDays**      |            | SInt32      | Specifies the number of days to retain events when the log mode is AutoBackup |                                    |
| **RegisteredSource**      |            | `[String]`  | Specifies the name of an event source to register for the specified event log |                                    |
| **CategoryResourceFile**  |            | `[String]`  | Specifies the category resource file for the event source                     |                                    |
| **MessageResourceFile**   |            | `[String]`  | Specifies the message resource file for the event source                      |                                    |
| **ParameterResourceFile** |            | `[String]`  | Specifies the parameter resource file for the event source                    |                                    |
| **RestrictGuestAccess**   |            | `[Boolean]` | Specifies whether to allow guests to have access to the specified event log   |                                    |

## Description

This resource is used to configure the settings of an event log.

## RestrictGuestAccess and Event Log DACLs

If you choose to restrict guest access to an event log, the
RestrictGuestAccess registry key will be configured and the event
log's DACL will be checked and updated to ensure the built-in
Guests group has been removed. Conversely, if you choose to
allow guest access, the registry key will be configured and the
DACL will be checked and updated to ensure the built-in Guests
group has been added.

This DACL behavior also applies if you configure your own custom
DACL via the SecurityDescriptor property and a warning will be
displayed to notify you of the change.

## RegisteredSource and Resource Files

The PowerShell cmdlets that define event log sources do not check
for the presence of the resource file on the computer and this
resource follows the same paradigm. If you choose to create your
own resource files and want to register them with the event source,
you must ensure the files have been copied to the computer via a
DSC File resource definition or equivalent.


