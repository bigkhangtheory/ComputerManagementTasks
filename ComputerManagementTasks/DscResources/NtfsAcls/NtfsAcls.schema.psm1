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
        $executionName = "$($p.Path -replace '[-().:\s\\]', '_')"

        # create NTFS access control resource
        NtfsAccessEntry "$executionName"
        {
            Path              = $p.Path
            Force             = $p.Force
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