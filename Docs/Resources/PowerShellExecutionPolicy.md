# PowerShellExecutionPolicy

## Parameters

| Parameter                | Attribute  | DataType   | Description                                                                      | Allowed Values                                                          |
| ------------------------ | ---------- | ---------- | -------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| **ExecutionPolicyScope** | *Required* | `[String]` | Defines the scope for the preference of the Windows PowerShell execution policy. | `CurrentUser`, `LocalMachine`, `MachinePolicy`, `Process`, `UserPolicy` |
| **ExecutionPolicy**      | *Required* | `[String]` | Changes the preference for the Windows PowerShell execution policy.              | `Bypass`, `Restricted`, `AllSigned`, `RemoteSigned`, `Unrestricted`     |

## Description

This resource allows configuration of the PowerShell execution
policy for different execution scopes.

## Examples

### Example 1

This example shows how to configure powershell's execution policy for the specified execution policy scope.

```powershell
Configuration PowerShellExecutionPolicy_SetPolicy_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        PowerShellExecutionPolicy ExecutionPolicy
        {
            ExecutionPolicyScope = 'CurrentUser'
            ExecutionPolicy      = 'RemoteSigned'
        } # End of PowershellExecutionPolicy Resource
    } # End of Node
} # End of Configuration
```

### Example 2

This example shows how to configure multiple powershell's execution policy for a specified execution policy scope.

```powershell
Configuration PowerShellExecutionPolicy_SetPolicyForMultipleScopes_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        PowerShellExecutionPolicy ExecutionPolicyCurrentUser
        {
            ExecutionPolicyScope = 'CurrentUser'
            ExecutionPolicy      = 'RemoteSigned'
        } # End of ExecutionPolicyCurrentUser Resource

        PowerShellExecutionPolicy ExecutionPolicyLocalMachine
        {
            ExecutionPolicyScope = 'LocalMachine'
            ExecutionPolicy      = 'RemoteSigned'
        } # End of ExecutionPolicyLocalMachine Resource
    } # End of Node
} # End of Configuration
```

