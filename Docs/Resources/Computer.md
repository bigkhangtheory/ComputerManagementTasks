# Computer

## Parameters

| Parameter            | Attribute  | DataType         | Description                                                                                            | Allowed Values |
| -------------------- | ---------- | ---------------- | ------------------------------------------------------------------------------------------------------ | -------------- |
| **Name**             | *Required* | `[String]`       | The desired computer name.                                                                             |                |
| **DomainName**       |            | `[String]`       | The name of the domain to join.                                                                        |                |
| **JoinOU**           |            | `[String]`       | The distinguished name of the organizational unit that the computer account will be created in.        |                |
| **Credential**       |            | `[PSCredential]` | Credential to be used to join a domain.                                                                |                |
| **UnjoinCredential** |            | `[PSCredential]` | Credential to be used to leave a domain.                                                               |                |
| **WorkGroupName**    |            | `[String]`       | The name of the workgroup.                                                                             |                |
| **Description**      |            | `[String]`       | The value assigned here will be set as the local computer description.                                 |                |
| **Server**           |            | `[String]`       | The Active Directory Domain Controller to use to join the domain                                       |                |
| **CurrentOU**        | Read       | `[String]`       | A read-only property that specifies the organizational unit that the computer account is currently in. |                |

## Description

The resource allows you to configure a computer by changing its name and
description and modifying its Active Directory domain or workgroup membership.

## Examples

### Example 1

This configuration will set the computer name to 'Server01'
and make it part of 'ContosoWorkgroup' Workgroup.

```powershell
Configuration Computer_RenameComputerAndSetWorkgroup_Config
{
    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        Computer NewNameAndWorkgroup
        {
            Name          = 'Server01'
            WorkGroupName = 'ContosoWorkgroup'
        }
    }
}
```

### Example 2

This configuration sets the machine name to 'Server01' and
joins the 'Contoso' domain.
Note: this requires an AD credential to join the domain.

```powershell
Configuration Computer_JoinDomain_Config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullorEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        Computer JoinDomain
        {
            Name       = 'Server01'
            DomainName = 'Contoso'
            Credential = $Credential # Credential to join to domain
        }
    }
}
```

### Example 3

This example will change the machines name 'Server01' while remaining
joined to the current domain.
Note: this requires a credential for renaming the machine on the
domain.

```powershell
Configuration Computer_RenameComputerInDomain_Config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullorEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        Computer NewName
        {
            Name       = 'Server01'
            Credential = $Credential # Domain credential
        }
    }
}
```

### Example 4

This example will set the machine name to 'Server01' while remaining
in the workgroup.

```powershell
Configuration Computer_RenameComputerInWorkgroup_Config
{
    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        Computer NewName
        {
            Name = 'Server01'
        }
    }
}
```

### Example 5

This example switches the computer 'Server01' from a domain and joins it
to the 'ContosoWorkgroup' Workgroup.
Note: this requires a credential.

```powershell
Configuration Computer_UnjoinDomainAndJoinWorkgroup_Config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullorEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        Computer JoinWorkgroup
        {
            Name          = 'Server01'
            WorkGroupName = 'ContosoWorkgroup'
            Credential    = $Credential # Credential to unjoin from domain
        }
    }
}
```

### Example 6

This example will set the computer description.

```powershell
Configuration Computer_SetComputerDescriptionInWorkgroup_Config
{
    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        Computer NewDescription
        {
            Name        = 'localhost'
            Description = 'This is my computer.'
        }
    }
}
```

### Example 7

This configuration sets the machine name to 'Server01' and
joins the 'Contoso' domain using the domain controller 'dc1.contoso.com'.
Note: this requires an AD credential to join the domain.

```powershell
Configuration Computer_JoinDomainSpecifyingDC_Config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullorEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    Import-DscResource -Module ComputerManagementDsc

    Node localhost
    {
        Computer JoinDomain
        {
            Name       = 'Server01'
            DomainName = 'Contoso'
            Credential = $Credential # Credential to join to domain
            Server     = 'dc1.contoso.com'
        }
    }
}
```

