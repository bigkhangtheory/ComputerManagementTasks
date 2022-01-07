# WeakHostSend

> Warning! This resource has been deprecated as of v7.0.0.0.
> Please use the `WeakHostSend` property of the [NetIPInterface](NetIPInterface.md)
> resource instead.

## Parameters

| Parameter          | Attribute  | DataType   | Description                                                            | Allowed Values     |
| ------------------ | ---------- | ---------- | ---------------------------------------------------------------------- | ------------------ |
| **InterfaceAlias** | *Required* | `[String]` | Alias of the network interface for which the Weak Host Sending is set. |                    |
| **AddressFamily**  | *Required* | `[String]` | IP address family.                                                     | IPv4,  IPv6        |
| **State**          | *Required* | `[String]` | The desired state of the Weak Host Sending.                            | Enabled,  Disabled |

## Description

This resource is used to control the weak host send setting on an interface for a node.

## Examples

### Example 1

Disabling tbe weak host send setting for the network adapter with alias 'Ethernet'.

```powershell
Configuration Example
{
    param
    (
        [Parameter()]
        [System.String[]]
        $NodeName = 'localhost'
    )

    Import-DscResource -Module NetworkingDsc

    Node $NodeName
    {
        WeakHostSend DisableWeakHostSending
        {
            State          = 'Disabled'
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
        }
    }
}
```

