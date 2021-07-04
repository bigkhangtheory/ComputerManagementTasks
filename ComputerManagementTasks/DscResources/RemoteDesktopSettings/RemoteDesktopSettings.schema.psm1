<#
    .DESCRIPTION
        This configuration will manage the remote desktop administration settings on a computer.
        
        This includes whether remote desktop connections are allowed or denied and whether network level authentication is required.
#>
#requires -Module ComputerManagementDsc

configuration RemoteDesktopSettings
{
    param 
    (
        [Parameter(Mandatory)]
        [System.Boolean]
        $RemoteConnections,

        [Parameter()]
        [System.Boolean]
        $NetworkLevelAuthentication
    )

    Import-DscResource -ModuleName ComputerManagementDsc

    
    if ($RemoteConnections)
    {
        RemoteDesktopAdmin EnableRemoteDesktop
        {
            IsSingleInstance   = 'Yes'
            Ensure             = 'Present'
            UserAuthentication = switch ($NetworkLevelAuthentication)
            {
                $true { 'Secure' }
                $false { 'NonSecure' }
            }
        }
    }
    else  
    {
        RemoteDesktopAdmin DisableRemoteDesktop
        {
            IsSingleInstance = 'Yes'
            Ensure           = 'Absent'
        }
    }
}