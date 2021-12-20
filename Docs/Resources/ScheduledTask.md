# ScheduledTask

## Parameters

| Parameter                           | Attribute  | DataType         | Description                                                                                                                                                                                                                                                                    | Allowed Values                                                                               |
| ----------------------------------- | ---------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| **TaskName**                        | *Required* | `[String]`       | The name of the task.                                                                                                                                                                                                                                                          |                                                                                              |
| **TaskPath**                        |            | `[String]`       | The path to the task - defaults to the root directory.                                                                                                                                                                                                                         |                                                                                              |
| **Description**                     |            | `[String]`       | The task description.                                                                                                                                                                                                                                                          |                                                                                              |
| **ActionExecutable**                |            | `[String]`       | The path to the .exe for this task.                                                                                                                                                                                                                                            |                                                                                              |
| **ActionArguments**                 |            | `[String]`       | The arguments to pass the executable.                                                                                                                                                                                                                                          |                                                                                              |
| **ActionWorkingPath**               |            | `[String]`       | The working path to specify for the executable.                                                                                                                                                                                                                                |                                                                                              |
| **ScheduleType**                    |            | `[String]`       | When should the task be executed.                                                                                                                                                                                                                                              | `Once`, `Daily`, `Weekly`, `AtStartup`, `AtLogOn`, `OnEvent`                                 |
| **RepeatInterval**                  |            | `[String]`       | How many units (minutes, hours, days) between each run of this task?                                                                                                                                                                                                           |                                                                                              |
| **StartTime**                       |            | `[DateTime]`     | The time of day this task should start at - defaults to 12:00 AM. Not valid for AtLogon and AtStartup tasks.                                                                                                                                                                   |                                                                                              |
| **SynchronizeAcrossTimeZone**       |            | `[Boolean]`      | Enable the scheduled task option to synchronize across time zones. This is enabled by including the timezone offset in the scheduled task trigger. Defaults to false which does not include the timezone offset.                                                               |                                                                                              |
| **Ensure**                          |            | `[String]`       | Present if the task should exist, Absent if it should be removed.                                                                                                                                                                                                              | `Present`, `Absent`                                                                          |
| **Enable**                          |            | `[Boolean]`      | True if the task should be enabled, false if it should be disabled.                                                                                                                                                                                                            |                                                                                              |
| **BuiltInAccount**                  |            | `[String]`       | Run the task as one of the built in service accounts. When set ExecuteAsCredential will be ignored and LogonType will be set to 'ServiceAccount'.                                                                                                                              | `SYSTEM`, `LOCAL SERVICE`, `NETWORK SERVICE`                                                 |
| **ExecuteAsCredential**             |            | `[PSCredential]` | The credential this task should execute as. If not specified defaults to running as the local system account.                                                                                                                                                                  |                                                                                              |
| **ExecuteAsGMSA**                   |            | `[String]`       | The gMSA (Group Managed Service Account) this task should execute as. Cannot be used in combination with ExecuteAsCredential or BuiltInAccount.                                                                                                                                |                                                                                              |
| **DaysInterval**                    |            | `[UInt32]`       | Specifies the interval between the days in the schedule. An interval of 1 produces a daily schedule. An interval of 2 produces an every-other day schedule.                                                                                                                    |                                                                                              |
| **RandomDelay**                     |            | `[String]`       | Specifies a random amount of time to delay the start time of the trigger. The delay time is a random time between the time the task triggers and the time that you specify in this setting.                                                                                    |                                                                                              |
| **RepetitionDuration**              |            | `[String]`       | Specifies how long the repetition pattern repeats after the task starts. May be set to `Indefinitely` to specify an indefinite duration.                                                                                                                                       |                                                                                              |
| **DaysOfWeek**                      |            | `[String[]]`     | Specifies an array of the days of the week on which Task Scheduler runs the task.                                                                                                                                                                                              |                                                                                              |
| **WeeksInterval**                   |            | `[UInt32]`       | Specifies the interval between the weeks in the schedule. An interval of 1 produces a weekly schedule. An interval of 2 produces an every-other week schedule.                                                                                                                 |                                                                                              |
| **User**                            |            | `[String]`       | Specifies the identifier of the user for a trigger that starts a task when a user logs on.                                                                                                                                                                                     |                                                                                              |
| **DisallowDemandStart**             |            | `[Boolean]`      | Indicates whether the task is prohibited to run on demand or not. Defaults to $false.                                                                                                                                                                                          |                                                                                              |
| **DisallowHardTerminate**           |            | `[Boolean]`      | Indicates whether the task is prohibited to be terminated or not. Defaults to $false.                                                                                                                                                                                          |                                                                                              |
| **Compatibility**                   |            | `[String]`       | The task compatibility level. Defaults to Vista.                                                                                                                                                                                                                               | `AT`, `V1`, `Vista`, `Win7`, `Win8`                                                          |
| **AllowStartIfOnBatteries**         |            | `[Boolean]`      | Indicates whether the task should start if the machine is on batteries or not. Defaults to $false.                                                                                                                                                                             |                                                                                              |
| **Hidden**                          |            | `[Boolean]`      | Indicates that the task is hidden in the Task Scheduler UI.                                                                                                                                                                                                                    |                                                                                              |
| **RunOnlyIfIdle**                   |            | `[Boolean]`      | Indicates that Task Scheduler runs the task only when the computer is idle.                                                                                                                                                                                                    |                                                                                              |
| **IdleWaitTimeout**                 |            | `[String]`       | Specifies the amount of time that Task Scheduler waits for an idle condition to occur.                                                                                                                                                                                         |                                                                                              |
| **NetworkName**                     |            | `[String]`       | Specifies the name of a network profile that Task Scheduler uses to determine if the task can run. The Task Scheduler UI uses this setting for display purposes. Specify a network name if you specify the RunOnlyIfNetworkAvailable parameter.                                |                                                                                              |
| **DisallowStartOnRemoteAppSession** |            | `[Boolean]`      | Indicates that the task does not start if the task is triggered to run in a Remote Applications Integrated Locally (RAIL) session.                                                                                                                                             |                                                                                              |
| **StartWhenAvailable**              |            | `[Boolean]`      | Indicates that Task Scheduler can start the task at any time after its scheduled time has passed.                                                                                                                                                                              |                                                                                              |
| **DontStopIfGoingOnBatteries**      |            | `[Boolean]`      | Indicates that the task does not stop if the computer switches to battery power.                                                                                                                                                                                               |                                                                                              |
| **WakeToRun**                       |            | `[Boolean]`      | Indicates that Task Scheduler wakes the computer before it runs the task.                                                                                                                                                                                                      |                                                                                              |
| **IdleDuration**                    |            | `[String]`       | Specifies the amount of time that the computer must be in an idle state before Task Scheduler runs the task.                                                                                                                                                                   |                                                                                              |
| **RestartOnIdle**                   |            | `[Boolean]`      | Indicates that Task Scheduler restarts the task when the computer cycles into an idle condition more than once.                                                                                                                                                                |                                                                                              |
| **DontStopOnIdleEnd**               |            | `[Boolean]`      | Indicates that Task Scheduler does not terminate the task if the idle condition ends before the task is completed.                                                                                                                                                             |                                                                                              |
| **ExecutionTimeLimit**              |            | `[String]`       | Specifies the amount of time that Task Scheduler is allowed to complete the task.                                                                                                                                                                                              |                                                                                              |
| **MultipleInstances**               |            | `[String]`       | Specifies the policy that defines how Task Scheduler handles multiple instances of the task.                                                                                                                                                                                   | `IgnoreNew`, `Parallel`, `Queue`, `StopExisting`                                             |
| **Priority**                        |            | `[UInt32]`       | Specifies the priority level of the task. Priority must be an integer from 0 (highest priority) to 10 (lowest priority). The default value is 7. Priority levels 7 and 8 are used for background tasks. Priority levels 4, 5, and 6 are used for interactive tasks.            |                                                                                              |
| **RestartCount**                    |            | `[UInt32]`       | Specifies the number of times that Task Scheduler attempts to restart the task.                                                                                                                                                                                                |                                                                                              |
| **RestartInterval**                 |            | `[String]`       | Specifies the amount of time that Task Scheduler attempts to restart the task.                                                                                                                                                                                                 |                                                                                              |
| **RunOnlyIfNetworkAvailable**       |            | `[Boolean]`      | Indicates that Task Scheduler runs the task only when a network is available. Task Scheduler uses the NetworkID parameter and NetworkName parameter that you specify in this cmdlet to determine if the network is available.                                                  |                                                                                              |
| **RunLevel**                        |            | `[String]`       | Specifies the level of user rights that Task Scheduler uses to run the tasks that are associated with the principal. Defaults to 'Limited'.                                                                                                                                    | `Limited`, `Highest`                                                                         |
| **LogonType**                       |            | `[String]`       | Specifies the security logon method that Task Scheduler uses to run the tasks that are associated with the principal.                                                                                                                                                          | `Group`, `Interactive`, `InteractiveOrPassword`, `None`, `Password`, `S4U`, `ServiceAccount` |
| **EventSubscription**               |            | `[String]`       | Specifies the EventSubscription in XML. This can be easily generated using the Windows Eventlog Viewer. For the query schema please check: https://docs.microsoft.com/en-us/windows/desktop/WES/queryschema-schema. Can only be used in combination with ScheduleType OnEvent. |                                                                                              |
| **Delay**                           |            | `[String]`       | Specifies a delay to the start of the trigger. The delay is a static delay before the task is executed. Can only be used in combination with ScheduleType OnEvent.                                                                                                             |                                                                                              |

