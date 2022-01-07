# OfflineDomainJoin

## Parameters

| Parameter            | Attribute  | DataType   | Description                                                           | Allowed Values |
| -------------------- | ---------- | ---------- | --------------------------------------------------------------------- | -------------- |
| **IsSingleInstance** | *Required* | `[String]` | Specifies the resource is a single instance, the value must be 'Yes'. | `Yes`          |
| **RequestFile**      | *Required* | `[String]` | The full path to the Offline Domain Join Request file to use.         |                |

## Description

The resource allows you to join computers to an Active Directory domain using an
[Offline Domain Join](https://technet.microsoft.com/en-us/library/offline-domain-join-djoin-step-by-step(v=ws.10).aspx)
request file.

## Examples

### Example 1

This example will join the computer to a domain using the ODJ
request file C:\ODJ\ODJRequest.txt.

```powershell
Configuration OfflineDomainJoin_JoinDomainUsingODJBlob_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        OfflineDomainJoin ODJ
        {
          IsSingleInstance = 'Yes'
          RequestFile      = 'C:\ODJ\ODJBlob.txt'
        }
    }
}
```

