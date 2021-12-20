# ScheduledTasks

ScheduledTasks is used to define basic run once or recurring scheduled tasks on the local computer and can also be used to delete or disable built-in scheduled tasks.

<br />

## Project Information

|                  |                                                                                                                           |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/ScheduledTasks |
| **Dependencies** | [ComputerManagementDsc][ComputerManagementDsc], [xPSDesiredStateConfiguration][xPSDesiredStateConfiguration]              |
| **Resources**    | [ScheduledTask][ScheduledTask], [xWindowsFeature][xWindowsFeature]                                                        |

<br />

## Parameters

<br />

### Table. Attributes of `ScheduledTasks`

| Parameter | Attribute | DataType        | Description                                            | Allowed Values |
| :-------- | :-------- | :-------------- | :----------------------------------------------------- | :------------- |
| **Tasks** |           | `[Hashtable[]]` | Specify a list of Scheduled Tasks resources to create. |                |

---

#### Table. Attributes of `Tasks`

| Parameter                           | Attribute  | DataType         | Description                                                                                                                                                                                  | Allowed Values                                                                               |
| :---------------------------------- | :--------- | :--------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------- |
| **TaskName**                        | *Required* | `[String]`       | The name of the task.                                                                                                                                                                        |                                                                                              |
| **TaskPath**                        |            | `[String]`       | The path to the task - defaults to the root directory.                                                                                                                                       |                                                                                              |
| **Description**                     |            | `[String]`       | The task description.                                                                                                                                                                        |                                                                                              |
| **ActionExecutable**                |            | `[String]`       | The path to the .exe for this task.                                                                                                                                                          |                                                                                              |
| **ActionArguments**                 |            | `[String]`       | The arguments to pass the executable.                                                                                                                                                        |                                                                                              |
| **ActionWorkingPath**               |            | `[String]`       | The working path to specify for the executable.                                                                                                                                              |                                                                                              |
| **ScheduleType**                    |            | `[String]`       | When should the task be executed.                                                                                                                                                            | `Once`, `Daily`, `Weekly`, `AtStartup`, `AtLogOn`, `OnEvent`                                 |
| **RepeatInterval**                  |            | `[String]`       | How many units (minutes, hours, days) between each run of this task?                                                                                                                         |                                                                                              |
| **StartTime**                       |            | `[DateTime]`     | The time of day this task should start at - defaults to 12:00 AM. Not valid for AtLogon and AtStartup tasks.                                                                                 |                                                                                              |
| **SynchronizeAcrossTimeZone**       |            | `[Boolean]`      | Enable the scheduled task option to synchronize across time zones. This is enabled by including the timezone offset in the scheduled task trigger. Defaults to false.                        |                                                                                              |
| **Ensure**                          |            | `[String]`       | Present if the task should exist, Absent if it should be removed.                                                                                                                            | `Present`, `Absent`                                                                          |
| **Enable**                          |            | `[Boolean]`      | True if the task should be enabled, false if it should be disabled.                                                                                                                          |                                                                                              |
| **BuiltInAccount**                  |            | `[String]`       | Run the task as one of the built in service accounts. When set ExecuteAsCredential will be ignored and LogonType will be set to 'ServiceAccount'.                                            | `SYSTEM`, `LOCAL SERVICE`, `NETWORK SERVICE`                                                 |
| **ExecuteAsCredential**             |            | `[PSCredential]` | The credential this task should execute as. If not specified defaults to running as the local system account.                                                                                |                                                                                              |
| **ExecuteAsGMSA**                   |            | `[String]`       | The gMSA (Group Managed Service Account) this task should execute as. Cannot be used in combination with ExecuteAsCredential or BuiltInAccount.                                              |                                                                                              |
| **DaysInterval**                    |            | `[UInt32]`       | Specifies the interval between the days in the schedule. An interval of 1 produces a daily schedule. An interval of 2 produces an every-other day schedule.                                  |                                                                                              |
| **RandomDelay**                     |            | `[String]`       | Specifies a random amount of time to delay the start time of the trigger. The delay time is a random time between the time the task triggers and the time that you specify in this setting.  |                                                                                              |
| **RepetitionDuration**              |            | `[String]`       | Specifies how long the repetition pattern repeats after the task starts. May be set to `Indefinitely` to specify an indefinite duration.                                                     |                                                                                              |
| **DaysOfWeek**                      |            | `[String[]]`     | Specifies an array of the days of the week on which Task Scheduler runs the task.                                                                                                            |                                                                                              |
| **WeeksInterval**                   |            | `[UInt32]`       | Specifies the interval between the weeks in the schedule. An interval of 1 produces a weekly schedule. An interval of 2 produces an every-other week schedule.                               |                                                                                              |
| **User**                            |            | `[String]`       | Specifies the identifier of the user for a trigger that starts a task when a user logs on.                                                                                                   |                                                                                              |
| **DisallowDemandStart**             |            | `[Boolean]`      | Indicates whether the task is prohibited to run on demand or not. Defaults to $false.                                                                                                        |                                                                                              |
| **DisallowHardTerminate**           |            | `[Boolean]`      | Indicates whether the task is prohibited to be terminated or not. Defaults to $false.                                                                                                        |                                                                                              |
| **Compatibility**                   |            | `[String]`       | The task compatibility level. Defaults to Vista.                                                                                                                                             | `AT`, `V1`, `Vista`, `Win7`, `Win8`                                                          |
| **AllowStartIfOnBatteries**         |            | `[Boolean]`      | Indicates whether the task should start if the machine is on batteries or not. Defaults to $false.                                                                                           |                                                                                              |
| **Hidden**                          |            | `[Boolean]`      | Indicates that the task is hidden in the Task Scheduler UI.                                                                                                                                  |                                                                                              |
| **RunOnlyIfIdle**                   |            | `[Boolean]`      | Indicates that Task Scheduler runs the task only when the computer is idle.                                                                                                                  |                                                                                              |
| **IdleWaitTimeout**                 |            | `[String]`       | Specifies the amount of time that Task Scheduler waits for an idle condition to occur.                                                                                                       |                                                                                              |
| **NetworkName**                     |            | `[String]`       | Specifies the name of a network profile that Task Scheduler uses to determine if the task can run. Requires the RunOnlyIfNetworkAvailable parameter.                                         |                                                                                              |
| **DisallowStartOnRemoteAppSession** |            | `[Boolean]`      | Indicates that the task does not start if the task is triggered to run in a Remote Applications Integrated Locally (RAIL) session.                                                           |                                                                                              |
| **StartWhenAvailable**              |            | `[Boolean]`      | Indicates that Task Scheduler can start the task at any time after its scheduled time has passed.                                                                                            |                                                                                              |
| **DontStopIfGoingOnBatteries**      |            | `[Boolean]`      | Indicates that the task does not stop if the computer switches to battery power.                                                                                                             |                                                                                              |
| **WakeToRun**                       |            | `[Boolean]`      | Indicates that Task Scheduler wakes the computer before it runs the task.                                                                                                                    |                                                                                              |
| **IdleDuration**                    |            | `[String]`       | Specifies the amount of time that the computer must be in an idle state before Task Scheduler runs the task.                                                                                 |                                                                                              |
| **RestartOnIdle**                   |            | `[Boolean]`      | Indicates that Task Scheduler restarts the task when the computer cycles into an idle condition more than once.                                                                              |                                                                                              |
| **DontStopOnIdleEnd**               |            | `[Boolean]`      | Indicates that Task Scheduler does not terminate the task if the idle condition ends before the task is completed.                                                                           |                                                                                              |
| **ExecutionTimeLimit**              |            | `[String]`       | Specifies the amount of time that Task Scheduler is allowed to complete the task.                                                                                                            |                                                                                              |
| **MultipleInstances**               |            | `[String]`       | Specifies the policy that defines how Task Scheduler handles multiple instances of the task.                                                                                                 | `IgnoreNew`, `Parallel`, `Queue`, `StopExisting`                                             |
| **Priority**                        |            | `[UInt32]`       | Specifies the priority level of the task from 0 (highest) to 10 (lowest). Priority levels 7 and 8 are used for background tasks. Priority levels 4, 5, and 6 are used for interactive tasks. |                                                                                              |
| **RestartCount**                    |            | `[UInt32]`       | Specifies the number of times that Task Scheduler attempts to restart the task.                                                                                                              |                                                                                              |
| **RestartInterval**                 |            | `[String]`       | Specifies the amount of time that Task Scheduler attempts to restart the task.                                                                                                               |                                                                                              |
| **RunOnlyIfNetworkAvailable**       |            | `[Boolean]`      | Indicates that Task Scheduler runs the task only when a network is available. Requires the NetworkID parameter and NetworkName parameter.                                                    |                                                                                              |
| **RunLevel**                        |            | `[String]`       | Specifies the level of user rights that Task Scheduler uses to run the tasks that are associated with the principal. Defaults to 'Limited'.                                                  | `Limited`, `Highest`                                                                         |
| **LogonType**                       |            | `[String]`       | Specifies the security logon method that Task Scheduler uses to run the tasks that are associated with the principal.                                                                        | `Group`, `Interactive`, `InteractiveOrPassword`, `None`, `Password`, `S4U`, `ServiceAccount` |
| **EventSubscription**               |            | `[String]`       | Specifies the EventSubscription in XML. For the query schema please check: https://docs.microsoft.com/en-us/windows/desktop/WES/queryschema-schema. Requires ScheduleType OnEvent.           |                                                                                              |
| **Delay**                           |            | `[String]`       | Specifies a delay to the start of the trigger. The delay is a static delay before the task is executed. Can only be used in combination with ScheduleType OnEvent.                           |                                                                                              |

