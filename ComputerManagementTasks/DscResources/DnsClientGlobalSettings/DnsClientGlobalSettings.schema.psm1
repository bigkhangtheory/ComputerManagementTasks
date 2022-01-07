<#
    .SYNOPSIS
        The DnsClientGlobalSettings DSC configuration is used to control global DNS client settings for a node.
#>
#Requires -Module NetworkingDsc


configuration DnsClientGlobalSettings
{
    param
    (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String[]]
        $SuffixSearchList,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean]
        $UseDevolution = $true,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.UInt32]
        $DevolutionLevel
    )

    <#
        Import required modules
    #>
    Import-DscResource -ModuleName NetworkingDsc


    # valid parameters for the DSC Resource 'DnsClientGlobalSettings'
    $properties = @(
        'SuffixSearchList',
        'UseDevolution',
        'DevolutionLevel'
    )


    <#
        Create DSC resource for Computer
    #>
    $params = @{ }
    foreach ($item in ($PSBoundParameters.GetEnumerator() | Where-Object Key -In $properties))
    {
        $params.Add($item.Key, $item.Value)
    }

    # this resource is single instanced
    $params.IsSingleInstance = 'Yes'

    # create execution name for the resource
    $executionName = "$("$($node.Name)_$($params.SuffixSearchList)" -replace '[-().:\s]', '_')"

    # create the resource
    $Splatting = @{
        ResourceName  = 'DnsClientGlobalSetting'
        ExecutionName = $executionName
        Properties    = $params
        NoInvoke      = $true
    }
    (Get-DscSplattedResource @Splatting).Invoke($params)
} #end configuration