configuration RegistryAcls {
    param (
        [Parameter()]
        [hashtable[]]
        $Paths
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName AccessControlDsc


    foreach ($path in $Paths)
    {
        $executionName = $path.Path.Split('\')
        $executionName = $executionName[$executionName.Count - 1]

        RegistryAccessEntry "registry_$executionName"
        {
            Path              = $path.Path
            Force             = $path.Force 
            AccessControlList = @(
                foreach ($acl in $path.AccessControlList)
                {
                    AccessControlList
                    {
                        Principal          = $acl.Principal
                        ForcePrincipal     = $acl.ForcePrincipal
                        AccessControlEntry = @(
                            foreach ($entry in $acl.AccessControlEntry)
                            {
                                AccessControlEntry
                                {
                                    AccessControlType = $entry.AccessControlType 
                                    Rights            = $entry.Rights 
                                    Inheritance       = $entry.Inheritance 
                                    Ensure            = $entry.Ensure 
                                }
                            }
                        )
                    }
                }
            )
        }
    }
}