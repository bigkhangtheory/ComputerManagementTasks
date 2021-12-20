# NetAdapterName

## Parameters

| Parameter                          | Attribute  | DataType    | Description                                                                                          | Allowed Values                                                                                                |
| ---------------------------------- | ---------- | ----------- | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| **NewName**                        | *Required* | `[String]`  | Specifies the new name of the network adapter.                                                       |                                                                                                               |
| **Name**                           |            | `[String]`  | This is the name of the network adapter to find.                                                     |                                                                                                               |
| **PhysicalMediaType**              |            | `[String]`  | This is the media type of the network adapter to find.                                               |                                                                                                               |
| **Status**                         |            | `[String]`  | This is the status of the network adapter to find.                                                   | `Up`, `Disconnected`, `Disabled`                                                                              |
| **MacAddress**                     |            | `[String]`  | This is the MAC address of the network adapter to find.                                              |                                                                                                               |
| **InterfaceDescription**           |            | `[String]`  | This is the interface description of the network adapter to find.                                    |                                                                                                               |
| **InterfaceIndex**                 |            | `[UInt32]`  | This is the interface index of the network adapter to find.                                          |                                                                                                               |
| **InterfaceGuid**                  |            | `[String]`  | This is the interface GUID of the network adapter to find.                                           |                                                                                                               |
| **DriverDescription**              |            | `[String]`  | This is the driver description of the network adapter.                                               |                                                                                                               |
| **InterfaceNumber**                |            | `[UInt32]`  | This is the interface number of the network adapter if more than one are returned by the parameters. |                                                                                                               |
| **IgnoreMultipleMatchingAdapters** |            | `[Boolean]` |                                                                                                      | This switch will suppress an error occurring if more than one matching adapter matches the parameters passed. |  |

## Description

This resource is used to rename a network interface that matches the search parameters passed in.

## Examples

### Example 1

Rename three network adapters identified by MAC addresses to
Cluster, Management and SMB and then enable DHCP on them.

```powershell
Configuration NetAdapterName_RenameNetAdapterMacAddress_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterName RenameNetAdapterCluster
        {
            NewName    = 'Cluster'
            MacAddress = '9C-D2-1E-61-B5-DA'
        }

        NetIPInterface EnableDhcpClientCluster
        {
            InterfaceAlias = 'Cluster'
            AddressFamily  = 'IPv4'
            Dhcp           = 'Enabled'
        }

        NetAdapterName RenameNetAdapterManagement
        {
            NewName    = 'Management'
            MacAddress = '9C-D2-1E-61-B5-DB'
        }

        NetIPInterface EnableDhcpClientManagement
        {
            InterfaceAlias = 'Management'
            AddressFamily  = 'IPv4'
            Dhcp           = 'Enabled'
        }

        NetAdapterName RenameNetAdapterSMB
        {
            NewName    = 'SMB'
            MacAddress = '9C-D2-1E-61-B5-DC'
        }

        NetIPInterface EnableDhcpClientSMB
        {
            InterfaceAlias = 'SMB'
            AddressFamily  = 'IPv4'
            Dhcp           = 'Enabled'
        }
    }
}
```

### Example 2

Rename the first three network adapters with Driver Description matching
'Hyper-V Virtual Ethernet Adapter' in consequtive order to Cluster, Management
and SMB and then enable DHCP on them.

```powershell
Configuration NetAdapterName_RenameNetAdapterDriver_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterName RenameNetAdapterCluster
        {
            NewName           = 'Cluster'
            DriverDescription = 'Hyper-V Virtual Ethernet Adapter'
            InterfaceNumber   = 1
        }

        NetIPInterface EnableDhcpClientCluster
        {
            InterfaceAlias = 'Cluster'
            AddressFamily  = 'IPv4'
            Dhcp           = 'Enabled'
        }

        NetAdapterName RenameNetAdapterManagement
        {
            NewName           = 'Management'
            DriverDescription = 'Hyper-V Virtual Ethernet Adapter'
            InterfaceNumber   = 2
        }

        NetIPInterface EnableDhcpClientManagement
        {
            InterfaceAlias = 'Management'
            AddressFamily  = 'IPv4'
            Dhcp           = 'Enabled'
        }

        NetAdapterName RenameNetAdapterSMB
        {
            NewName           = 'SMB'
            DriverDescription = 'Hyper-V Virtual Ethernet Adapter'
            InterfaceNumber   = 3
        }

        NetIPInterface EnableDhcpClientSMB
        {
            InterfaceAlias = 'SMB'
            AddressFamily  = 'IPv4'
            Dhcp           = 'Enabled'
        }
    }
}
```

