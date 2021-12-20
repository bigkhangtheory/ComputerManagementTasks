# IPAddressOption

## Parameters

| Parameter        | Attribute  | DataType    | Description                                                      | Allowed Values                           |
| ---------------- | ---------- | ----------- | ---------------------------------------------------------------- | ---------------------------------------- |
| **IPAddress**    | *Required* | `[String]`  | The target IP address, must already be configured on the system. |                                          |
| **SkipAsSource** |            | `[Boolean]` |                                                                  | Skip as source option of the ip address. |  |

## Description

This resource is used to control a node's IP address options. This can be used
to enable or disable the SkipAsSource option of an IP address.

This resource is used in addition to xIPAddress to set the SkipAsSource for a
single IP address when an adapter has more than one address assigned. When using
this resource it allows the options of a single IP address to be set.

## Examples

### Example 1

Change the SkipAsSource option for a single IP address.

```powershell
Configuration IPAddressOption_SetSkipAsSource_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        IPAddressOption SetSkipAsSource
        {
            IPAddress    = '192.168.10.5'
            SkipAsSource = $true
        }
    }
}
```