---

<br />

## Example `ScheduledTasks`

```yaml
ScheduledTasks:
  Tasks:
    # disable buildtin task
    - TaskName: CreateExplorerShellUnelevatedTask
      TaskPath: \
      Enable:   false
    # delete buildtin task
    - TaskName: CreateExplorerShellUnelevatedTask2
      TaskPath: \
      Ensure:   Absent
    # task starts at machine startup, repeating every 15 minutes for 8 hours
    - TaskName:           Test task Startup
      TaskPath:           \MyTasks
      ActionExecutable:   C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe
      ScheduleType:       AtStartup
      RepeatInterval:     00:15:00
      RepetitionDuration: 08:00:00
    # # task starts immedialtly every 15 minutes for 4 days
    - TaskName:           Custom maintenance tasks
      ActionExecutable:   C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe
      ActionArguments:    '-File "C:\scripts\my custom script.ps1"'
      ScheduleType:       Once
      RepeatInterval:     00:15:00
      RepetitionDuration: 4.00:00:00
    # task is set to run every 15 minutes and starts a new PowerShell instance running as the builtin user NETWORK SERVICE.
    - TaskName:           Test As NetworkService
      Ensure:             Present
      ActionExecutable:   C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe
      ActionArguments:    -Command Set-Content -Path c:\temp\seeme.txt -Value $env:USERNAME -Force
      ScheduleType:       Once
      RepeatInterval:     00:15:00
      RepetitionDuration: 04.00:00:00
      BuiltInAccount:     NETWORK SERVICE
    # task starts a new powershell process once
    - TaskName:            Test task Run As Highest Privilege
      TaskPath:            \MyTasks
      ActionExecutable:    C:\windows\system32\WindowsPowerShell\v1.0\powershell.exe
      ScheduleType:        Once
      ActionWorkingPath:   C:\Temp
      Enable:              true
      ExecuteAsCredential: '[ENC=PE9ianMgVmVyc2lvbj0iMS4xLjAuMSIgeG1sbnM9Imh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vcG93ZXJzaGVsbC8yMDA0LzA0Ij4NCiAgPE9iaiBSZWZJZD0iMCI+DQogICAgPFROIFJlZklkPSIwIj4NCiAgICAgIDxUPlN5c3RlbS5NYW5hZ2VtZW50LkF1dG9tYXRpb24uUFNDdXN0b21PYmplY3Q8L1Q+DQogICAgICA8VD5TeXN0ZW0uT2JqZWN0PC9UPg0KICAgIDwvVE4+DQogICAgPE1TPg0KICAgICAgPE9iaiBOPSJLZXlEYXRhIiBSZWZJZD0iMSI+DQogICAgICAgIDxUTiBSZWZJZD0iMSI+DQogICAgICAgICAgPFQ+U3lzdGVtLk9iamVjdFtdPC9UPg0KICAgICAgICAgIDxUPlN5c3RlbS5BcnJheTwvVD4NCiAgICAgICAgICA8VD5TeXN0ZW0uT2JqZWN0PC9UPg0KICAgICAgICA8L1ROPg0KICAgICAgICA8TFNUPg0KICAgICAgICAgIDxPYmogUmVmSWQ9IjIiPg0KICAgICAgICAgICAgPFROUmVmIFJlZklkPSIwIiAvPg0KICAgICAgICAgICAgPE1TPg0KICAgICAgICAgICAgICA8UyBOPSJIYXNoIj44MDg1MzBFQzZDOUMyNENEODIzMjEyMkNBNDAwQUQyQjA4RUYwQTA0QjlGQzM2NUQxOUY1NTY3MjdEQjNDOUJEPC9TPg0KICAgICAgICAgICAgICA8STMyIE49Ikl0ZXJhdGlvbkNvdW50Ij41MDAwMDwvSTMyPg0KICAgICAgICAgICAgICA8QkEgTj0iS2V5Ij5leUt6OUNtWjhFRUoyVmlqR1dhYVVodW9IcEtCeEd6SmZza3F1L3JicWxXZzVoVXkwYWd5QW1xZnI5WWExbDAxPC9CQT4NCiAgICAgICAgICAgICAgPEJBIE49Ikhhc2hTYWx0Ij5nQ3NLTldCTUdRMjF0Smc1QVA1UXcyRGdoWDZpTkx2cy8vZHFQbE5PNExnPTwvQkE+DQogICAgICAgICAgICAgIDxCQSBOPSJTYWx0Ij54OVhLaTVPRVg3SXRsbnQySkRPY0tJdlNZLzN1V2dOQjBjWFpaSitpWjZBPTwvQkE+DQogICAgICAgICAgICAgIDxCQSBOPSJJViI+NUVpcFhyeVBSeDA3dDI2dk1mNGlPR0dURldiT2tzVDdraHRxcjNiM1NsND08L0JBPg0KICAgICAgICAgICAgPC9NUz4NCiAgICAgICAgICA8L09iaj4NCiAgICAgICAgPC9MU1Q+DQogICAgICA8L09iaj4NCiAgICAgIDxCQSBOPSJDaXBoZXJUZXh0Ij54OUp0WXZDbXFKQmpaVitqNmQxK3VUazBEM0FiZ3cvMTRJbk5EMEN2ZXZCVTlkUG5tL091WFR4bWdGVVQzaUlMdGYzRnNxQ0VVc29wYkhSaHBPdjE5dz09PC9CQT4NCiAgICAgIDxCQSBOPSJITUFDIj5pR3FoYkYwR0w5NUF6bDFSTVhMa0twQ2VNRXcwa29QeGtJd1NzMVczWU9vPTwvQkE+DQogICAgICA8UyBOPSJUeXBlIj5TeXN0ZW0uTWFuYWdlbWVudC5BdXRvbWF0aW9uLlBTQ3JlZGVudGlhbDwvUz4NCiAgICA8L01TPg0KICA8L09iaj4NCjwvT2Jqcz4=]'
      RunLevel:            Highest


```

