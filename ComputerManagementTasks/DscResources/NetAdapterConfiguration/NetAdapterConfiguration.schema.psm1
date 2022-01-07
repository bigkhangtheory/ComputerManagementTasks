configuration NetAdapterConfiguration
{
    param
    (
        [Parameter()]
        [System.Collections.Hashtable[]]
        $Adapters
    )

    <#
        Import required modules
    #>
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName NetworkingDsc

    <#
        .NOTES
            Help functions
    #>
    function Merge-DscResourceProperties
    {
        param
        (
            [Parameter(Mandatory)]
            [ValidateNotNullOrEmpty()]
            [System.String]
            $Module,

            [Parameter(Mandatory)]
            [ValidateNotNullOrEmpty()]
            [System.String]
            $Name,

            [Parameter()]
            [ValidateNotNullOrEmpty()]
            [System.Collections.Hashtable]
            $Properties
        )

        # define properties of the DSC resource
        $resourceProperties = @() + (Get-DscResource -Module $Module -Name $Name | Select-Object -ExpandProperty Properties | Where-Object -FilterScript { ($_.Name -ne 'DependsOn') -and ($_.Name -ne 'PsDscRunAsCredential') } | ForEach-Object -MemberName Name)


        # initialize hashtable to store matching properties
        $match = @{}

        # enumerate all key/value pairs in Arguments and match any properties from the resource
        foreach ($item in ($Properties.GetEnumerator() | Where-Object Key -In $resourceProperties))
        {
            Write-Host "Founding matching property --> $($item.Key): $($item.Value)" -ForegroundColor Yellow

            $match.Add($item.Key, $item.Value)
        }

        [System.Collections.Hashtable]$match
    } #end function


    <#
        Enumerate all adapters
    #>

    foreach ($a in $Adapters)
    {
        # remove case sensitivity of ordered Dictionary or Hashtable
        $a = @{} + $a

        <#
            .PARAMETER NewName

        #>
        # the property 'NewName' must be specified
        if ( -not $a.ContainsKey('NewName') )
        {
            throw "ERROR: The property 'NewName' is not found."
        }
        else
        {
            $resourceName = "$($a.NewName -replace '[-().:\s]', '_')"
        }

        # set 'IgnoreMultipleMatchingAdapters' to true
        $a.IgnoreMultipleMatchingAdapters = $true


        # create execution name for the resource
        $executionName = "$($resourceName)_$((New-Guid).Guid)"


        NetAdapterName $executionName
        {
            NewName                        = $($a.NewName)
            MacAddress                     = $($a.MacAddress)
            IgnoreMultipleMatchingAdapters = $($a.IgnoreMultipleMatchingAdapters)
            Name                           = $($a.Name)
        }

        # define dependency for further resources
        $dependsOnNetAdapterName = "[NetAdapterName]$executionName"



        # create execution name for the resource
        $executionName = "$($resourceName)_$((New-Guid).Guid)"

        NetAdapterState "$executionName"
        {
            Name      = $a.NewName
            State     = 'Enabled'
            DependsOn = $dependsOnNetAdapterName
        }
        $dependsOnNetAdapterState = "[NetAdapterState]$executionName"


        # if 'AddressFamily' not specified, default to 'IPv4'
        if (-not $a.ContainsKey('AddressFamily'))
        {
            $a.AddressFamily = 'IPv4'
        }

        <#
            .PARAMETER IPAddress
        #>
        if ($a.Contains('IPAddress') -and -not [string]::IsNullOrWhiteSpace($a.IPAddress))
        {

            # create execution name for the resource
            $executionName = "$($resourceName)_$((New-Guid).Guid)"

            IPAddress "$executionName"
            {
                InterfaceAlias = $a.NewName
                IPAddress      = $a.IPAddress
                AddressFamily  = $a.AddressFamily
                DependsOn      = $dependsOnNetAdapterState
            }
        }


        <#
            .PARAMETER GatewayAddress
        #>
        if ($a.Contains('GatewayAddress'))
        {
            # create execution name for the resource
            $executionName = "$($resourceName)_$((New-Guid).Guid)"

            DefaultGatewayAddress "$executionName"
            {
                InterfaceAlias = $a.NewName
                AddressFamily  = $a.AddressFamily
                Address        = $a.GatewayAddress
                DependsOn      = $dependsOnNetAdapterState
            }
        }


        <#
            .PARAMETER DnsServerAddress
        #>
        if ($a.Contains('DnsServerAddress'))
        {
            # create execution name for the resource
            $executionName = "$($resourceName)_$((New-Guid).Guid)"


            DNSServerAddress "$executionName"
            {
                Address        = $a.DnsServerAddress
                InterfaceAlias = $a.NewName
                DependsOn      = $dependsOnNetAdapterState
                AddressFamily  = $a.AddressFamily
            }
        }
    }
}
