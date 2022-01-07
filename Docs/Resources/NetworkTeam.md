# NetworkTeam

## Parameters

| Parameter                  | Attribute  | DataType     | Description                                                                                                 | Allowed Values                                                           |
| -------------------------- | ---------- | ------------ | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| **Name**                   | *Required* | `[String]`   | Specifies the name of the network team to create.                                                           |                                                                          |
| **TeamMembers**            | *Required* | `[String[]]` | Specifies the network interfaces that should be a part of the network team. This is a comma-separated list. |                                                                          |
| **TeamingMode**            |            | `[String]`   | Specifies the teaming mode configuration.                                                                   | `SwitchIndependent`, `LACP`, `Static`                                    |
| **LoadBalancingAlgorithm** |            | `[String]`   | Specifies the load balancing algorithm for the network team.                                                | `Dynamic`, `HyperVPort`, `IPAddresses`, `MacAddresses`, `TransportPorts` |
| **Ensure**                 |            | `[String]`   | Specifies if the network team should be created or deleted. Defaults to 'Present'.                          | `Present`, `Absent`                                                      |

## Description

This resource is used to setup network teams on a node.

## Examples

### Example 1

Creates the switch independent Network Team 'HostTeam' using the NIC1
and NIC2 interfaces. It sets the load balacing algorithm to 'HyperVPort'.
The config will then wait for the 'HostTeam' to achieve the 'Up' status.

```powershell
Configuration NetworkTeam_AddNetworkTeam_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetworkTeam AddNetworkTeam
        {
            Name                   = 'HostTeam'
            TeamingMode            = 'SwitchIndependent'
            LoadBalancingAlgorithm = 'HyperVPort'
            TeamMembers            = 'NIC1', 'NIC2'
            Ensure                 = 'Present'
        }

        WaitForNetworkTeam WaitForHostTeam
        {
            Name      = 'HostTeam'
            DependsOn = '[NetworkTeam]AddNetworkTeam'
        }
    }
}
```

### Example 2

Removes the NIC Team 'HostTeam' from the interfaces NIC1, NIC2 and NIC3.

```powershell
Configuration NetworkTeam_RemoveNetworkTeam_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetworkTeam RemoveNetworkTeam
        {
            Name        = 'HostTeam'
            Ensure      = 'Absent'
            TeamMembers = 'NIC1', 'NIC2', 'NIC3'
        }
    }
}
```

