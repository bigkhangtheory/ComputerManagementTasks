<#
    .DESCRIPTION
#>
#Requires -Module xPSDesiredStateConfiguration

configuration LocalGroups
{
    param
    (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Groups
    )

    Import-DscResource -ModuleName xPSDesiredStateConfiguration

    foreach ($g in $Groups)
    {
        # remove case sensivity of ordered Dictionary or Hashtables
        $g = @{} + $g

        # the property 'GroupName' must be specified
        if ( -not $g.ContainsKey('GroupName') )
        {
            throw 'ERROR: The property GroupName is not found.'
        }

        # if the property 'Members' is specified, then 'MembersToInlude' and 'MembersToExclude' are not valid
        if ( $g.ContainsKey('Members') )
        {
            if ( ($g.ContainsKey('MembersToInclude')) -or ($g.ContainsKey('MembersToExlude')) )
            {
                throw "ERROR: If 'Members' is specified then the properties 'MembersToInclude' and 'MembersToExlude' should not be specified."
            }
        }

        # if not specified, ensure 'Present'
        if ( -not $g.ContainsKey('Ensure') )
        {
            $g.Ensure = 'Present'
        }

        # create execution name for resource
        $executionName = "$("$($node.Name)_$($g.GroupName)" -replace '[-().:\s]', '_')"


        # create resource for local groups
        $Splatting = @{
            ResourceName  = 'xGroup'
            ExecutionName = $executionName
            Properties    = $g
            NoInvoke      = $true
        }
        (Get-DscSplattedResource @Splatting).Invoke($g)
    }
} #end configuration
