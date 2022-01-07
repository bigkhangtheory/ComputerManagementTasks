configuration MountImages
{
    param
    (
        [Parameter(Mandatory)]
        [System.Collections.Hashtable[]]
        $Images
    )

    <#
        Import required modules
    #>
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName StorageDsc


    <#
        Enumerate all images
    #>
    foreach ($i in $Images)
    {
        # Remove Case Sensitivity of ordered Dictionary or Hashtables
        $i = @{} + $i


        if (-not $i.ContainsKey('Ensure'))
        {
            $i.Ensure = 'Present'
        }

        if (-not $i.ContainsKey('Access'))
        {
            $i.Access = 'ReadOnly'
        }

        # create execution name for the resource
        $executionName = "Drive_$("$($i.DriveLetter)_$($i.ImageName)" -replace '[-().:|\s]', '_')"

        # create the resource
        $Splatting = @{
            ResourceName  = 'MountImage'
            ExecutionName = $executionName
            Properties    = $i
            NoInvoke      = $true
        }
        (Get-DscSplattedResource @Splatting).Invoke($i)

        if ( ($i.Ensure -eq 'Present') -and ($i.ContainsKey('DriveLetter')) )
        {
            # wait for volume: 30s
            WaitForVolume "WaitForDrive_$($i.DriveLetter)"
            {
                DriveLetter      = $i.DriveLetter
                RetryIntervalSec = 5
                RetryCount       = 6
                DependsOn        = "[MountImage]$executionName"
            }
        }
    }
}
