configuration LocalUsers
{
    param
    (
        [Parameter()]
        [System.Collections.Hashtable[]]
        $Users
    )

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName xPSDesiredStateConfiguration

    function AddMemberOf
    {
        param
        (
            [Parameter()]
            [System.String]
            $ExecutionName,

            [Parameter()]
            [System.String]
            $ExecutionType,

            [Parameter()]
            [System.String]
            $AccountName,

            [Parameter()]
            [System.String[]]
            $MemberOf
        )

        if ( $null -ne $MemberOf -and $MemberOf.Count -gt 0 )
        {
            Script "$($ExecutionName)_MemberOf"
            {
                TestScript =
                {
                    # get current member groups of the local user
                    $currentGroups = Get-LocalGroup | Where-Object { (Get-LocalGroupMember $_ -Member $using:AccountName -ErrorAction SilentlyContinue).Count -eq 1 } | Select-Object -ExpandProperty Name

                    Write-Host "Principal '$using:AccountName' is member of local groups: $($currentGroups -join ', ')"

                    $missingGroups = $using:MemberOf | Where-Object { -not ($currentGroups -contains $_) }

                    if ( $missingGroups.Count -eq 0 )
                    {
                        return $true
                    }

                    Write-Verbose "Principal '$using:AccountName' is not member of required local groups: $($missingGroups -join ', ')"
                    return $false
                }

                SetScript  =
                {
                    $missingGroups = $using:MemberOf | Where-Object { (Get-LocalGroupMember $_ -Member $using:AccountName -ErrorAction SilentlyContinue).Count -eq 0 }

                    Write-Verbose "Adding principal '$using:AccountName' to local groups: $($missingGroups -join ', ')"

                    foreach ( $group in $missingGroups )
                    {
                        Add-LocalGroupMember -Group $group -Member $using:AccountName -Verbose
                    }
                }

                GetScript  = { return @{ Result = 'N/A' } }

                DependsOn  = "[$ExecutionType]$ExecutionName"
            }
        }
    }

    <#
        Enumerate all loal users
    #>
    foreach ($u in $Users)
    {
        # remove case sensitivity of ordered Dictionary or Hashtables
        $u = @{ } + $u


        # save group list
        $memberOf = $u.MemberOf
        $u.Remove( 'MemberOf' )


        # the property 'UserName' must be specified, otherwise fail
        if ( -not $u.ContainsKey('UserName') )
        {
            throw "ERROR: The property 'UserName' is not found."
        }


        # if the property 'Disabled' is not defined, set default
        if ( -not $u.ContainsKey('Disabled') )
        {
            $u.Disabled = $false
        }


        # if the property 'PasswordChangeRequired' is not defined, set defaults
        if ( -not $u.ContainsKey('PasswordChangeRequired') )
        {
            $u.PasswordChangeRequired = $false
        }


        # if the property 'PasswordNeverExpires' is not defined, set defaults
        if ( -not $u.ContainsKey('PasswordNeverExpires') )
        {
            $u.PasswordNeverExpires = $true
        }

        # create execution name for the resoure
        $executionName = "$("$($node.Name)_$($u.UserName)" -replace '[-().:\s]', '_')"

        ## create the resource
        $Splatting = @{
            ResourceName  = 'xUser'
            ExecutionName = $executionName
            Properties    = $u
            NoInvoke      = $true
        }
        (Get-DscSplattedResource @Splatting).Invoke($u)


        <#
            Add local group members for the local user
        #>
        if ($null -ne $memberOf)
        {
            $Splatting = @{
                ExecutionName = $executionName
                ExecutionType = 'xUser'
                AccountName   = $u.UserName
                MemberOf      = $memberOf
            }
            AddMemberOf @Splatting
        }
    }
}
