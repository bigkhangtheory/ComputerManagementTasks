configuration HostsFileEntries
{
    param
    (
        [Parameter(Mandatory)]
        [System.Collections.Hashtable[]]
        $Entries
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName NetworkingDsc

    foreach ($e in $Entries)
    {
        # Remove Case Sensitivity of ordered Dictionary or Hashtables
        $e = @{} + $e

        # the property 'HostName' must be specified, otherise fail
        if ( -not $e.ContainsKey('HostName') )
        {
            throw 'ERROR: The property HostName is not found.'
        }

        # if not specified, ensure 'Present'
        if (-not $e.ContainsKey('Ensure'))
        {
            $e.Ensure = 'Present'
        }

        # if the resource is 'Present' than the property IPAddress must be specified
        if ( $e.Ensure -eq 'Present' )
        {
            if ( -not $e.ContainsKey('IPAddress') )
            {
                throw 'ERROR: The property IPAddress is not found.'
            }
        }

        # create execution name for the resource
        $executionName = "$("$($e.Ensure)_$($e.Hostname)" -replace '[-().:\s]', '_')"

        # create the resource
        $Splatting = @{
            ResourceName  = 'HostsFile'
            ExecutionName = $executionName
            Properties    = $e
            NoInvoke      = $true
        }
        (Get-DscSplattedResource @Splatting).Invoke($e)
    }
} #end configuration
