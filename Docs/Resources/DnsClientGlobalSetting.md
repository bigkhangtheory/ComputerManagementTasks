# DnsClientGlobalSetting

## Parameters

| Parameter            | Attribute  | DataType     | Description                                                                                                                                      | Allowed Values |
| -------------------- | ---------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ | -------------- |
| **IsSingleInstance** | *Required* | `[String]`   | Specifies the resource is a single instance, the value must be 'Yes'.                                                                            | `Yes`          |
| **SuffixSearchList** |            | `[String[]]` | Specifies a list of global suffixes that can be used in the specified order by the DNS client for resolving the IP address of the computer name. |                |
| **UseDevolution**    |            | `[Boolean]`  | Specifies that devolution is activated.                                                                                                          |                |
| **DevolutionLevel**  |            | `[UInt32]`   | Specifies the number of labels up to which devolution should occur.                                                                              |                |

## Description

This resource is used to control global DNS client settings for a node.

## Examples

### Example 1

Configure only contoso.com for the DNS Suffix.

```powershell
Configuration DnsClientGlobalSetting_ConfigureSuffixSearchListSingle_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        DnsClientGlobalSetting ConfigureSuffixSearchListSingle
        {
            IsSingleInstance = 'Yes'
            SuffixSearchList = 'contoso.com'
            UseDevolution    = $true
            DevolutionLevel  = 0
        }
    }
}
```

### Example 2

Configure fabrikam.com and fourthcoffee.com for the DNS SuffixSearchList.

```powershell
Configuration DnsClientGlobalSetting_ConfigureSuffixSearchListMultiple_Config
{
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        DnsClientGlobalSetting ConfigureSuffixSearchListMultiple
        {
            IsSingleInstance = 'Yes'
            SuffixSearchList = ('fabrikam.com', 'fourthcoffee.com')
            UseDevolution    = $true
            DevolutionLevel  = 0
        }
    }
}
```

