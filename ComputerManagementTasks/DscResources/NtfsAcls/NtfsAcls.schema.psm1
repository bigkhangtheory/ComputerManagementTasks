configuration NtfsAcls
{
    param (
        [Parameter(Mandatory)]
        [hashtable[]]
        $Paths
    )
   
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName AccessControlDsc 

    foreach ($p in $Paths)
    {
        # remove case sensitivity of ordered Dictionary or Hashtables
        $p = @{ } + $p

        # formulate execution name from Path
        $executionName = "$($p.Path -replace '[-().:\s]', '_')"

        # ensure the the path type is either 'Directory' or 'File'
        if (-not (($p.Type -eq 'Directory') -or ($p.Type -eq 'File')))
        {
            throw "Error: The Path must be specified as either a 'Directory' of 'File'."
        }

        # ensure that the specified path exists
        File "$executionName"
        {
            DestinationPath = $p.Path
            Type            = $p.Type
            Ensure          = 'Present'
        }
        $dependsOnFile = "[File]$executionName"

        # create NTFS access control resource
        NtfsAccessEntry "ntfs_$executionName"
        {
            Path              = $p.Path
            Force             = $p.Force
            DependsOn         = $dependsOnFile
            AccessControlList = @(
                foreach ($a in $p.AccessControlList)
                {
                    NTFSAccessControlList 
                    {
                        Principal          = $a.Principal
                        ForcePrincipal     = $a.ForcePrincipal 
                        AccessControlEntry = @(
                            foreach ($e in $a.AccessControlEntry)
                            {
                                NTFSAccessControlEntry
                                {
                                    AccessControlType = $e.AccessControlType 
                                    FileSystemRights  = $e.FileSystemRights 
                                    Inheritance       = $e.Inheritance
                                    Ensure            = $e.Ensure  
                                }
                            }
                        )
                    }
                }
            )

        }
    }
}