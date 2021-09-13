<#
    .DESCRIPTION
        This DSC configuration creates shortcut files on a target node.
    .PARAMETER Items
        Specifies a list of shortcut resources to create.
    .LINK
        https://github.com/mkht/DSCR_Shortcut
    .NOTES
        Author:     Khang M. Nguyen
        Created:    2021-09-12
#>
#Requires -Module DSCR_Shortcut


configuration ShortcutLinks
{
    param 
    (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable[]]
        $Items
    )

    <#
        Import required modules
    #>
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName 'DSCR_Shortcut'


    <#
        Create DSC resource for shortcut files
    #>
    foreach ($i in $Items)
    {
        # remove case sensitivity of ordered Dictionary or Hashtabels
        $i = @{ } + $i

        # if not specified, ensure 'Present'
        if (-not $i.ContainsKey('Ensure'))
        {
            $i.Ensure = 'Present'
        }

        # create execution name for the resource
        $executionName = "$($i.Path -replace '[-().:\s\\]', '_')"

        # create DSC resource
        $Splatting = @{
            ResourceName  = 'cShortcut'
            ExecutionName = $executionName
            Properties    = $i
            NoInvoke      = $true
        }
        (Get-DscSplattedResource @Splatting).Invoke($i)
    } #end foreach
} #end configuration