## Description

The resource is used to define basic run once or recurring scheduled tasks
on the local computer. It can also be used to delete or disable built-in
scheduled tasks.

## Known Issues

One of the values needed for the `MultipleInstances` parameter is missing from the
`Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.MultipleInstancesEnum`
enumerator. There are four valid values defined for the `MultipleInstances` property of the
Task Settings ([TaskSettings.MultipleInstances Property](https://docs.microsoft.com/en-us/windows/win32/taskschd/tasksettings-multipleinstances "TaskSettings.MultipleInstances Property")).
The `MultipleInstancesEnum` enumerator has three values, which can be mapped to three
of the four valid values, but there is no value corresponding to `TASK_INSTANCES_STOP_EXISTING`.
The result of this omission is that a workaround is required to
accommodate the `StopExisting` value for the `MultipleInstances` parameter,
which would not be necessary if the enumerator had all four valid values.

### ExecuteAsCredential

#### When Using a BUILTIN Group

When creating a scheduled task that uses an `ExecuteAsCredential` that
is one of the 'BUILTIN' groups (e.g. 'BUILTIN\Users'), specifying the
username to include the 'BUILTIN' domain name will result in the resource
never going into state. The same behavior will also occur if setting a
'BUILTIN' group in the UI.

To prevent this issue, set the username in the `ExecuteAsCredential` to the
name of the group only (e.g. 'Users').

#### When Using a Domain User/Group

When creating a scheduled task that uses an `ExecuteAsCredential` that
is a domain user or group, (e.g. 'CONTOSO\ServiceUser'), the domain
name must be included, otherwise the resource will not go into state.

To prevent this issue, set the username in the `ExecuteAsCredential` to the
name of the group only (e.g. 'CONTOSO\ServiceUser').

## Examples

### Example 1

This example creates a scheduled task called 'Test task Once' in the folder
task folder 'MyTasks' that starts a new powershell process once at 00:00 repeating
every 15 minutes for 8 hours. The task is delayed by a random amount up to 1 hour
each time. The task will run even if the previous task is still running and it
will prevent hard termintaing of the previously running task instance. The task
execution will have no time limit.

```powershell
Configuration ScheduledTask_CreateScheduledTaskOnce_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask ScheduledTaskOnceAdd
        {
            TaskName              = 'Test task Once'
            TaskPath              = '\MyTasks'
            ActionExecutable      = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ScheduleType          = 'Once'
            RepeatInterval        = '00:15:00'
            RepetitionDuration    = '08:00:00'
            ExecutionTimeLimit    = '00:00:00'
            ActionWorkingPath     = (Get-Location).Path
            Enable                = $true
            RandomDelay           = '01:00:00'
            DisallowHardTerminate = $true
            RunOnlyIfIdle         = $false
            Priority              = 9
        }
    }
}
```

### Example 2

This example creates a scheduled task called 'Test task interactive' in the folder
task folder 'MyTasks' that starts a new powershell process once. The task will
execute using the credential passed into the $Credential parameter, but only when
the user contained in the $Credential is logged on.

```powershell
Configuration ScheduledTask_RunPowerShellTaskOnceAsUserInteractiveOnly_Config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullorEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask MaintenanceScriptExample
        {
            TaskName            = 'Test task Interactive'
            TaskPath            = '\MyTasks'
            ActionExecutable    = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ScheduleType        = 'Once'
            ActionWorkingPath   = (Get-Location).Path
            Enable              = $true
            ExecuteAsCredential = $Credential
            LogonType           = 'Interactive'
        }
    }
}
```

### Example 3

This example disables the built-in scheduled task called
'CreateExplorerShellUnelevatedTask'.

```powershell
Configuration ScheduledTask_DisableABuiltInTask_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask DisableCreateExplorerShellUnelevatedTask
        {
            TaskName            = 'CreateExplorerShellUnelevatedTask'
            TaskPath            = '\'
            Enable              = $false
        }
    }
}
```

### Example 4

This example deletes the built-in scheduled task called
'CreateExplorerShellUnelevatedTask'.

```powershell
Configuration ScheduledTask_DeleteABuiltInTask_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask DeleteCreateExplorerShellUnelevatedTask
        {
            TaskName            = 'CreateExplorerShellUnelevatedTask'
            TaskPath            = '\'
            Ensure              = 'Absent'
        }
    }
}
```

### Example 5

This example creates a scheduled task called 'TriggerOnServiceFailures' in the folder
root folder. The task is delayed by exactly 30 seconds each time. The task will run when
an error event 7001 of source Service Control Manager is generated in the system log.
When a service crashes, it waits for 30 seconds and then starts a new PowerShell instance,
in which the file c:\temp\seeme.txt get's created with the value 'Worked!'

```powershell
Configuration ScheduledTask_CreateScheduledTasksOnEvent_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask ServiceEventManager
        {
            TaskName = 'TriggerOnServiceFailures'
            Ensure = 'Present'
            ScheduleType = 'OnEvent'
            ActionExecutable = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ActionArguments = '-Command Set-Content -Path c:\temp\seeme.txt -Value ''Worked!'''
            EventSubscription = '<QueryList><Query Id="0" Path="System"><Select Path="System">*[System[Provider[@Name=''Service Control Manager''] and (Level=2) and (EventID=7001)]]</Select></Query></QueryList>'
            Delay = '00:00:30'
        }
    }
}
```

### Example 6

This example creates a scheduled task called 'Test task Run As gMSA'
in the folder task folder 'MyTasks' that starts a new powershell process once.
The task will run as the user passed into the ExecuteAsGMSA parameter.

```powershell
Configuration ScheduledTask_RunPowerShellTaskOnceAsGroupManagedServiceAccount_Config
{
    param
    (
        # Group Managed Service Account must be in the form of DOMAIN\gMSA$ or user@domain.fqdn (UPN)
        [Parameter()]
        [ValidatePattern('^\w+\\\w+\$$|\w+@\w+\.\w+')]
        [System.String]
        $GroupManagedServiceAccount = 'DOMAIN\gMSA$'
    )

    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask MaintenanceScriptExample
        {
            TaskName            = 'Test task Run As gMSA'
            TaskPath            = '\MyTasks'
            ActionExecutable    = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ScheduleType        = 'Once'
            ActionWorkingPath   = (Get-Location).Path
            Enable              = $true
            ExecuteAsGMSA       = $GroupManagedServiceAccount
        }
    }
}
```

### Example 7

This example creates a scheduled task called 'Test task sync across time zone enabled'
in the folder 'MyTasks' that starts a new powershell process once 2018-10-01 01:00
The task will have the option Synchronize across time zone enabled.

```powershell
Configuration ScheduledTask_CreateScheduledTaskOnceSynchronizeAcrossTimeZoneEnabled_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask ScheduledTaskOnceSynchronizeAcrossTimeZoneEnabled
        {
            TaskName                  = 'Test task sync across time zone enabled'
            TaskPath                  = '\MyTasks\'
            ActionExecutable          = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ScheduleType              = 'Once'
            StartTime                 = '2018-10-01T01:00:00'
            SynchronizeAcrossTimeZone = $true
            ActionWorkingPath         = (Get-Location).Path
            Enable                    = $true
        }
    }
}
```

### Example 8

This example creates a scheduled task called 'Test As NetworkService' in
the folder root folder. The task is set to run every 15 minutes.
When run the task will start a new PowerShell instance running as the
builtin user NETWORK SERVICE.
The PowerShell instance will write the value of $env:USERNAME to the
file c:\temp\seeme.txt.
The contents of c:\temp\seeme.txt should be "NETWORK SERVICE".

```powershell
Configuration ScheduledTask_CreateScheduledTasksAsBuiltInServiceAccount_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask ScheduledTaskAsNetworkService
        {
            TaskName           = 'Test As NetworkService'
            Ensure             = 'Present'
            ActionExecutable   = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ActionArguments    = '-Command Set-Content -Path c:\temp\seeme.txt -Value $env:USERNAME -Force'
            ScheduleType       = 'Once'
            RepeatInterval     = '00:15:00'
            RepetitionDuration = '4.00:00:00'
            BuiltInAccount     = 'NETWORK SERVICE'
        }
    }
}

```

### Example 9

This example creates a scheduled task called 'Test task Daily' in the folder
task folder 'MyTasks' that starts a new powershell process every day at 00:00 repeating
every 15 minutes for 8 hours. If the task fails it will be restarted after 5 minutes
and it will be restarted a maximum of two times. It will only run if the network
is connected and will wake the machine up to execute the task.

```powershell
Configuration ScheduledTask_CreateScheduledTaskDaily_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask ScheduledTaskDailyAdd
        {
            TaskName                  = 'Test task Daily'
            TaskPath                  = '\MyTasks'
            ActionExecutable          = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ScheduleType              = 'Daily'
            DaysInterval              = 1
            RepeatInterval            = '00:15:00'
            RepetitionDuration        = '08:00:00'
            RestartCount              = 2
            RestartInterval           = '00:05:00'
            RunOnlyIfNetworkAvailable = $true
            WakeToRun                 = $true
        }
    }
}
```

### Example 10

This example creates a scheduled task called 'Test task Daily Indefinitely' in the folder
task folder 'MyTasks' that starts a new powershell process every day at 00:00 repeating
every 15 minutes indefinitely.

```powershell
Configuration ScheduledTask_CreateScheduledTasksDailyIndefinitely_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask ScheduledTaskDailyIndefinitelyAdd
        {
            TaskName           = 'Test task Daily Indefinitely'
            TaskPath           = '\MyTasks'
            ActionExecutable   = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ScheduleType       = 'Daily'
            DaysInterval       = 1
            RepeatInterval     = '00:15:00'
            RepetitionDuration = 'Indefinitely'
        }
    }
}
```

### Example 11

This example creates a scheduled task called 'Test task Weekly' in the folder
task folder 'MyTasks' that starts a new powershell process every week on
Monday, Wednesday and Saturday at 00:00 repeating every 15 minutes for 8 hours.
The task will be hidden and will be allowed to start if the machine is running
on batteries. The task will be compatible with Windows 8.

```powershell
Configuration ScheduledTask_CreateScheduledTasksWeekly_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask ScheduledTaskWeeklyAdd
        {
            TaskName                = 'Test task Weekly'
            TaskPath                = '\MyTasks'
            ActionExecutable        = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ScheduleType            = 'Weekly'
            WeeksInterval           = 1
            DaysOfWeek              = 'Monday', 'Wednesday', 'Saturday'
            RepeatInterval          = '00:15:00'
            RepetitionDuration      = '08:00:00'
            AllowStartIfOnBatteries = $true
            Compatibility           = 'Win8'
            Hidden                  = $true
        }
    }
}
```

### Example 12

This example creates a scheduled task called 'Test task Logon' in the folder
task folder 'MyTasks' that starts a new powershell process when the machine
is logged on repeating every 15 minutes for 8 hours.

```powershell
Configuration ScheduledTask_CreateScheduledTasksAtLogon_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask ScheduledTaskLogonAdd
        {
            TaskName           = 'Test task Logon'
            TaskPath           = '\MyTasks'
            ActionExecutable   = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ScheduleType       = 'AtLogOn'
            RepeatInterval     = '00:15:00'
            RepetitionDuration = '08:00:00'
        }
    }
}
```

### Example 13

This example creates a scheduled task called 'Test task Startup' in the folder
task folder 'MyTasks' that starts a new powershell process when the machine
is started up repeating every 15 minutes for 8 hours.

```powershell
Configuration ScheduledTask_CreateScheduledTasksAtStartup_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask ScheduledTaskStartupAdd
        {
            TaskName           = 'Test task Startup'
            TaskPath           = '\MyTasks'
            ActionExecutable   = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ScheduleType       = 'AtStartup'
            RepeatInterval     = '00:15:00'
            RepetitionDuration = '08:00:00'
        }
    }
}
```

### Example 14

This example will create a scheduled task that will call PowerShell.exe every 15
minutes for 4 days to run a script saved locally. The task will start immediately.
The script will be called as the local system account.

```powershell
Configuration ScheduledTask_RunPowerShellTaskEvery15Minutes_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask MaintenanceScriptExample
        {
          TaskName           = "Custom maintenance tasks"
          ActionExecutable   = "C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe"
          ActionArguments    = "-File `"C:\scripts\my custom script.ps1`""
          ScheduleType       = 'Once'
          RepeatInterval     = '00:15:00'
          RepetitionDuration = '4.00:00:00'
        }
    }
}
```

### Example 15

This example will create a scheduled task that will call PowerShell.exe every 15
minutes indefinitely to run a script saved locally. The task will start immediately.
The script will be called as the local system account.

```powershell
Configuration ScheduledTask_RunPowerShellTaskEvery15MinutesIndefinitely_Config
{
    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask MaintenanceScriptExample
        {
          TaskName           = "Custom maintenance tasks"
          ActionExecutable   = "C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe"
          ActionArguments    = "-File `"C:\scripts\my custom script.ps1`""
          ScheduleType       = 'Once'
          RepeatInterval     = '00:15:00'
          RepetitionDuration = 'Indefinitely'
        }
    }
}
```

### Example 16

This example creates a scheduled task called 'Test task Run As Highest Privilege'
in the folder task folder 'MyTasks' that starts a new powershell process once.
The task will run as the credential passed into the $Credential parameter, running
with the highest privileges.

```powershell
Configuration ScheduledTask_RunPowerShellTaskOnceAsUserWithHighestPriveleges_Config
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullorEmpty()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    Import-DscResource -ModuleName ComputerManagementDsc

    Node localhost
    {
        ScheduledTask MaintenanceScriptExample
        {
            TaskName            = 'Test task Run As Highest Privilege'
            TaskPath            = '\MyTasks'
            ActionExecutable    = 'C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe'
            ScheduleType        = 'Once'
            ActionWorkingPath   = (Get-Location).Path
            Enable              = $true
            ExecuteAsCredential = $Credential
            RunLevel            = 'Highest'
        }
    }
}
```

