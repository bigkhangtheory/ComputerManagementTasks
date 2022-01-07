# ChocolateyPackageManager

The **ChocolateyPackageManager** configuration is used to management *Chocolatey* installations and application packages on target nodes.

<br />

## Project Information

|                  |                                                                                                                                     |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/ChocolateyPackageManager |
| **Dependencies** | [Chocolatey][Chocolatey], [ComputerManagementDsc][ComputerManagementDsc]                                                            |


## Parameters

<br />

### Attributes of *ChocolateyPackageManager*

| Parameter             | Attribute | DataType        | Description                                                   |
| --------------------- | --------- | --------------- | ------------------------------------------------------------- |
| **ForceRebootBefore** |           | `[Boolean]`     | Force reboot before installation of first Chocolatey package. |
| **Software**          |           | `[Hashtable]`   | Chocolatey software installation                              |
| **Sources**           |           | `[Hashtable[]]` | List of Chocolatey sources                                    |
| **Features**          |           | `[Hashtable[]]` | List of Chocolatey features                                   |
| **Packages**          |           | `[Hashtable[]]` | List of Chocolatey packages                                   |

---

#### Attributes of `Software`

| Parameter                 | Attribute  | DataType   | Description                                                                                                                     | Allowed Values                  |
| ------------------------- | ---------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| **Ensure**                | *Required* | `[String]` | Specifies whether the Chocolatey Software should be installed on the machine or not.                                            | `Present` *(Default)*, `Absent` |
| **PackageFeedUrl**        |            | `[String]` | Url of a Nuget feed where the Chocolatey software package is available. For example, `https://community.chocolatey.org/api/v2/` |                                 |
| **Version**               |            | `[String]` | Specific version of package available on the nuget Package Feed Url provided.                                                   |                                 |
| **ChocoTempDir**          |            | `[String]` | Chocolatey Temp directory to unzip downloaded package during bootstrap.                                                         |                                 |
| **InstallationDirectory** |            | `[String]` | Path where Chocolatey should be installed. Defaults to `C:\ProgramData\chocolatey`                                              |                                 |

---

#### Attributes of `Sources`

| Parameter    | Attribute  | DataType    | Description                                                                                                                                                   | Allowed Values                  |
| ------------ | ---------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| **Name**     | *Required* | `[String]`  | Folder path where the Chocolatey Software should be installed.                                                                                                |                                 |
| **Source**   |            | `[String]`  | URL of the Nuget source respository                                                                                                                           |                                 |
| **Priority** |            | `[UInt16]`  | The priority order of this source as compared to other sources. All priorities greater than `0` will be evaluated first. A priority `1` gets evaluated first. |                                 |
| **Disabled** |            | `[Boolean]` | Specifies whether the Chocolatey source entry is enabled for package queries                                                                                  |                                 |
| **Ensure**   |            | `[String]`  | Specifies whether the defined Chocolatey source entry should be configured or removed                                                                         | `Present` *(Default)*, `Absent` |

---

#### Attributes of `Features`

