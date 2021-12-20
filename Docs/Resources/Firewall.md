# Firewall

## Parameters

| Parameter               | Attribute  | DataType     | Description                                                                           | Allowed Values                                                                                             |
| ----------------------- | ---------- | ------------ | ------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| **Name**                | *Required* | `[String]`   | Name of the Firewall Rule.                                                            |                                                                                                            |
| **DisplayName**         |            | `[String]`   | Localized, user-facing name of the Firewall Rule being created.                       |                                                                                                            |
| **Group**               |            | `[String]`   | Name of the Firewall Group where we want to put the Firewall Rule.                    |                                                                                                            |
| **Ensure**              |            | `[String]`   | Ensure the presence/absence of the resource.                                          | `Present`, `Absent`                                                                                        |
| **Enabled**             |            | `[String]`   | Enable or disable the supplied configuration.                                         | `True`, `False`                                                                                            |
| **Action**              |            | `[String]`   | Allow or Block the supplied configuration.                                            | `NotConfigured`, `Allow`, `Block`                                                                          |
| **Profile**             |            | `[String[]]` | Specifies one or more profiles to which the rule is assigned.                         |                                                                                                            |
| **Direction**           |            | `[String]`   | Direction of the connection.                                                          | `Inbound`, `Outbound`                                                                                      |
| **RemotePort**          |            | `[String[]]` | Specific Port used for filter. Specified by port number, range, or keyword            |                                                                                                            |
| **LocalPort**           |            | `[String[]]` | Local Port used for the filter.                                                       |                                                                                                            |
| **Protocol**            |            | `[String]`   | Specific Protocol for filter. Specified by name, number, or range.                    |                                                                                                            |
| **Description**         |            | `[String]`   | Documentation for the Rule.                                                           |                                                                                                            |
| **Program**             |            | `[String]`   | Path and file name of the program for which the rule is applied.                      |                                                                                                            |
| **Service**             |            | `[String]`   | Specifies the short name of a Windows service to which the firewall rule applies.     |                                                                                                            |
| **Authentication**      |            | `[String]`   | Specifies that authentication is required on firewall rules.                          | `NotRequired`, `Required`, `NoEncap`                                                                       |
| **Encryption**          |            | `[String]`   | Specifies that encryption in authentication is required on firewall rules.            | `NotRequired`, `Required`, `Dynamic`                                                                       |
| **InterfaceAlias**      |            | `[String[]]` | Specifies the alias of the interface that applies to the traffic.                     |                                                                                                            |
| **InterfaceType**       |            | `[String]`   | Specifies the indicated interface types are subject to the requirements of this rule. | `Any`, `Wired`, `Wireless`, `RemoteAccess`                                                                 |
| **LocalAddress**        |            | `[String[]]` | Specifies that network packets with matching IP addresses match this rule.            |                                                                                                            |
| **LocalUser**           |            | `[String]`   | Specifies the principals to which network traffic this firewall rule applies.         |                                                                                                            |
| **Package**             |            | `[String]`   | Specifies the Windows Store application to which the firewall rule applies.           |                                                                                                            |
| **Platform**            |            | `[String[]]` | Specifies which version of Windows the associated rule applies.                       |                                                                                                            |
| **RemoteAddress**       |            | `[String[]]` | Specifies that network packets with matching IP addresses match this rule.            |                                                                                                            |
| **RemoteMachine**       |            | `[String]`   | Specifies that matching IPsec rules of the indicated computer accounts are created.   |                                                                                                            |
| **RemoteUser**          |            | `[String]`   | Specifies that matching IPsec rules of the indicated user accounts are created.       |                                                                                                            |
| **DynamicTransport**    |            | `[String]`   | Specifies a dynamic transport.                                                        | `Any`, `ProximityApps`, `ProximitySharing`, `WifiDirectPrinting`, `WifiDirectDisplay`, `WifiDirectDevices` |
| **EdgeTraversalPolicy** |            | `[String]`   | Matching firewall rules of the indicated edge traversal policy are created.           | `Block`, `Allow`, `DeferToUser`, `DeferToApp`                                                              |
| **IcmpType**            |            | `[String[]]` | Specifies the ICMP type codes.                                                        |                                                                                                            |
| **LocalOnlyMapping**    |            | `[Boolean]`  | Indicates that matching firewall rules of the indicated value are created.            |                                                                                                            |
| **LooseSourceMapping**  |            | `[Boolean]`  | Indicates that matching firewall rules of the indicated value are created.            |                                                                                                            |
| **OverrideBlockRules**  |            | `[Boolean]`  | Indicates that matching network traffic that would otherwise be blocked are allowed.  |                                                                                                            |
| **Owner**               |            | `[String]`   | Specifies that matching firewall rules of the indicated owner are created.            |                                                                                                            |
| **DisplayGroup**        | Read       | `[String]`   | The current value of the Display Group of the Firewall Rule.                          |                                                                                                            |
## Description

