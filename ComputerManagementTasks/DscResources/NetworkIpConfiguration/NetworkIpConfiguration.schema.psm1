<#
    .DESCRIPTION

#>
#Requires -Module xPSDesiredStateConfiguration
#Requires -Module NetworkingDsc


configuration NetworkIpConfiguration
{
    param
    (
        [Parameter()]
        [System.Boolean]
        $DisableNetBios = $false,

        [Parameter()]
        [System.Int16]
        $ConfigureIPv6 = -1, # < 0 -> no configuration code will be generated

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Interfaces,

        [Parameter()]
        [System.Collections.Hashtable[]]
        $Routes
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName xPSDesiredStateConfiguration
    Import-DscResource -ModuleName NetworkingDsc

    function NetIpInterfaceConfig
    {
        param
        (
            [Parameter()]
            [System.String]
            $InterfaceAlias = 'Ethernet',

            [Parameter()]
            [ValidateSet('IPv4', 'IPv6')]
            [System.String]
            $AddressFamily = 'IPv4',

            [Parameter()]
            [System.String]
            $IpAddress,

            [Parameter()]
            [System.UInt32]
            $Prefix = 24,

            [Parameter()]
            [System.String]
            $Gateway,

            [Parameter()]
            [System.String[]]
            $DnsServer,

            [Parameter()]
            [System.String]
            $DnsConnectionSuffix,

            [Parameter()]
            [System.Boolean]
            $RegisterDns = $true,

            [Parameter()]
            [System.Boolean]
            $DisableNetbios = $false,

            [Parameter()]
            [System.Boolean]
            $EnableDhcp = $false,

            [Parameter()]
            [System.Boolean]
            $EnableLmhostsLookup = $false,

            [Parameter()]
            [System.Boolean]
            $DisableIPv6 = $false,

            [Parameter()]
            [ValidateSet('Public', 'Private', 'DomainAuthenticated')]
            [System.String]
            $NetworkCategory = 'DomainAuthenticated',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $AdvertiseDefaultRoute = 'Disabled',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $Advertising = 'Disabled',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $AutomaticMetric = 'Enabled',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $DirectedMacWolPattern = 'Disabled',

            [Parameter()]
            [ValidateSet('Disabled', 'UseEct1', 'UseEct0', 'AppDecide')]
            [System.String]
            $EcnMarking = 'AppDecide',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $ForceArpNdWolPattern = 'Disabled',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $Forwarding = 'Disabled',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $IgnoreDefaultRoutes = 'Disabled',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $ManagedAddressConfiguration = 'Enabled',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $NeighborUnreachabilityDetection = 'Enabled',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $OtherStatefulConfiguration = 'Enabled',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled', 'ControlledByDHCP')]
            [System.String]
            $RouterDiscovery = 'ControlledByDHCP',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $WeakHostReceive = 'Disabled',

            [Parameter()]
            [ValidateSet('Enabled', 'Disabled')]
            [System.String]
            $WeakHostSend = 'Disabled',

            [Parameter()]
            [System.UInt32]
            $NlMtu = 1500,

            [Parameter()]
            [System.UInt32]
            $InterfaceMetric
        )

        # initialize array of valid parameters for the resource 'NetIpInterface'
        $paramsNetIpInterface = @(
            'AddressFamily',
            'InterfaceAlias',
            'AdvertiseDefaultRoute',
            'Advertising',
            'AutomaticMetric',
            'DirectedMacWolPattern',
            'EcnMarking',
            'ForceArpNdWolPattern',
            'Forwarding',
            'IgnoreDefaultRoutes',
            'InterfaceMetric',
            'ManagedAddressConfiguration',
            'NeighborUnreachabilityDetection',
            'NlMtu',
            'OtherStatefulConfiguration',
            'RouterDiscovery',
            'WeakHostReceive',
            'WeakHostSend'
        )


        # initialize hashtable to store matching properties for NetIpInterface
        $params = @{ }

        # enumerate all parameters for matching properties of NetIpInterface
        foreach ($item in ($PSBoundParameters.GetEnumerator() | Where-Object Key -In $paramsNetIpInterface))
        {
            $params.Add($item.Key, $item.Value)
        }

        # create execution name for the interface alias
        $interfaceAliasName = "Interface_$("$($InterfaceAlias)" -replace '[-().:\s]', '_')"

        <#
            .PARAMETER EnableDhcp
        #>
        if ( $EnableDhcp -eq $true )
        {
            # if 'EnableDhcp' is true, then 'IPAddress', 'Gateway', and 'DnsServer' must be empty
            if ( -not [string]::IsNullOrWhiteSpace($IpAddress) -or
                -not [string]::IsNullOrWhiteSpace($Gateway) -or
                ($null -ne $DnsServer -and $DnsServer.Count -gt 0))
            {
                throw "ERROR: Enabled DHCP requires empty 'IpAddress' ($IpAddress), 'Gateway' ($Gateway) and 'DnsServer' ($DnsServer) parameters for interface '$InterfaceAlias'."
            }

            # set the property 'Dhcp' for NetIpInterface
            $params.Dhcp = 'Enabled'

            # create execution name for the resource
            $executionName = "Dhcp_$($params.Dhcp)_$($interfaceAliasName)"

            # create resource for NetIpInterface with DHCP enabled
            $Splatting = @{
                ResourceName  = 'NetIPInterface'
                ExecutionName = $executionName
                Properties    = $params
                NoInvoke      = $true
            }
            (Get-DscSplattedResource @Splatting).Invoke($params)

            # set the resource dependency for NetIPInterface
            $dependsOnNetIpInterface = "[NetIPInterface]$executionName"


            # enabling DHCP for DNS servers
            DnsServerAddress "$executionName"
            {
                InterfaceAlias = $params.InterfaceAlias
                AddressFamily  = $params.AddressFamily
                Validate       = $false
                DependsOn      = $dependsOnNetIpInterface
            }

        }
        else
        {
            <#
                .PARAMETER IpAddress
            #>
            # if EnableDhcp is false, then 'IPAddress' must be specified
            if ( -not [System.String]::IsNullOrWhiteSpace($IpAddress) )
            {

                # set the property 'Dhcp' for NetIpInterface
                $params.Dhcp = 'Disabled'

                # create execution name for the resource
                $executionName = "Dhcp_$($params.Dhcp)_$($interfaceAliasName)"

                # create resource for NetIpInterface with DHCP enabled
                $Splatting = @{
                    ResourceName  = 'NetIPInterface'
                    ExecutionName = $executionName
                    Properties    = $params
                    NoInvoke      = $true
                }
                (Get-DscSplattedResource @Splatting).Invoke($params)

                # set the resource dependency for NetIPInterface
                $dependsOnNetIpInterface = "[NetIPInterface]$executionName"

                # validate the Prefix
                if ( -not ($Prefix -match '^\d+$') )
                {
                    Write-Host "ERROR: Valid 'Prefix' parameter is required for IP address '$IpAddress'." -ForegroundColor Yellow
                    throw "ERROR: Valid 'Prefix' parameter is required for IP address '$IpAddress'."
                }

                # format the ip
                $ipAddr = '{0}/{1}' -f $IpAddress, $Prefix

                IPAddress "IPAddress_$interfaceAliasName"
                {
                    IPAddress      = $ipAddr
                    AddressFamily  = $params.AddressFamily
                    InterfaceAlias = $params.InterfaceAlias
                    DependsOn      = $dependsOnNetIpInterface
                }

            }

            <#
                .PARAMETER Gateway
            #>
            # if specified, set the default gateway
            if ( -not [string]::IsNullOrWhiteSpace($Gateway) )
            {

                DefaultGatewayAddress "DefaultGateway_$interfaceAliasName"
                {
                    AddressFamily  = $($params.AddressFamily)
                    InterfaceAlias = $($params.InterfaceAlias)
                    Address        = $Gateway
                    DependsOn      = $dependsOnNetIpInterface
                }

            }

            <#
                .PARAMETER DnsServer
            #>
            # if specified, set the DNS server addresses
            if ( $null -ne $DnsServer -and $DnsServer.Count -gt 0 )
            {
                DnsServerAddress "DnsServers_$interfaceAliasName"
                {
                    InterfaceAlias = $($params.InterfaceAlias)
                    AddressFamily  = $($params.AddressFamily)
                    Address        = $DnsServer
                    Validate       = $false
                    DependsOn      = $dependsOnNetIpInterface
                }
                $dependsOnDnsServerAddress = "[DnsServerAddress]DnsServers_$interfaceAliasName"


                <#
                    .PARAMETER DnsConnectionSuffix
                #>
                if ($null -ne $DnsConnectionSuffix)
                {
                    $executionName = "DnsConnectionSuffix_$interfaceAliasName"

                    DnsConnectionSuffix "$executionName"
                    {
                        InterfaceAlias                 = $($params.InterfaceAlias)
                        ConnectionSpecificSuffix       = $DnsConnectionSuffix
                        RegisterThisConnectionsAddress = $RegisterDns
                        Ensure                         = 'Present'
                        DependsOn                      = $dependsOnDnsServerAddress
                    }
                }
            }
        }

        <#
            .PARAMETER EnableLmhostsLookup
        #>
        WinsSetting "LmhostsLookup_$interfaceAliasName"
        {
            EnableLmHosts    = $EnableLmhostsLookup
            IsSingleInstance = 'Yes'
        }

        <#
            .PARAMETER DisableNetbios
        #>
        if ($DisableNetbios)
        {
            NetBios "DisableNetBios_$interfaceAliasName"
            {
                InterfaceAlias = $InterfaceAlias
                Setting        = 'Disable'
            }
        }

        <#
            .PARAMETER DisableIPv6
        #>
        if ($PSBoundParameters.ContainsKey('DisableIPv6'))
        {
            if ($DisableIPv6)
            {
                $ipv6State = 'Disabled'
            }
            else
            {
                $ipv6State = 'Enabled'
            }

            # create resource for IPv6 binding
            NetAdapterBinding "DisableIPv6_$interfaceAliasName"
            {
                InterfaceAlias = $InterfaceAlias
                ComponentId    = 'ms_tcpip6'
                State          = $ipv6State
            }
        }



        if ( -not [string]::IsNullOrWhiteSpace($NetworkCategory) )
        {
            if ( -not ($NetworkCategory -match '^(Public|Private|DomainAuthenticated)$') )
            {
                throw "ERROR: Invalid value of attribute 'NetworkCategory'."
            }

            Script "NetworkCategory_$interfaceAliasName"
            {
                TestScript = {
                    $val = Get-NetConnectionProfile -InterfaceAlias $using:InterfaceAlias

                    Write-Verbose "Current NetworkCategory of interface '$using:InterfaceAlias': $($val.NetworkCategory)"

                    if ($null -ne $val -and $val.NetworkCategory -eq $using:NetworkCategory )
                    {
                        return $true
                    }
                    Write-Verbose "Values are different (expected NetworkCategory: $using:NetworkCategory)"
                    return $false
                }
                SetScript  = {
                    if ( $using:NetworkCategory -eq 'DomainAuthenticated')
                    {
                        Write-Verbose "Set NetworkCategory of interface '$using:InterfaceAlias' to '$using:NetworkCategory ' is not supported. The computer automatically sets this value when the network is authenticated to a domain controller."

                        # Workaround if the computer is domain joined -> Restart NLA service to restart the network location check
                        # see https://newsignature.com/articles/network-location-awareness-service-can-ruin-day-fix/
                        Write-Verbose 'Restarting NLA service to reinitialize the network location check...'
                        Restart-Service nlasvc -Force
                        Start-Sleep 5

                        $val = Get-NetConnectionProfile -InterfaceAlias $using:InterfaceAlias

                        Write-Verbose "Current NetworkCategory is now: $($val.NetworkCategory)"

                        if ( $val.NetworkCategory -ne $using:NetworkCategory )
                        {
                            Write-Error "Interface '$using:InterfaceAlias' is not '$using:NetworkCategory'."
                        }
                    }
                    else
                    {
                        Write-Verbose "Set NetworkCategory of interface '$using:InterfaceAlias' to '$using:NetworkCategory '."
                        Set-NetConnectionProfile -InterfaceAlias $using:InterfaceAlias -NetworkCategory $using:NetworkCategory
                    }
                }
                GetScript  = { return @{result = 'N/A' } }
            }
        }
    } #end function NetIpInterfaceConfig


    <#
        .PARAMETER DisableNetbios
            Disable NetBios on all network interfaces.
    #>
    if ($DisableNetbios -eq $true)
    {
        NetBios DisableNetBios_System
        {
            InterfaceAlias = '*'
            Setting        = 'Disable'
        }
    }


    <#
        .PARAMETER ConfigureIPv6
    #>
    if ($ConfigureIPv6 -ge 0)
    {
        # see https://docs.microsoft.com/en-US/troubleshoot/windows-server/networking/configure-ipv6-in-windows

        if ( $ConfigureIPv6 -gt 255 )
        {
            throw "ERROR: Invalid IPv6 configuration value $ConfigureIPv6 (expected value: 0-255)."
        }

        $configIPv6KeyName = 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters'
        $configIPv6VarName = 'DisabledComponents'

        Script ConfigureIPv6_System
        {
            TestScript = {
                $val = Get-ItemProperty -Path $using:configIPv6KeyName -Name $using:configIPv6VarName -ErrorAction SilentlyContinue

                Write-Verbose "Current IPv6 Configuration value: '$($val.$using:configIPv6VarName)' - expected value: '$using:ConfigureIPv6'"

                if ($null -ne $val -and $val.$using:configIPv6VarName -eq $using:ConfigureIPv6)
                {
                    return $true
                }
                Write-Verbose 'Values are different'
                return $false
            }
            SetScript  = {
                if ( -not (Test-Path -Path $using:configIPv6KeyName) )
                {
                    New-Item -Path $using:configIPv6KeyName -Force
                }
                Set-ItemProperty -Path $using:configIPv6KeyName -Name $using:configIPv6VarName -Value $using:ConfigureIPv6 -Type DWord
                $global:DSCMachineStatus = 1
            }
            GetScript  = { return @{result = 'N/A' } }
        }
    }



    <#
        .PARAMETER Interfaces
            List of network interfaces
    #>
    if ( $null -ne $Interfaces )
    {
        foreach ( $i in $Interfaces )
        {
            # Remove case sensitivity of ordered Dictionary or Hashtables
            $i = @{} + $i

            if ( [System.String]::IsNullOrWhitespace($i.InterfaceAlias) )
            {
                $i.InterfaceAlias = 'Ethernet'
            }

            # if 'AddressFamily' not specified, set default to 'IPv4'
            if ( [System.String]::IsNullOrWhiteSpace($i.AddressFamily) )
            {
                $i.AddressFamily = 'IPv4'
            }

            if ( ($DisableNetbios -eq $true) -or ([System.String]::IsNullOrWhitespace($i.DisableNetbios)) )
            {
                $i.DisableNetbios = $false
            }

            if ( [System.String]::IsNullOrWhiteSpace($i.EnableLmhostsLookup) )
            {
                $i.EnableLmhostsLookup = $false
            }

            if ( [System.String]::IsNullOrWhitespace($i.EnableDhcp) )
            {
                $i.EnableDhcp = $false
            }

            if ( [System.String]::IsNullOrWhitespace($i.DisableIPv6) )
            {
                $i.DisableIPv6 = $false
            }

            if ( ($i.EnableDhcp -eq $false) -and ([System.String]::IsNullOrWhitespace($i.Prefix)) )
            {
                $i.Prefix = 24
            }

            if ( $i.ContainsKey('InterfaceOptions') )
            {
                $interfaceOptions = $i.InterfaceOptions
                $i.Remove('InterfaceOptions')

                foreach ( $item in ($interfaceOptions.GetEnumerator()) )
                {
                    $i.Add($item.Key, $item.Value)
                }
            }

            # if property 'InterfaceMetric' is pecified, set 'AutomaticMetric' to disabled
            if ( -not [System.String]::IsNullOrWhitespace($i.InterfaceMetric) )
            {
                $i.AutomaticMetric = 'Disabled'
            }

            # call function to create the resource
            NetIpInterfaceConfig @i
        }
    }


    <#
        .PARAMETER Routes
    #>
    if ($null -ne $Routes)
    {
        foreach ( $netRoute in $Routes )
        {
            # Remove case sensitivity of ordered Dictionary or Hashtables
            $netRoute = @{} + $netRoute

            if ( [string]::IsNullOrWhitespace($netRoute.InterfaceAlias) )
            {
                $netRoute.InterfaceAlias = 'Ethernet'
            }

            if ( [string]::IsNullOrWhitespace($netRoute.AddressFamily) )
            {
                $netRoute.AddressFamily = 'IPv4'
            }

            if ( [string]::IsNullOrWhitespace($netRoute.Ensure) )
            {
                $netRoute.Ensure = 'Present'
            }

            $executionName = "route_$($netRoute.InterfaceAlias)_$($netRoute.AddressFamily)_$($netRoute.DestinationPrefix)_$($netRoute.NextHop)" -replace '[().:\s]', ''
            (Get-DscSplattedResource -ResourceName Route -ExecutionName $executionName -Properties $netRoute -NoInvoke).Invoke($netRoute)
        }
    }
}
