configuration SmbFileShares
{
    param
    (
        [Parameter()]
        [ValidateSet('Server', 'Client')]
        [System.String]
        $HostOS = 'Server',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Collections.Hashtable]
        $ServerConfiguration,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [Sysstem.Collections.Hashtable[]]
        $Shares
    )

    Import-DscResource -ModuleName xPSDesiredStateConfiguration
    Import-DscResource -ModuleName ComputerManagementDsc

    if( $HostOS -eq 'Server' )
    {
        xWindowsFeature featureFileServer
        {
            Name   = 'FS-FileServer'
            Ensure = 'Present'
        }

        $featureFileServer = '[xWindowsFeature]featureFileServer'
    }

    if( $null -ne $ServerConfiguration )
    {
        if( $HostOS -eq 'Server' )
        {
            if( $ServerConfiguration.EnableSMB1Protocol -eq $false )
            {
                xWindowsFeature removeSMB1
                {
                    Name      = 'FS-SMB1'
                    Ensure    = 'Absent'
                    DependsOn = $featureFileServer
                }
            }

            $ServerConfiguration.DependsOn = $featureFileServer
        }

        $ServerConfiguration.IsSingleInstance = 'Yes'

        (Get-DscSplattedResource -ResourceName SmbServerConfiguration -ExecutionName "smbServerConfig" -Properties $ServerConfiguration -NoInvoke).Invoke($ServerConfiguration)
    }

    if( $null -ne $Shares )
    {
        foreach( $share in $Shares )
        {
            # Remove Case Sensitivity of ordered Dictionary or Hashtables
            $share = @{}+$share

            $shareId = $share.Name -replace '[:$\s]', '_'

            $share.DependsOn = $featureFileServer

            if( -not $share.ContainsKey('Ensure') )
            {
                $share.Ensure = 'Present'
            }

            if( $share.Ensure -eq 'Present' )
            {
                if( [string]::IsNullOrWhiteSpace($share.Path) )
                {
                    throw "ERROR: Missing path of the SMB share '$($share.Name)'."
                }

                # skip root paths
                $dirInfo = New-Object -TypeName System.IO.DirectoryInfo -ArgumentList $share.Path

                if( $null -ne $dirInfo.Parent )
                {
                    xFile "Folder_$shareId"
                    {
                        DestinationPath = $share.Path
                        Type            = 'Directory'
                        Ensure          = 'Present'
                        DependsOn       = $featureFileServer
                    }

                    $share.DependsOn = "[xFile]Folder_$shareId"
                }
            }
            elseif ( [string]::IsNullOrWhiteSpace($share.Path) )
            {
                $share.Path = 'Unused'
            }

            (Get-DscSplattedResource -ResourceName SmbShare -ExecutionName "SmbShare_$shareId" -Properties $share -NoInvoke).Invoke($share)
        }
    }
} #end configuration