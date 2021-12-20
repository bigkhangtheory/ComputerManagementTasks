# NetAdapterAdvancedProperty

## Parameters

| Parameter              | Attribute  | DataType   | Description                                                                 | Allowed Values |
| ---------------------- | ---------- | ---------- | --------------------------------------------------------------------------- | -------------- |
| **NetworkAdapterName** | *Required* | `[String]` | Specifies the name of the network adapter to set the advanced property for. |                |
| **RegistryKeyword**    | *Required* | `[String]` | Specifies the registry keyword that should be in desired state.             |                |
| **RegistryValue**      | Required   | `[String]` | Specifies the value of the registry keyword.                                |                |
| **DisplayValue**       | Read       | `[String]` | Output Display value of selected RegistryKeyword.                           |                |

## Description

This resource is used to set advanced properties on a network adapter
by setting the value of a registry keyword.
The list of available registry keywords will be dependent on the network
adapter driver.
**Please check the supported registry keywords for your adapter before
creating a configuration.**

The following is a list of common registry keywords that may apply to
your network adapter:

- AdaptiveIFS
- ITR
- LogLinkStateEvent
- MasterSlave
- NetworkAddress
- MaxRxRing1Length
- NumRxBuffersSmall
- RxIntModeration
- RxIntModerationProfile
- TxIntModerationProfile
- VlanID
- WaitAutoNegComplete
- *DcbxMode
- *EncapsulatedPacketTaskOffload
- *FlowControl
- *InterruptModeration
- *IPChecksumOffloadIPv4
- *JumboPacket
- *LsoV2IPv4
- *LsoV2IPv6
- *MaxRssProcessors
- *NetworkDirect
- *NumaNodeId
- *NumRssQueues
- *PacketDirect
- *PriorityVLANTag
- *QOS
- *ReceiveBuffers
- *RecvCompletionMethod
- *RoceMaxFrameSize
- *RscIPv4
- *RSS
- *RssBaseProcNumber
- *RssMaxProcNumber
- *RssOnHostVPorts
- *RSSProfile
- *SpeedDuplex
- *Sriov
- *TCPChecksumOffloadIPv4
- *TCPChecksumOffloadIPv6
- *TCPUDPChecksumOffloadIPv4
- *TCPUDPChecksumOffloadIPv6
- *TransmitBuffers
- *UDPChecksumOffloadIPv4
- *UDPChecksumOffloadIPv6
- *VMQ
- *VMQVlanFiltering

The following table shows configuration overlap with [NetAdapterLso](https://github.com/dsccommunity/NetworkingDsc/wiki/NetAdapterLso).

| NetAdapterLso |     | NetAdapterAdvancedProperty |
| ------------- | --- | -------------------------- |
| V1IPv4        | =   | Not Available              |
| IPv4          | =   | *LsoV2IPv4                 |
| IPv6          | =   | *LsoV2IPv6                 |

## Examples

### Example 1

This configuration changes the JumboPacket Size.

```powershell
Configuration NetAdapterAdvancedProperty_JumboPacket_Config
{
    Import-DSCResource -ModuleName NetworkingDsc

    Node localhost
    {
        NetAdapterAdvancedProperty JumboPacket9014
        {
            NetworkAdapterName  = 'Ethernet'
            RegistryKeyword     = "*JumboPacket"
            RegistryValue       = 9014
        }
    }
}
```

