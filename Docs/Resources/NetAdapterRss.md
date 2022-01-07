# NetAdapterRss

## Parameters

| Parameter   | Attribute  | DataType    | Description                            | Allowed Values                                       |
| ----------- | ---------- | ----------- | -------------------------------------- | ---------------------------------------------------- |
| **Name**    | *Required* | `[String]`  | Specifies the Name of network adapter. |                                                      |
| **Enabled** | *Required* | `[Boolean]` |                                        | Specifies whether RSS should be enabled or disabled. |  |

## Description

This resource is used to enable or disable RSS (Receive Side Scaling) on a network adapter.
Not all adapters support RSS so there may be no option for this and it will throw an exception that the network adapter is not found.


## Examples

### Example 1

This configuration disables RSS on the network adapter.

```powershell
Configuration NetAdapterRss_EnableRss_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterRss EnableRss
        {
            Name = 'Ethernet'
            Enabled = $True
        }
    }
}
```

