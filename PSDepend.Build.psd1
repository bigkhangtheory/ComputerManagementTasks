@{

    PSDependOptions              = @{
        AddToPath      = $true
        Target         = 'BuildOutput\Modules'
        DependencyType = 'PSGalleryModule'
        Parameters     = @{
            Repository = 'PSGallery'
        }
    }

    # -------------------------------------------------------------------------
    # PowerShell Modules
    # -------------------------------------------------------------------------

    BuildHelpers                 = 'latest'
    # Helper functions for PowerShell CI/CD scenarios

    Datum                        = 'latest'
    # Module to manage Hierachical Configuration Data

    'Datum.InvokeCommand'        = 'latest'
    # Datum Handler module to encrypt and decrypt secrets in Datum using Dave Wyatt's ProtectedData module

    'Datum.ProtectedData'        = 'latest'
    # Datum Handler module to encrypt and decrypt secrets in Datum using Dave Wyatt's ProtectedData module

    DscBuildHelpers              = 'latest'
    # Build Helpers for DSC Resources and Configurations

    InvokeBuild                  = 'latest'
    # Build and test automation in PowerShell

    Pester                       = '4.10.1'
    # Pester provides a framework for running BDD style Tests to execute and validate PowerShell commands inside of PowerShell.
    # It offers a powerful set of Mocking Functions that allow tests to mimic and mock the functionality of any command inside of a piece of PowerShell code being tested.
    # Pester tests can execute any command or script that is accessible to a pester test file. This can include functions, Cmdlets, Modules and scripts.
    # Pester can be run in ad hoc style in a console or it can be integrated into the Build scripts of a Continuous Integration system.

    'posh-git'                   = 'latest'
    # Provides prompt with Git status summary information and tab completion for Git commands, parameters, remotes and branch names.

    'powershell-yaml'            = 'latest'
    # Powershell module for serializing and deserializing YAML

    ProtectedData                = 'latest'
    # Encrypt and share secret data between different users and computers.

    PSScriptAnalyzer             = 'latest'
    # Provides script analysis and checks for potential code defects in the scripts by applying a group of built-in or customized rules on the scripts being analyzed.

    PSDeploy                     = 'latest'
    # Module to simplify PowerShell based deployments

    # -------------------------------------------------------------------------
    # DSC Resources
    # ------------------------------------------------------------------------

    AccessControlDsc             = '1.4.1'
    # Module with DSC resource to manage Registry and NTFS access entries and manage Active Directory SACL

    CertificateDsc               = '5.1.0'
    # DSC resources for managing certificates on a Windows Server.

    Chocolatey                   = '0.0.79'

    ComputerManagementDsc        = '8.4.0'
    # DSC resources for configuration of a Windows computer.

    DSCR_Shortcut                = '2.2.0'
    # PowerShell DSC Resource to create shortcut file (LNK file).

    DSCR_MSLicense               = '0.9.1'
    # PowerShell DSC Resource to set Windows / Office product key.

    DSCR_PowerPlan               = '1.3.0'
    # PowerShell DSC Resource for Power Plan configuration

    FileSystemDsc                = '1.1.1'
    # This module contains DSC resources for managing file systems.

    GPRegistryPolicyDsc          = '1.2.0'
    # This resource module contains DSC resources used to apply and manage local group policies by modifying the respective .pol file.

    NetworkingDsc                = '8.2.0'

    PackageManagement            = '1.4.7'
    #

    PowerShellGet                = '2.2.5'
    # PowerShell module with commands for discovering, installing, updating and publishing the PowerShell artifacts like Modules, Scripts, and DSC Resources.

    SChannelDsc                  = '1.2.2'
    # The SChannelDsc PowerShell module provides DSC resources that can be used to manage SChannel settings.

    StorageDsc                   = '5.0.1'

    WSManDsc                     = '3.1.1'
    # DSC resources for configuring WS-Man.

    xBitlocker                   = '1.4.0.0'
    XmlContentDsc                = '0.0.1'
    xPSDesiredStateConfiguration = '9.1.0'
    xWindowsEventForwarding      = '1.0.0.0'
}
