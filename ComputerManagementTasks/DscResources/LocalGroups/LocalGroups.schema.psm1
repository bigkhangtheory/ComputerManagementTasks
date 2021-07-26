<#
    .DESCRIPTION
#>
#Requires -Module xPSDesiredStateConfiguration

configuration LocalGroups {
    param (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Groups
    )
    
    Import-DscResource -ModuleName xPSDesiredStateConfiguration

    foreach ($group in $Groups)
    {
        # remove case sensivity of ordered Dictionary or Hashtables
        $group = @{} + $group

        # create execution name for resource
        $executionName = "$($group.GroupName -replace '[-().:\s]', '_')"

        # create resource for local groups
        (Get-DscSplattedResource -ResourceName xGroup -ExecutionName $executionName -Properties $group -NoInvoke).Invoke($group)
    }
}