<br />

## Lookup Options in `Datum.yml`

```yaml
lookup_options:

  ScheduledTasks:
    merge_hash: deep
  ScheduledTasks\Tasks:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - TaskName

```

<br />

[AccessControlDsc]: https://github.com/mcollera/AccessControlDsc
[Chocolatey]: https://github.com/gaelcolas/Chocolatey
[ComputerManagementDsc]: https://github.com/dsccommunity/ComputerManagementDsc
[xPSDesiredStateConfiguration]: https://github.com/dsccommunity/xPSDesiredStateConfiguration

[AccessControlResourceHelper]: https://github.com/mcollera/AccessControlDsc
[ActiveDirectoryAccessEntry]: https://github.com/mcollera/AccessControlDsc
[ActiveDirectoryAuditRuleEntry]: https://github.com/mcollera/AccessControlDsc
[FileSystemAuditRuleEntry]: https://github.com/mcollera/AccessControlDsc
[NTFSAccessEntry]: https://github.com/mcollera/AccessControlDsc
[RegistryAccessEntry]: https://github.com/mcollera/AccessControlDsc

[ChocolateyFeature]: https://github.com/gaelcolas/Chocolatey
[ChocolateyPackage]: https://github.com/gaelcolas/Chocolatey
[ChocolateyPin]: https://github.com/gaelcolas/Chocolatey
[ChocolateySetting]: https://github.com/gaelcolas/Chocolatey
[ChocolateySoftware]: https://github.com/gaelcolas/Chocolatey
[ChocolateySource]: https://github.com/gaelcolas/Chocolatey

[Computer]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/Computer
[IEEnhancedSecurityConfiguration]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/IEEnhancedSecurityConfiguration
[OfflineDomainJoin]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/OfflineDomainJoin
[PendingReboot]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/PendingReboot
[PowerPlan]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/PowerPlan
[PowerShellExecutionPolicy]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/PowerShellExecutionPolicy
[RemoteDesktopAdmin]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/RemoteDesktopAdmin
[ScheduledTask]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/ScheduledTask
[SmbServerConfiguration]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/SmbServerConfiguration
[SmbShare]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/SmbShare
[SystemLocale]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/SystemLocale
[TimeZone]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/TimeZone
[UserAccountControl]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/UserAccountControl
[VirtualMemory]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/VirtualMemory
[WindowsCapability]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/WindowsCapability
[WindowsEventLog]: https://github.com/dsccommunity/ComputerManagementDsc/wiki/WindowsEventLog
[xWindowsFeature]: https://github.com/dsccommunity/xPSDesiredStateConfiguration
