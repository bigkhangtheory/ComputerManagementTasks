# Route

## Parameters

| Parameter             | Attribute  | DataType   | Description                                                                                                                                         | Allowed Values      |
| --------------------- | ---------- | ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- |
| **InterfaceAlias**    | *Required* | `[String]` | Specifies the alias of a network interface.                                                                                                         |                     |
| **AddressFamily**     | *Required* | `[String]` | Specifies the IP address family.                                                                                                                    | `IPv4`, `IPv6`      |
| **DestinationPrefix** | *Required* | `[String]` | Specifies a destination prefix of an IP route. A destination prefix consists of an IP address prefix and a prefix length, separated by a slash (/). |                     |
| **NextHop**           | *Required* | `[String]` | Specifies the next hop for the IP route.                                                                                                            |                     |
| **Ensure**            |            | `[String]` | Specifies whether the route should exist. Defaults to 'Present'.                                                                                    | `Present`, `Absent` |
| **RouteMetric**       |            | UInt16     | Specifies an integer route metric for an IP route. Defaults to 256.                                                                                 |                     |
| **Publish**           |            | `[String]` | Specifies the publish setting of an IP route. Defaults to 'No'.                                                                                     | `No`, `Yes`, `Age`  |
| **PreferredLifetime** |            | Real64     | Specifies a preferred lifetime in seconds of an IP route.                                                                                           |                     |

## Description

This resource is used to control static routes on an interface for a node.

## Examples

### Example 1

Add a net route to the Ethernet interface.

```powershell
Configuration Route_AddRoute_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        Route NetRoute1
        {
            Ensure = 'Present'
            InterfaceAlias = 'Ethernet'
            AddressFamily = 'IPv4'
            DestinationPrefix = '192.168.0.0/16'
            NextHop = '192.168.120.0'
            RouteMetric = 200
        }
    }
}
```

