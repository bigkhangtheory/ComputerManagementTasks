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

    foreach ( $task in $Tasks )
    {
        # Remove Case Sensitivity of ordered Dictionary or Hashtables
        $task = @{} + $task

        if ( $null -ne $task.ExecuteAsCredential )
        {
            $task.ExecuteAsCredential = [PSCredential]$task.ExecuteAsCredential
            #$task.Remove( 'ExecuteAsCredential' )
        }

        $executionName = "$($task.TaskName -replace '[().:\s]', '_')"

        (Get-DscSplattedResource -ResourceName ScheduledTask -ExecutionName $executionName -Properties $task -NoInvoke).Invoke($task)
    }
}