This resource is used to control firewall rules for a node.

## Examples

### Example 1

Allow notepad to access ports on the Domain and Private Profiles.

```powershell
Configuration Firewall_AddFirewallRule_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        Firewall AddFirewallRule
        {
            Name                  = 'NotePadFirewallRule'
            DisplayName           = 'Firewall Rule for Notepad.exe'
            Group                 = 'NotePad Firewall Rule Group'
            Ensure                = 'Present'
            Enabled               = 'True'
            Profile               = ('Domain', 'Private')
            Direction             = 'OutBound'
            RemotePort            = ('8080', '8081')
            LocalPort             = ('9080', '9081')
            Protocol              = 'TCP'
            Description           = 'Firewall Rule for Notepad.exe'
            Program               = 'c:\windows\system32\notepad.exe'
            Service               = 'WinRM'
        }
    }
 }
```

### Example 2

Configure a network firewall rule using all parameters.
Note: This configuration sample uses all Firewall rule parameters.
It is only used to show example usage and should not be created.

```powershell
Configuration Firewall_AddFirewallRule_AllParameters_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        Firewall AddFirewallRuleAllParameters
        {
            Name                  = 'NotePadFirewallRule'
            DisplayName           = 'Firewall Rule for Notepad.exe'
            Group                 = 'NotePad Firewall Rule Group'
            Ensure                = 'Present'
            Enabled               = 'True'
            Profile               = ('Domain', 'Private')
            Direction             = 'OutBound'
            RemotePort            = ('8080', '8081')
            LocalPort             = ('9080', '9081')
            Protocol              = 'TCP'
            Description           = 'Firewall Rule for Notepad.exe'
            Program               = 'c:\windows\system32\notepad.exe'
            Service               = 'WinRM'
            Authentication        = 'Required'
            Encryption            = 'Required'
            InterfaceAlias        = 'Ethernet'
            InterfaceType         = 'Wired'
            LocalAddress          = ('192.168.2.0-192.168.2.128','192.168.1.0/255.255.255.0','10.0.0.0/8')
            LocalUser             = 'O:LSD:(D;;CC;;;S-1-15-3-4)(A;;CC;;;S-1-5-21-3337988176-3917481366-464002247-1001)'
            Package               = 'S-1-15-2-3676279713-3632409675-756843784-3388909659-2454753834-4233625902-1413163418'
            Platform              = '6.1'
            RemoteAddress         = ('192.168.2.0-192.168.2.128','192.168.1.0/255.255.255.0','10.0.0.0/8')
            RemoteMachine         = 'O:LSD:(D;;CC;;;S-1-5-21-1915925333-479612515-2636650677-1621)(A;;CC;;;S-1-5-21-1915925333-479612515-2636650677-1620)'
            RemoteUser            = 'O:LSD:(D;;CC;;;S-1-15-3-4)(A;;CC;;;S-1-5-21-3337988176-3917481366-464002247-1001)'
            DynamicTransport      = 'ProximitySharing'
            EdgeTraversalPolicy   = 'Block'
            IcmpType              = ('51','52')
            LocalOnlyMapping      = $true
            LooseSourceMapping    = $true
            OverrideBlockRules    = $true
            Owner                 = 'S-1-5-21-3337988176-3917481366-464002247-500'
        }
    }
}
```

### Example 3

Adding a firewall to an existing Firewall group 'My Firewall Rule'.

```powershell
Configuration Firewall_AddFirewallRuleToExistingGroup_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        Firewall AddFirewallRuleToExistingGroup
        {
            Name                  = 'MyFirewallRule'
            DisplayName           = 'My Firewall Rule'
            Group                 = 'My Firewall Rule Group'
        }

        Firewall Firewall1
        {
            Name                  = 'MyFirewallRule1'
            DisplayName           = 'My Firewall Rule'
            Group                 = 'My Firewall Rule Group'
            Ensure                = 'Present'
            Enabled               = 'True'
            Profile               = ('Domain', 'Private')
        }
    }
}
```

### Example 4

DSC configuration that enables the built-in Firewall Rule
'World Wide Web Services (HTTP Traffic-In)'.

```powershell
Configuration Firewall_EnableBuiltInFirewallRule_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        Firewall EnableBuiltInFirewallRule
        {
            Name                  = 'IIS-WebServerRole-HTTP-In-TCP'
            Ensure                = 'Present'
            Enabled               = 'True'
        }
    }
}
```

