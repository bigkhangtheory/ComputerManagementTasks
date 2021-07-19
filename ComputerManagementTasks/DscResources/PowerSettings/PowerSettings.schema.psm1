<#
    .DESCRIPTION
        The resource allows you to configure a computer by changing its name and description and modifying its Active Directory domain or workgroup membership.
#>
#Requires -Module ComputerManagementDsc

configuration PowerSettings
{
    param (
        [Parameter(Mandatory)]
        [System.String]
        $PowerPlan
    )

    Import-DscResource -ModuleName ComputerManagementDsc

    # create execution name for DSC resource
    $executionName = "$($PowerPlan -replace '[-().:\s]', '_')"

    # create DSC resource for Power Plan activation
    PowerPlan "$executionNamne"
    {
        IsSingleInstance = 'Yes'
        Name             = $PowerPlan
    }
}