| Parameter  | Attribute  | DataType   | Description                                                             | Allowed Values                                                  |
| ---------- | ---------- | ---------- | ----------------------------------------------------------------------- | --------------------------------------------------------------- |
| **Name**   | *Required* | `[String]` | Specifes the name of the Chocolatey Feature to configure                | See [Chocolatey Features Table](#####chocolatey-features-table) |
| **Ensure** |            | `[String]` | Specifies whether the Chocolatey Feature should be enabled or disabled. | `Present` *(Default)*, `Absent`                                 |

---

##### Chocolatey Features Table

| Name                                       | Description                                                                                                                                                                                                         |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **checksumFiles**                          | Checksum files when pulled in from internet (based on package).                                                                                                                                                     |
| **autoUninstaller**                        | Uninstall from programs and features without requiring an explicit uninstall script.                                                                                                                                |
| **allowGlobalConfirmation**                | Prompt for confirmation in scripts or bypass.                                                                                                                                                                       |
| **failOnAutoUninstaller**                  | Fail if automatic uninstaller fails.                                                                                                                                                                                |
| **failOnStandardError**                    | Fail if install provider writes to stderr. Not recommended for use. Available in 0.9.10+.                                                                                                                           |
| **allowEmptyChecksums**                    | Allow packages to have empty/missing checksums for downloaded resources from non secure locations (HTTP, FTP). Enabling is not recommended if using sources that download resources from the internet.              |
| **allowEmptyChecksumsSecure**              | Allow packages to have empty/missing checksums for downloaded resources from secure locations (HTTPS).                                                                                                              |
| **powershellHost**                         | Use Chocolatey's built in PowerShell host.                                                                                                                                                                          |
| **logEnvironmentValues**                   | Log Environment Values will log values of environment before and after install (could disclose sensitive data).                                                                                                     |
| **virusCheck**                             | Virus Check perform virus checking on downloaded files. Available in 0.9.10+. Licensed versions only.                                                                                                               |
| **failOnInvalidOrMissingLicense**          | Fail On Invalid Or Missing License allows knowing when a license is expired or not applied to a machine.                                                                                                            |
| **ignoreInvalidOptionsSwitches**           | Ignore Invalid Options/Switches If a switch or option is passed that is not recognized, should choco fail?                                                                                                          |
| **usePackageExitCodes**                    | Use Package Exit Codes Package scripts can provide exit codes. With this on, package exit codes will be what choco uses for exit when non                                                                           |
| **useEnhancedExitCodes**                   | Use Enhanced Exit Codes Chocolatey is able to provide enhanced exit codes surrounding list, search, info, outdated and other commands that don't deal directly with package operations.                             |
| **exitOnRebootDetected**                   | Exit On Reboot Detected Stop running install, upgrade, or uninstall when a reboot request is detected.                                                                                                              |
| **useFipsCompliantChecksums**              | Use FIPS Compliant Checksums Ensure checksumming done by choco uses FIPS compliant algorithms. Not recommended unless required by FIPS Mode.                                                                        |
| **showNonElevatedWarnings**                | Show Non Elevated Warnings                                                                                                                                                                                          |
| **showDownloadProgress**                   | Show Download Progress Show download progress percentages in the CLI.                                                                                                                                               |
| **stopOnFirstPackageFailure**              | Stop On First Package Failure Stop running install, upgrade or uninstall on first package failure instead of continuing with others. As this will affect upgrade all, it is normally recommended to leave this off. |
| **useRememberedArgumentsForUpgrades**      | Use Remembered Arguments For Upgrades When running upgrades, use arguments for upgrade that were used for installation ('remembered'). This is helpful when running upgrade for all packages.                       |
| **ignoreUnfoundPackagesOnUpgradeOutdated** | Ignore Unfound Packages On Upgrade Outdated When checking outdated or upgrades, if a package is not found against sources specified, don't report the package at all.                                               |
| **skipPackageUpgradesWhenNotInstalled**    | Skip Packages Not Installed During Upgrade if a package is not installed, do not install it during the upgrade process.                                                                                             |
| **removePackageInformationOnUninstall**    | Remove Stored Package Information On Uninstall When a package is uninstalled, should the stored package information also be removed?                                                                                |
| **logWithoutColor**                        | Log without color Do not show colorization in logging output.                                                                                                                                                       |
| **logValidationResultsOnWarnings**         | Log validation results on warnings Should the validation results be logged if there are warnings?                                                                                                                   |
| **usePackageRepositoryOptimizations**      | Use Package Repository Optimizations Turn on optimizations for reducing bandwidth with repository queries during package install/upgrade/outdated operations.                                                       |

---

#### Attributes of `Packages`

| Parameter             | Attribute  | DataType                    | Description                                                                                                                            | Allowed Values                                                              |
| --------------------- | ---------- | --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| **Name**              | *Required* | `[String]`                  |                                                                                                                                        |                                                                             |
| **Version**           |            | `[String]`                  | Chocolatey Package Version. Specify either a specific version or use `latest` to install/upgrade to the latest version of the package. |                                                                             |
| **Rank**              |            | `[UInt16]`                  | Rank to control the installation order of packages. A package with a lower rank is installed before a package with a higher rank.      |                                                                             |
| **ChocolateyOptions** |            | `[String[]]` *(KeyValPair)* | All option values shall be provided as strings, so enclose numerical values in quotes                                                  | See [Chocolatey Installation Options](#####chocolatey-installation-options) |
| **UpdateOnly**        |            | `[Boolean]`                 | Only updates installed package and ignores packages not Installed.                                                                     |                                                                             |
| **ForceReboot**       |            | `[Boolean]`                 | Force a reboot after first installation of the package.                                                                                |                                                                             |

---

##### Chocolatey Installation Options

| Parameter                   | Attribute | DataType    | Description                                                                                                                     | Allowed Values |
| --------------------------- | --------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| **Source**                  |           | `[String]`  | The source to find the package to install. Special sources include: `ruby`, `webpi`, `cygwin`, `windowsfeatures`, and `python`. |                |
| **PackageParameters**       |           | `[String]`  | Parameters to pass to the package.                                                                                              |                |
| **InstallArguments**        |           | `[String]`  | Install Arguments to pass to the native installer in the package.                                                               |                |
| **IgnoreChecksums**         |           | `[Boolean]` | Specify whether to ignore checksums during package download.                                                                    |                |
| **Force**                   |           | `[Boolean]` | Force the re-installation of the package.                                                                                       |                |
| **CommandExecutionTimeout** |           | `[String]`  | The time to allow a command to finish before timing out. Overrides the default execution timeout of 2700 seconds.               |                |
| **CacheLocation**           |           | `[String]`  | Specify a file system location for package download cache. Defaults to `$env:TEMP`.                                             |                |
| **AllowDowngrade**          |           | `[Boolean]` | Specify whether an attempt to downgrade a package installation is allowed.                                                      |                |
| **AllowMultipleVersions**   |           | `[Boolean]` | Specify whether multiple versions of a package can be installed.                                                                |                |
| **IgnoreDependencies**      |           | `[Boolean]` | Specify whether package dependencies are ignored during installation.                                                           |                |
| **ForceDependencies**       |           | `[Boolean]` | Specify whether dependencies should be reinstalled during forced package re-installations.                                      |                |
| **ExitOnRebootDetected**    |           | `[Boolean]` | Stop running install, upgrade, or uninstall when a reboot request is detected.                                                  |                |
| **IgnoreDetectedReboot**    |           | `[Boolean]` | Ignore any detected reboots if found.                                                                                           |                |

---

<br />

#####  Example *ChocolateyPackageManager*

```yaml
ChocolateyPackageManager:
  Software:
    Ensure: Present
    PackageFeedUrl: https://community.chocolatey.org/api/v2/
    Version: 0.10.15
    ChocoTempDir: C:\ProgramData\chocolatey\temp
    InstallationDirectory: C:\ProgramData\chocolatey

  Sources:
    - Name: Chocolatey
      Ensure: Present
      Source: https://community.chocolatey.org/api/v2/
      Priority: 0
      Disabled: False
    - Name: PrivateChocolatey
      Ensure: Absent

  Features:
    - Name: checksumFiles
      Ensure: Present
    - Name: allowEmptyChecksums
      Ensure: Absent
    - Name: ignoreInvalidOptionsSwitches

  Packages:
    - Name: notepadplusplus
      Ensure: Present
      Version: '1.0'
      ChocolateyOptions:
        PackageParameters: /FirstParam:Value1 /SecondParam:Value2
      Credential: '[ENC=PE9ianM...=]'

    - Name: winrar
      Version: Latest
      Rank: 100   # winrar is installed before notepadplusplus (with the default rank)
      ForceReboot: true

    - Name: very_large_package
      Ensure: Present
      Version: '1.0'
      ChocolateyOptions:
        CommandExecutionTimeout: '3600'
```

##### Lookup Options in **Datum.yml**

```yaml
lookup_options:

  ChocolateyPackageManager:
    merge_hash: deep
  ChocolateyPackageManager\Software:
    merge_hash: deep
  ChocolateyPackageManager\Features:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - Name
  ChocolateyPackageManager\Sources:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - Name
  ChocolateyPackageManager\Packages:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - Name
```

[Chocolatey]: https://github.com/chocolatey-community/Chocolatey/
[ComputerManagementDsc]: https://github.com/dsccommunity/ComputerManagementDsc
[ChocolateyFeature]: https://github.com/chocolatey-community/Chocolatey/tree/main/source/DscResources/ChocolateyFeature
[ChocolateyPackage]: https://github.com/chocolatey-community/Chocolatey/tree/main/source/DscResources/ChocolateyPackage
[ChocolateyPin]: https://github.com/gaelcolas/Chocolatey
[ChocolateySetting]: https://github.com/gaelcolas/Chocolatey
[ChocolateySoftware]: https://github.com/chocolatey-community/Chocolatey/tree/main/source/DscResources/ChocolateySoftware
[ChocolateySource]: https://github.com/chocolatey-community/Chocolatey/tree/main/source/DscResources/ChocolateySource