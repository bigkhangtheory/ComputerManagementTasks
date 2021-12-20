# NetworkTeamInterface

## Parameters

| Parameter    | Attribute  | DataType   | Description                                                                                  | Allowed Values      |
| ------------ | ---------- | ---------- | -------------------------------------------------------------------------------------------- | ------------------- |
| **Name**     | *Required* | `[String]` | Specifies the name of the network team interface to create.                                  |                     |
| **TeamName** | Required   | `[String]` | Specifies the name of the network team on which this particular interface should exist.      |                     |
| **VlanId**   |            | `[UInt32]` | Specifies VLAN ID to be set on network team interface.                                       |                     |
| **Ensure**   |            | `[String]` | Specifies if the network team interface should be created or deleted. Defaults to 'Present'. | `Present`, `Absent` |

## Description

This resource is used to add network interfaces to a network team.

## Examples

### Example 1

Add New Network Team Interface.

```powershell
Configuration NetworkTeamInterface_AddInterface_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetworkTeam HostTeam
        {
            Name = 'HostTeam'
            TeamingMode = 'SwitchIndependent'
            LoadBalancingAlgorithm = 'HyperVPort'
            TeamMembers = 'NIC1','NIC2'
            Ensure = 'Present'
        }

        NetworkTeamInterface NewInterface
        {
            Name = 'NewInterface'
            TeamName = 'HostTeam'
            VlanID = 100
            Ensure = 'Present'
            DependsOn = '[NetworkTeam]HostTeam'
        }
    }
}
```

### Example 2

Remove a Network Team Interface.

```powershell
Configuration NetworkTeamInterface_RemoveInterface_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetworkTeam HostTeam
        {
          Name = 'HostTeam'
          TeamingMode = 'SwitchIndependent'
          LoadBalancingAlgorithm = 'HyperVPort'
          TeamMembers = 'NIC1','NIC2'
          Ensure = 'Present'
        }

        NetworkTeamInterface NewInterface
        {
            Name = 'NewInterface'
            TeamName = 'HostTeam'
            Ensure = 'Absent'
            DependsOn = '[NetworkTeam]HostTeam'
        }
    }
}
```

