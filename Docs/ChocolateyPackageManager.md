# Overview

The **ChocolateyPackageManager** configuration is used to management *Chocolatey* installations and application packages on target nodes.

|                   |                                                                                                                                                         |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Source**        | https://prod1gitlab.mapcom.local/dsc/configurations/ComputerManagementTasks/-/tree/master/ComputerManagementTasks/DscResources/ChocolateyPackageManager |
|                   |
| **DSC Resources** | [Chocolatey][Chocolatey], [ComputerManagementDsc][ComputerManagementDsc]                                                                                |

<br />

### Attributes of *ChocolateyPackageManager*

| **Parameter**                                                      | **Attribute** | **DataType**  | **Description**                                               |
| ------------------------------------------------------------------ | ------------- | ------------- | ------------------------------------------------------------- |
| [`Software`](#####attributes-of-chocolateypackagemanager/software) |               | `Hashtable`   | Chocolatey software installation                              |
| `Sources`                                                          |               | `Hashtable[]` | List of Chocolatey sources                                    |
| `Features`                                                         |               | `Hashtable[]` | List of Chocolatey features                                   |
| `ForceRebootBefore`                                                |               | `Boolean`     | Force reboot before installation of first Chocolatey package. |
| `Packages`                                                         |               | `Hashtable[]` | List of Chocolatey packages                                   |

<br />

### Attributes of *ChocolateyPackageManager/Software*


| **Parameter**           | **Attribute** | **DataType** | **Description**                                                                                                               | **Allowed Values**                                          |
| ----------------------- | ------------- | ------------ | ----------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| `Ensure`                | Key           | `String`     | Specifies whether the Chocolatey Software should be installed on the machine or not.                                          | <ul><li>`Present` <i>Default</i></li><li>`Absent`</li></ul> |
| `PackageFeedUrl`        | Write         | `String`     | Url of a Nuget feed where the Chocolatey software package is available. For example, https://community.chocolatey.org/api/v2/ |                                                             |
| `Version`               | Write         | `String`     | Specific version of package available on the nuget Package Feed Url provided.                                                 |                                                             |
| `ChocoTempDir`          | Write         | `String`     | Chocolatey Temp directory to unzip downloaded package during bootstrap.                                                       |                                                             |
| `InstallationDirectory` | Write         | `String`     | Path where Chocolatey should be installed. Defaults to `C:\ProgramData\chocolatey`                                            |                                                             |

<br />

### Attributes of *ChocolateyPackageManager/Sources*


| **Parameter** | **Attribute** | **DataType** | **Description**                                                                                                                                               | **Allowed Values**                                          |
| ------------- | ------------- | ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| `Name`        | Key           | `String`     | Folder path where the Chocolatey Software should be installed.                                                                                                |                                                             |
| `Source`      | Write         | `String`     | URL of the Nuget source respository                                                                                                                           |                                                             |
| `Priority`    | Write         | `SInt16`     | The priority order of this source as compared to other sources. All priorities greater than `0` will be evaluated first. A priority `1` gets evaluated first. |                                                             |
| `Disabled`    | Write         | `Boolean`    | Specifies whether the Chocolatey source entry is enabled for package queries                                                                                  |                                                             |
| `Ensure`      | Write         | `String`     | Specifies whether the defined Chocolatey source entry should be configured or removed                                                                         | <ul><li>`Present` <i>Default</i></li><li>`Absent`</li></ul> |

<br />

### Attributes of *ChocolateyPackageManager/Features*


| **Parameter** | **Attribute** | **DataType** | **Description**                                                         | **Allowed Values**                                                   |
| ------------- | ------------- | ------------ | ----------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `Name`        | Key           | `String`     | Specifes the name of the Chocolatey Feature to configure                | [See Chocolatey features table below](####chocolatey-features-table) |
| `Ensure`      | Key           | `String`     | Specifies whether the Chocolatey Feature should be enabled or disabled. | <ul><li>`Present` <i>Default</i></li><li>`Absent`</li></ul>          |

#### Chocolatey Features Table

| **Name**                            | **Description**                                                                                                                                                 |
| ----------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `checksumFiles`                     | Checksum files when pulled in from internet (based on package).                                                                                                 |
| `autoUninstaller`                   | Uninstall from programs and features without requiring an explicit uninstall script.                                                                            |
| `allowGlobalConfirmation`           | Prompt for confirmation in scripts or bypass.                                                                                                                   |
| `ignoreInvalidOptionsSwitches`      | Ignore Invalid Options/Switches during package installation                                                                                                     |
| `usePackageExitCodes`               | Use Package Exit Codes - Package scripts can provide exit codes.                                                                                                |
| `useEnhancedExitCodes`              | Chocolatey is able to provide enhanced exit codes surrounding list, search, info, outdated and other commands that don't deal directly with package operations. |
| `exitOnRebootDetected`              | Exit On Reboot Detected - Stop running install, upgrade, or uninstall when a reboot request is detected.                                                        |
| `useRememberedArgumentsForUpgrades` | Use Remembered Arguments For Upgrades - When running upgrades, use arguments for upgrade that were used for installation ('remembered').                        |

<br />

### Attributes of *ChocolateyPackageManager/Packages*


| **Parameter** | **Attribute** | **DataType** | **Description** | **Allowed Values** |
| ------------- | ------------- | ------------ | --------------- | ------------------ |

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
        ChocolateyOptions:
        TimeOut: '3600'  # 1h install timeout
```

##### Lookup Options in `Datum.yml`

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