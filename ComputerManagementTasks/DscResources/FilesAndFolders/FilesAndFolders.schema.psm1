<#
    .DESCRIPTION
        This DSC configuration provides a mechanism to manage files and folders on the target node.
#>
#Requires -Module FileSystemDsc

configuration FilesAndFolders
{
    param (
        [Parameter(Mandatory)]
        [System.Collections.Hashtable[]]
        $Items
    )

    <#
        Import required modules
    #>
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName FileSystemDsc


    foreach ($item in $Items)
    {
        $permissions = $null

        # Remove Case Sensitivity of ordered Dictionary or Hashtables
        $item = @{} + $item



        if (-not $item.ContainsKey('Ensure'))
        {
            $item.Ensure = 'Present'
        }

        if ( $item.ContainsKey('Permissions') )
        {
            $permissions = $item.Permissions
            $item.Remove('Permissions')
        }

        if ( $item.ContainsKey('ContentFromFile') )
        {
            if ( -not (Test-Path -Path $item.ContentFromFile) )
            {
                Write-Host "ERROR: Content file '$($item.ContentFromFile)' not found. Current working directory is: $(Get-Location)" -ForegroundColor Red
            }
            else
            {
                [string]$content = Get-Content -Path $item.ContentFromFile -Raw
                $item.Contents += $content
            }
            $item.Remove('ContentFromFile')
        }

        # if 'Encoding' or 'NewLine' is specified, store the values and remove from hashtable
        if ( $item.ContainsKey( 'Encoding' ))
        {
            [System.String]$encoding = $item.Encoding

            $item.Remove( 'Encoding' )
        }

        if ( $item.ContainsKey( 'NewLine' ))
        {
            [System.String]$newLine = $item.NewLine

            $item.Remove( 'NewLine' )
        }


        # format execution name for the resource
        $executionName = "$("$($item.Type)_$($item.DestinationPath)" -replace '[\s(){}/\\:-]', '_')"

        # create the File resource
        $Splatting = @{
            ResourceName  = 'File'
            ExecutionName = $executionName
            Properties    = $item
            NoInvoke      = $true
        }
        (Get-DscSplattedResource @Splatting).Invoke($item)


        # if 'Permissions' were specified, set the permissions
        if ( $null -ne $permissions )
        {
            foreach ($perm in $permissions)
            {
                # Remove Case Sensitivity of ordered Dictionary or Hashtables
                $perm = @{} + $perm

                $perm.Path = $item.DestinationPath
                $perm.DependsOn = "[File]$executionName"

                if (-not $perm.ContainsKey('Ensure'))
                {
                    $perm.Ensure = 'Present'
                }

                $permExecName = "$($executionName)__$($perm.Identity)" -replace '[\s(){}/\\:-]', '_'
                (Get-DscSplattedResource -ResourceName FileSystemAccessRule -ExecutionName $permExecName -Properties $perm -NoInvoke).Invoke($perm)
            }
        }


        # if the
    }
}