<#
    .DESCRIPTION
        This resource is used to enable or disable and configure Windows Firewall with Advanced Security profiles.

    .PARAMETER Name
        Key - [System.String]
        Allowed values: Domain, Public, Private
        The name of the firewall profile to configure.

    .PARAMETER AllowInboundRules
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Specifies that the firewall blocks inbound traffic.

    .PARAMETER AllowLocalFirewallRules
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Specifies that the local firewall rules should be merged into the effective policy along with Group Policy settings.

    .PARAMETER AllowLocalIPsecRules
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Specifies that the local IPsec rules should be merged into the effective policy along with Group Policy settings.

    .PARAMETER AllowUnicastResponseToMulticast
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Allows unicast responses to multi-cast traffic.

    .PARAMETER AllowUserApps
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Specifies that traffic from local user applications is allowed through the firewall.

    .PARAMETER AllowUserPorts
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Specifies that traffic is allowed through local user ports.

    .PARAMETER DefaultInboundAction
        Write - [System.String]
        Allowed values: Block, Allow, NotConfigured
        Specifies how to filter inbound traffic.

    .PARAMETER DefaultOutboundAction
        Write - [System.String]
        Allowed values: Block, Allow, NotConfigured
        Specifies how to filter outbound traffic.

    .PARAMETER DisabledInterfaceAliases
        Write - StringArray
        Specifies a list of interfaces on which firewall settings are excluded.

    .PARAMETER Enabled
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Specifies that devolution is activated.

    .PARAMETER EnableStealthModeForIPsec
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Enables stealth mode for IPsec traffic.

    .PARAMETER LogAllowed
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Specifies how to log the allowed packets in the location specified by the LogFileName parameter.

    .PARAMETER LogBlocked
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Specifies how to log the dropped packets in the location specified by the LogFileName parameter.

    .PARAMETER LogFileName
        Write - [System.String]
        Specifies the path and filename of the file to which Windows Server writes log entries.

    .PARAMETER LogIgnored
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Specifies how to log the ignored packets in the location specified by the LogFileName parameter.

    .PARAMETER LogMaxSizeKilobytes
        Write - [System.UInt64]
        Specifies the maximum file size of the log, in kilobytes. The acceptable values for this parameter are: 1 through 32767.

    .PARAMETER NotifyOnListen
        Write - [System.String]
        Allowed values: True, False, NotConfigured
        Allows the notification of listening for inbound connections by a service.
#>
#Requires -Module NetworkingDsc


configuration FirewallProfiles
{
    param
    (
        [Parameter(Mandatory)]
        [System.Collections.Hashtable[]]
        $Profiles
    )

    <#
        Import required modules
    #>
    Import-DscResource -ModuleName NetworkingDsc


    <#
        Enumerate firewall profiles
    #>
    foreach ($item in $Profiles)
    {
        # remove case sensitivity of ordered Dictionary or Hashtable
        $item = @{} + $item

        # the property 'Name' must be specified and a valid value
        if (-not $item.ContainsKey('Name'))
        {
            throw 'ERROR: The property Name is not defined.'
        }
        elseif (-not (@('Domain', 'Private', 'Public') -contains $item.Name))
        {
            throw "ERROR: The value $($item.Name) is not valid. Specify 'Domain', 'Private', or 'Public'"
        }

        # if property 'Enabled' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('Enabled'))
        {
            $item.Enabled = 'NotConfigured'
        }

        # if property 'DefaultInboundAction' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('DefaultInboundAction'))
        {
            $item.DefaultInboundAction = 'NotConfigured'
        }

        # if property 'DefaultOutboundAction' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('DefaultOutboundAction'))
        {
            $item.DefaultOutboundAction = 'NotConfigured'
        }

        # if property 'AllowInboundRules' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('AllowInboundRules'))
        {
            $item.AllowInboundRules = 'NotConfigured'
        }

        # if property 'AllowLocalFirewallRules' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('AllowLocalFirewallRules'))
        {
            $item.AllowLocalFirewallRules = 'NotConfigured'
        }

        # if property 'AllowLocalIPsecRules' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('AllowLocalIPsecRules'))
        {
            $item.AllowLocalIPsecRules = 'NotConfigured'
        }

        # if property 'AllowUnicastResponseToMulticast' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('AllowUnicastResponseToMulticast'))
        {
            $item.AllowUnicastResponseToMulticast = 'NotConfigured'
        }

        # if property 'AllowUserApps' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('AllowUserApps'))
        {
            $item.AllowUserApps = 'NotConfigured'
        }

        # if property 'AllowUserPorts' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('AllowUserPorts'))
        {
            $item.AllowUserPorts = 'NotConfigured'
        }

        # if property 'EnableStealthModeForIPsec' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('EnableStealthModeForIPsec'))
        {
            $item.EnableStealthModeForIPsec = 'NotConfigured'
        }

        # if property 'LogAllowed' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('LogAllowed'))
        {
            $item.LogAllowed = 'NotConfigured'
        }

        # if property 'LogBlocked' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('LogBlocked'))
        {
            $item.LogBlocked = 'NotConfigured'
        }

        # if property 'LogIgnored' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('LogIgnored'))
        {
            $item.LogIgnored = 'NotConfigured'
        }

        # if property 'NotifyOnListen' not specified, set default to 'NotConfigured'
        if (-not $item.ContainsKey('NotifyOnListen'))
        {
            $item.NotifyOnListen = 'NotConfigured'
        }

        # create execution name for the resource
        $executionName = "FirewallProfile_$("$($item.Enabled)_$($item.Name)_$($node.Name)" -replace '[-().:\s]', '_')"

        $object = @"

        Creating DSC resource for FirewallProfile with the following values:

        FirewallProfile $executionName
        {
            Name                        = '$($item.Name)'
            Enabled                     = '$($item.Enabled)'
            DefaultInboundAction        = '$($item.DefaultInboundAction)'
            DefaultOutboundAction       = '$($item.DefaultOutboundAction)'
            AllowInboundRules           = '$($item.AllowInboundRules)'
            AllowLocalFirewallRules     = '$($item.AllowLocalFirewallRules)'
            AllowLocalIPsecRules        = '$($item.AllowLocalIPsecRules)'
            AllowUserApps               = '$($item.AllowUserApps)'
            AllowUserPorts              = '$($item.AllowUserPorts)'
            DisabledInterfaceAliases    = '$($item.DisabledInterfaceAliases)'
            EnableStealthModeForIPsec   = '$($item.EnableStealthModeForIPsec)'
            LogFileName                 = '$($item.LogFileName)'
            LogMaxSizeKilobytes         = '$($item.LogMaxSizeKilobytes)'
            LogAllowed                  = '$($item.LogAllowed)'
            LogBlocked                  = '$($item.LogBlocked)'
            LogIgnored                  = '$($item.LogIgnored)'
            NotifyOnListen              = '$($item.NotifyOnListen)'
        }

"@
        Write-Host "$object" -ForegroundColor Yellow


        # create the resource
        $Splatting = @{
            ResourceName  = 'FirewallProfile'
            ExecutionName = $executionName
            Properties    = $item
            NoInvoke      = $true
        }
            (Get-DscSplattedResource @Splatting).Invoke($item)
    }
} #end configuration
