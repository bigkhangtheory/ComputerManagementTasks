<#
    .DESCRIPTION
        PowerShell DSC Resource to set Windows product key.
#>
#Requires -Modules "DSCR_MSLicense"

configuration WindowsLicensing
{
    param
    (
        [Parameter()]
        [ValidatePattern('^([A-Za-z0-9]{5}-){4}[A-Za-z0-9]{5}$')]
        [System.String]
        $ProductKey,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean]
        $Activate = $false,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [System.Boolean]
        $Force = $false,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present'
    )

    Import-DscResource -ModuleName 'DSCR_MSLicense'
    
    # create DSC resource for 'WindowsLicense'
    if ($ProductKey)
    {
        # create execution name for DSC resource
        $executionName = "$($node.Name)_$($ProductKey -replace '[-().:\s]', '_')"

        # create DSC resource for Windows License
        cWindowsLicense "$executionName"
        {
            ProductKey = $ProductKey
            Activate   = $Activate
            Force      = $Force
            Ensure     = $Ensure
        }
    }
}