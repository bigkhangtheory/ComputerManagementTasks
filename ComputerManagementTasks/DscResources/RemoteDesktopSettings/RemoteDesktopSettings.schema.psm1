<#
    .DESCRIPTION
        This configuration will manage the remote desktop administration settings on a computer.

        This includes whether remote desktop connections are allowed or denied and whether network level authentication is required.
#>
#requires -Module ComputerManagementDsc

<#
    .NOTES
        Helper function
#>
function Get-DwordDecimalValue
{
    param
    (
        [Parameter(Mandatory)]
        [System.String]
        $Value
    )

    $valueData = switch ($Value)
    {
        'Never' { 0 }
        '1 minute' { 60000 }
        '5 minutes' { 300000 }
        '10 minutes' { 600000 }
        '15 minutes' { 900000 }
        '30 minutes' { 1800000 }
        '1 hour' { 3600000 }
        '2 hours' { 7200000 }
        '3 hours' {	10800000 }
        '6 hours' { 21600000 }
        '8 hours' { 28800000 }
        '12 hours' { 43200000 }
        '16 hours' { 57600000 }
        '18 hours' { 64800000 }
        '1 day' { 86400000 }
        '2 days' { 172800000 }
        '3 days' { 259200000 }
        '4 days' { 345600000 }
        '5 days' { 432000000 }
    }

    return $valueData
}

<#
    .NOTES
        Configuration
#>
configuration RemoteDesktopSettings
{
    param
    (
        [Parameter(Mandatory)]
        [System.Boolean]
        $RemoteConnections,

        [Parameter()]
        [System.Boolean]
        $NetworkLevelAuthentication,

        [Parameter()]
        [ValidateSet(
            'Never', '1 minute', '5 minutes', '10 minutes', '15 minutes', '30 minutes',
            ' 1 hour', '2 hours', '3 hours', '6 hours', '8 hours', '12 hours', '16 hours',
            '18 hours', '1 day', '2 days', '3 days', '4 days', '5 days'
        )]
        [System.String]
        $IdleTimeLimit,

        [Parameter()]
        [ValidateSet(
            'Never', '1 minute', '5 minutes', '10 minutes', '15 minutes', '30 minutes',
            ' 1 hour', '2 hours', '3 hours', '6 hours', '8 hours', '12 hours', '16 hours',
            '18 hours', '1 day', '2 days', '3 days', '4 days', '5 days'
        )]
        [System.String]
        $DisconnectedTimeLimit,

        [Parameter()]
        [System.Boolean]
        $EndSessionAfterIdle
    )

    <#
        Import required modules
    #>
    Import-DscResource -ModuleName xPSDesiredStateConfiguration
    Import-DscResource -ModuleName ComputerManagementDsc


    if ($RemoteConnections)
    {
        RemoteDesktopAdmin EnableRemoteDesktop
        {
            IsSingleInstance = 'Yes'
            Ensure           = 'Present'
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

    if ($PSBoundParameters.ContainsKey('IdleTimeLimit'))
    {
        $valueData = Get-DwordDecimalValue -Value $IdleTimeLimit

        xRegistry 'SetRdpIdleLimit'
        {
            Key       = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'MaxIdleTime'
            ValueData = $valueData
            ValueType = 'DWord'
            Force     = $true
        }
    } #end IdleTimeLimit

    if ($PSBoundParameters.ContainsKey('DisconnectedTimeLimit'))
    {
        $valueData = Get-DwordDecimalValue -Value $DisconnectedTimeLimit

        xRegistry 'SetRdpDisconnectedLimit'
        {
            Key       = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'MaxDisconnectionTime'
            ValueData = $valueData
            ValueType = 'DWord'
            Force     = $true
        }
    } #end IdleTimeLimit

    if ($PSBoundParameters.ContainsKey('EndSessionAfterIdle'))
    {
        if ($EndSessionAfterIdle)
        {
            $valueData = 1
        }
        else
        {
            $valueData = 0
        }

        xRegistry 'EndSessionWhenTimeLimitsReached'
        {
            Key       = 'HKLM:\	SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services'
            ValueName = 'fResetBroken'
            ValueData = $valueData
            ValueType = 'DWord'
            Force     = $true
        }
    }
} #end configuration