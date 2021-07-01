configuration NtfsAcls
{
    param (
        [Parameter(Mandatory)]
        [hashtable[]]
        $Paths
    )
   
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName AccessControlDsc 

    foreach ($path in $Paths)
    {
        $executionName = $path.Path.Split('\')
        $executionName = $executionName[$executionName.Count - 1]

        NtfsAccessEntry "ntfs_$executionName"
        {
            Path              = $path.Path
            AccessControlList = @(
                foreach ($acl in $path.AccessControlList)
                {
                    NTFSAccessControlList 
                    {
                        Principal          = $acl.Principal 
                        AccessControlEntry = @(
                            foreach ($entry in $acl.AccessControlEntry)
                            {
                                NTFSAccessControlEntry
                                {
                                    AccessControlType = $entry.AccessControlType 
                                    FileSystemRights  = $entry.FileSystemRights 
                                    Inheritance       = $entry.Inheritance
                                    Ensure            = $entry.Ensure  
                                }
                            }
                        )
                        ForcePrincipal     = $acl.ForcePrincipal 
                    }
                }
            )
            Force             = $path.Force 
        }
    }
}