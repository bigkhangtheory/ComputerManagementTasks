# DnsConnectionSuffix

## Parameters

| Parameter                          | Attribute  | DataType    | Description                                                                                                | Allowed Values      |
| ---------------------------------- | ---------- | ----------- | ---------------------------------------------------------------------------------------------------------- | ------------------- |
| **InterfaceAlias**                 | *Required* | `[String]`  | Alias of the network interface for which the DNS server address is set.                                    |                     |
| **ConnectionSpecificSuffix**       | Required   | `[String]`  | DNS connection-specific suffix to assign to the network interface.                                         |                     |
| **RegisterThisConnectionsAddress** |            | `[Boolean]` | Specifies that the IP address for this connection is to be registered.                                     |                     |
| **UseSuffixWhenRegistering**       |            | `[Boolean]` | Specifies that this host name and the connection specific suffix for this connection are to be registered. |                     |
| **Ensure**                         |            | `[String]`  | Ensure that the network interface connection-specific suffix is present or not.                            | `Present`, `Absent` |

## Description

This resource is used to control interface-specific DNS client configurations on a node.

## Examples

### Example 1

This configuration will set a DNS connection-specific suffix on a network interface that
is identified by its alias.

```powershell
Configuration DnsConnectionSuffix_AddSpecificSuffix_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        DnsConnectionSuffix AddSpecificSuffix
        {
            InterfaceAlias           = 'Ethernet'
            ConnectionSpecificSuffix = 'contoso.com'
        }
    }
}
```

