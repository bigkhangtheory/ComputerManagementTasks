configuration ScheduledTasks
{
    param
    (
        [Parameter()]
        [System.Collections.Hashtable[]]
        $Tasks
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName ComputerManagementDsc

    foreach ( $t in $Tasks )
    {
        # Remove Case Sensitivity of ordered Dictionary or Hashtables
        $t = @{} + $t

        # if not specified, ensure 'Present'
        if ([String]::IsNullOrWhiteSpace($t.Ensure))
        {
            $t.Ensure = 'Present'
        }

        # if not specified, enable
        if ($null -eq $t.Enable)
        {
            $t.Enable = $true
        }

        if ( $null -ne $t.ExecuteAsCredential )
        {
            $t.ExecuteAsCredential = [PSCredential]$t.ExecuteAsCredential
            #$task.Remove( 'ExecuteAsCredential' )
        }

        # create execution name for the resource
        $executionName = "$($t.TaskName -replace '[().:\s]', '_')"

        # create DSC resource
        $Splatting = @{
            ResourceName  = 'ScheduledTask'
            ExecutionName = $executionName
            Properties    = $t
            NoInvoke      = $true
        }
        (Get-DscSplattedResource @Splatting).Invoke($t)
    } #end foreach
} #end configuration
