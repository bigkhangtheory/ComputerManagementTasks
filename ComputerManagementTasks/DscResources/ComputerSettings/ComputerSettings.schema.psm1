<#
    .DESCRIPTION
        The resource allows you to configure a computer by changing its name and description and modifying its Active Directory domain or workgroup membership.
#>
#Requires -Modules ComputerManagementDsc

configuration ComputerSettings
{
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Name,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $DomainName,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $WorkGroupName,

        [Parameter()]
        [ValidatePattern('^(?:(?<cn>CN=(?<name>(?:[^,]|\,)*)),)?(?:(?<path>(?:(?:CN|OU)=(?:[^,]|\,)+,?)+),)?(?<domain>(?:DC=(?:[^,]|\,)+,?)+)$')]
        [System.String]
        $JoinOU,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [ValidateSet(
            'Hawaiian Standard Time', 'Alaskan Standard Time', 'Pacific Standard Time',
            'Mountain Standard Time', 'US Mountain Standard Time', 'Canada Central Standard Time',
            'Central Standard Time', 'US Eastern Standard Time', 'Eastern Standard Time',
            'Atlantic Standard Time', 'Newfoundland Standard Time', 'UTC'
        )]
        [System.String]
        $TimeZone


    )
    
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName ComputerManagementDsc
    Import-DscResource -ModuleName DSCR_MSLicense

    # Parameters for DSC resource 'TimeZone'
    $timeZoneParamList = @(
        'IsSingleInstance',
        'TimeZone',
        'DependsOn',
        'PsDscRunAsCredential'
    )

    # Parameters for DSC resource 'Computer'
    $computerParamList = @(
        'Name',
        'Credential',
        'DependsOn',
        'Description',
        'DomainName',
        'JoinOU',
        'PsDscRunAsCredential',
        'Server',
        'UnjoinCredential',
        'WorkGroupName'
    )

    
    # create DSC resource for Computer
    $params = @{ }
    foreach ($item in ($PSBoundParameters.GetEnumerator() | Where-Object Key -In $computerParamList))
    {
        $params.Add($item.Key, $item.Value)
    }
    (Get-DscSplattedResource -ResourceName Computer -ExecutionName "Computer$($params.Name)" -Properties $params -NoInvoke).Invoke($params)
    
    
    # create DSC resource for TimeZone
    $params = @{ }
    foreach ($item in ($PSBoundParameters.GetEnumerator() | Where-Object Key -In $timeZoneParamList))
    {
        $params.Add($item.Key, $item.Value)
    }
    $params.Add('IsSingleInstance', 'Yes')
    (Get-DscSplattedResource -ResourceName TimeZone -ExecutionName "TimeZone$($params.Name)" -Properties $params -NoInvoke).Invoke($params)



}
