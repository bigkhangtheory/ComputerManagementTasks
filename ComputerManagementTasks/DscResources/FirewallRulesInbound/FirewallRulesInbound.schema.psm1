<#
    .DESCRIPTION
        This resource is used to control firewall rules for a nodPredefinedGrPredefinedGrPredefinedGrPredefinedGrPredefinedGrPredefinedGrPredefinedGrPredefinedGroups                s
        [System.Collections.Hashtable[]]
        Specifies a list of Firewall rule resources

    .PARAMETER Name
        Key - String
        Name of the Firewall Rule.

    .PARAMETER DisplayName
        Write - String
        Localized, user-facing name of the Firewall Rule being created.

    .PARAMETER Group
        Write - String
        Name of the Firewall Group where we want to put the Firewall Rule.

    .PARAMETER Ensure
        Write - String
        Allowed values: Present, Absent
        Ensure the presence/absence of the resource.

    .PARAMETER Enabled
        Write - String
        Allowed values: True, False
        Enable or disable the supplied configuration.

    .PARAMETER Action
        Write - String
        Allowed values: NotConfigured, Allow, Block
        Allow or Block the supplied configuration.

    .PARAMETER Profile
        Write - StringArray
        Specifies one or more profiles to which the rule is assigned.

    .PARAMETER Direction
        Write - String
        Allowed values: Inbound, Outbound
        Direction of the connection.

    .PARAMETER RemotePort
        Write - StringArray
        Specific Port used for filter. Specified by port number, range, or keyword

    .PARAMETER LocalPort
        Write - StringArray
        Local Port used for the filter.

    .PARAMETER Protocol
        Write - String
        Specific Protocol for filter. Specified by name, number, or range.

    .PARAMETER Description
        Write - String
        Documentation for the Rule.

    .PARAMETER Program
        Write - String
        Path and file name of the program for which the rule is applied.

    .PARAMETER Service
        Write - String
        Specifies the short name of a Windows service to which the firewall rule applies.

    .PARAMETER Authentication
        Write - String
        Allowed values: NotRequired, Required, NoEncap
        Specifies that authentication is required on firewall rules.

    .PARAMETER Encryption
        Write - String
        Allowed values: NotRequired, Required, Dynamic
        Specifies that encryption in authentication is required on firewall rules.

    .PARAMETER InterfaceAlias
        Write - StringArray
        Specifies the alias of the interface that applies to the traffic.

    .PARAMETER InterfaceType
        Write - String
        Allowed values: Any, Wired, Wireless, RemoteAccess
        Specifies that only network connections made through the indicated interface types are subject to the requirements of this rule.

    .PARAMETER LocalAddress
        Write - StringArray
        Specifies that network packets with matching IP addresses match this rule.

    .PARAMETER LocalUser
        Write - String
        Specifies the principals to which network traffic this firewall rule applies.

    .PARAMETER Package
        Write - String
        Specifies the Windows Store application to which the firewall rule applies.

    .PARAMETER Platform
        Write - StringArray
        Specifies which version of Windows the associated rule applies.

    .PARAMETER RemoteAddress
        Write - StringArray
        Specifies that network packets with matching IP addresses match this rule.

    .PARAMETER RemoteMachine
        Write - String
        Specifies that matching IPsec rules of the indicated computer accounts are created.

    .PARAMETER RemoteUser
        Write - String
        Specifies that matching IPsec rules of the indicated user accounts are created.

    .PARAMETER DynamicTransport
        Write - String
        Allowed values: Any, ProximityApps, ProximitySharing, WifiDirectPrinting, WifiDirectDisplay, WifiDirectDevices
        Specifies a dynamic transport.

    .PARAMETER EdgeTraversalPolicy
        Write - String
        Allowed values: Block, Allow, DeferToUser, DeferToApp
        Specifies that matching firewall rules of the indicated edge traversal policy are created.

    .PARAMETER IcmpType
        Write - StringArray
        Specifies the ICMP type codes.

    .PARAMETER LocalOnlyMapping
        Write - Boolean
        Indicates that matching firewall rules of the indicated value are created.

    .PARAMETER LooseSourceMapping
        Write - Boolean
        Indicates that matching firewall rules of the indicated value are created.

    .PARAMETER OverrideBlockRules
        Write - Boolean
        Indicates that matching network traffic that would otherwise be blocked are allowed.

    .PARAMETER Owner
        Write - String
        Specifies that matching firewall rules of the indicated owner are created.

    .PARAMETER DisplayGroup
        Read - String
        The current value of the Display Group of the Firewall Rule.
#>
#Requires -Module NetworkingDsc


<#
    .NOTES
        HELPER FUNCTIONS
#>

function Get-NetFirewallGroup
{
    <#
        .SYNOPSIS
            This function returns a list of firewall rules applicable to the supplied Firewall grouping.
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [System.String]
        $DisplayGroup
    )

    $rules = switch ($DisplayGroup)
    {
        'Active Directory Domain Services'
        {
            @{ Name = 'ADDS-RPC-TCP-In'; DisplayName = 'Active Directory Domain Controller (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-RPCEPMAP-TCP-In'; DisplayName = 'Active Directory Domain Controller (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-LDAP-TCP-In'; DisplayName = 'Active Directory Domain Controller - LDAP (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-LDAP-UDP-In'; DisplayName = 'Active Directory Domain Controller - LDAP (UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-LDAPSEC-TCP-In'; DisplayName = 'Active Directory Domain Controller - Secure LDAP (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-LDAPGC-TCP-In'; DisplayName = 'Active Directory Domain Controller - LDAP for Global Catalog (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-LDAPGCSEC-TCP-In'; DisplayName = 'Active Directory Domain Controller - Secure LDAP for Global Catalog (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-NP-UDP-In'; DisplayName = 'Active Directory Domain Controller - SAM/LSA (NP-UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-NP-TCP-In'; DisplayName = 'Active Directory Domain Controller - SAM/LSA (NP-TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-NB-Datagram-UDP-In'; DisplayName = 'Active Directory Domain Controller - NetBIOS name resolution (UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'W32Time-NTP-UDP-In'; DisplayName = 'Active Directory Domain Controller - W32Time (NTP-UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-ICMP4-In'; DisplayName = 'Active Directory Domain Controller -  Echo Request (ICMPv4-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-ICMP6-In'; DisplayName = 'Active Directory Domain Controller -  Echo Request (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Active Directory Web Services'
        {
            @{ Name = 'ADWS-TCP-In'; DisplayName = 'Active Directory Web Services (TCP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'AllJoyn Router'
        {
            @{ Name = 'AllJoyn-Router-In-TCP'; DisplayName = 'AllJoyn Router (TCP-In)'; Profile = @('Domain', 'Private'); Enabled = 'True' },
            @{ Name = 'AllJoyn-Router-In-UDP'; DisplayName = 'AllJoyn Router (UDP-In)'; Profile = @('Domain', 'Private'); Enabled = 'True' }
        }

        'BranchCache - Content Retrieval (Uses HTTP)'
        {
            @{ Name = 'Microsoft-Windows-PeerDist-HttpTrans-In'; DisplayName = 'BranchCache Content Retrieval (HTTP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'BranchCache - Hosted Cache Server (Uses HTTPS)'
        {
            @{ Name = 'Microsoft-Windows-PeerDist-HostedServer-In'; DisplayName = 'BranchCache Hosted Cache Server (HTTP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'BranchCache - Peer Discovery (Uses WSD)'
        {
            @{ Name = 'Microsoft-Windows-PeerDist-WSD-In'; DisplayName = 'BranchCache Peer Discovery (WSD-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Cast to Device functionality'
        {

            @{ Name = 'PlayTo-HTTPSTR-In-TCP-NoScope'; DisplayName = 'Cast to Device streaming server (HTTP-Streaming-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'PlayTo-HTTPSTR-In-TCP-LocalSubnetScope'; DisplayName = 'Cast to Device streaming server (HTTP-Streaming-In)'; Profile = 'Private'; Enabled = 'True' },
            @{ Name = 'PlayTo-In-UDP-NoScope'; DisplayName = 'Cast to Device streaming server (RTCP-Streaming-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'PlayTo-In-UDP-LocalSubnetScope'; DisplayName = 'Cast to Device streaming server (RTCP-Streaming-In)'; Profile = 'Private'; Enabled = 'True' },
            @{ Name = 'PlayTo-In-RTSP-NoScope'; DisplayName = 'Cast to Device streaming server (RTSP-Streaming-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'PlayTo-In-RTSP-LocalSubnetScope'; DisplayName = 'Cast to Device streaming server (RTSP-Streaming-In)'; Profile = 'Private'; Enabled = 'True' }

        }

        'Certification Authority'
        {
            @{ Name = 'Microsoft-Windows-CertificateServices-CertSvc-RPC-NP-In'; DisplayName = 'Certification Authority Enrollment and Management Protocol (CERTSVC-RPC-NP-IN)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-CertificateServices-CertSvc-RPC-TCP-In'; DisplayName = 'Certification Authority Enrollment and Management Protocol (CERTSVC-RPC-TCP-IN)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-CertificateServices-CertSvc-RPC-EPMAP-In'; DisplayName = 'Certification Authority Enrollment and Management Protocol (CERTSVC-RPC-EPMAP-IN)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-CertificateServices-CertSvc-DCOM-In'; DisplayName = 'Certification Authority Enrollment and Management Protocol (CERTSVC-DCOM-IN)'; Profile = 'Any'; Enabled = 'True' }
        }

        'COM+ Network Access'
        {
            @{ Name = 'ComPlusNetworkAccess-DCOM-In'; DisplayName = 'COM+ Network Access (DCOM-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'COM+ Remote Administration'
        {
            @{ Name = 'ComPlusRemoteAdministration-DCOM-In'; DisplayName = 'COM+ Remote Administration (DCOM-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Core Networking'
        {
            @{ Name = 'CoreNet-ICMP6-DU-In'; DisplayName = 'Core Networking - Destination Unreachable (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP6-PTB-In'; DisplayName = 'Core Networking - Packet Too Big (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP6-TE-In'; DisplayName = 'Core Networking - Time Exceeded (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP6-PP-In'; DisplayName = 'Core Networking - Parameter Problem (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP6-NDS-In'; DisplayName = 'Core Networking - Neighbor Discovery Solicitation (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP6-NDA-In'; DisplayName = 'Core Networking - Neighbor Discovery Advertisement (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP6-RA-In'; DisplayName = 'Core Networking - Router Advertisement (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP6-RS-In'; DisplayName = 'Core Networking - Router Solicitation (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP6-LQ-In'; DisplayName = 'Core Networking - Multicast Listener Query (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP6-LR-In'; DisplayName = 'Core Networking - Multicast Listener Report (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP6-LR2-In'; DisplayName = 'Core Networking - Multicast Listener Report v2 (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP6-LD-In'; DisplayName = 'Core Networking - Multicast Listener Done (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-ICMP4-DUFRAG-In'; DisplayName = 'Core Networking - Destination Unreachable Fragmentation Needed (ICMPv4-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-IGMP-In'; DisplayName = 'Core Networking - Internet Group Management Protocol (IGMP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-DHCP-In'; DisplayName = 'Core Networking - Dynamic Host Configuration Protocol (DHCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-DHCPV6-In'; DisplayName = 'Core Networking - Dynamic Host Configuration Protocol for IPv6(DHCPV6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-Teredo-In'; DisplayName = 'Core Networking - Teredo (UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-IPHTTPS-In'; DisplayName = 'Core Networking - IPHTTPS (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'CoreNet-IPv6-In'; DisplayName = 'Core Networking - IPv6 (IPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = '{520C846D-D033-4C7A-A58A-BD823CFC47D8}'; DisplayName = 'Core Networking - Teredo (ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Cortana'
        {
            @{ Name = '{00D025E2-A7AB-4C9A-8B4E-D38198C7EB85}'; DisplayName = 'Cortana'; Profile = 'Domain, Private'; Enabled = 'True' },
            @{ Name = '{C6FF2DA9-15FD-4DFE-95EE-8027CEA6C58A}'; DisplayName = 'Cortana'; Profile = 'Domain, Private'; Enabled = 'True' },
            @{ Name = '{FB5D7C32-1632-4213-8927-AAAB1D8F54BB}'; DisplayName = 'Cortana'; Profile = 'Domain, Private'; Enabled = 'True' },
            @{ Name = '{9042432B-CA61-45D5-9A39-2C1CA4F7A74D}'; DisplayName = 'Cortana'; Profile = 'Domain, Private'; Enabled = 'True' }
        }

        'Delivery Optimization'
        {
            @{ Name = 'DeliveryOptimization-TCP-In'; DisplayName = 'Delivery Optimization (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'DeliveryOptimization-UDP-In'; DisplayName = 'Delivery Optimization (UDP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'DFS Management'
        {
            @{ Name = 'DfsMgmt-In-TCP'; DisplayName = 'DFS Management (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'DfSMgmt-DCOM-In-TCP'; DisplayName = 'DFS Management (DCOM-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'DfsMgmt-WMI-In-TCP'; DisplayName = 'DFS Management (WMI-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'DfsMgmt-SMB-In-TCP'; DisplayName = 'DFS Management (SMB-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'DFS Replication'
        {
            @{ Name = 'DFSR-DFSRSvc-In-TCP'; DisplayName = 'DFS Replication (RPC-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'DFSR-DFSRSvc-RPCSS-In-TCP'; DisplayName = 'DFS Replication (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' }
        }

        'DHCP Server'
        {
            @{ Name = 'Microsoft-Windows-DHCP-ClientSvc-DHCPv4-In'; DisplayName = 'DHCP Server v4 (UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-DHCP-ClientSvc-DHCPv6-In'; DisplayName = 'DHCP Server v6 (UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-DHCP-SrvSvc-DHCPv4-In'; DisplayName = 'DHCP Server v4 (UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-DHCP-SrvSvc-DHCPv6-In'; DisplayName = 'DHCP Server v6 (UDP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'DHCP Server Management'
        {
            @{ Name = 'Microsoft-Windows-DHCP-ClientSvc-RPC-TCP-In'; DisplayName = 'DHCP Server (RPC-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-DHCP-ClientSvc-RPCSS-TCP-In'; DisplayName = 'DHCP Server (RPCSS-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-DHCP-SrvSvc-Services-TCP-In'; DisplayName = 'DHCP Server - Remote Service Management using SCM (RPC-in)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-DHCP-Failover-TCP-In'; DisplayName = 'DHCP Server Failover (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-DHCP-SMB-TCP-In'; DisplayName = 'DHCP Server (SMB-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'DIAL protocol server'
        {
            @{ Name = 'DIAL-Protocol-Server-In-TCP-NoScope'; DisplayName = 'DIAL protocol server (HTTP-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'DIAL-Protocol-Server-HTTPSTR-In-TCP-LocalSubnetScope'; DisplayName = 'DIAL protocol server (HTTP-In)'; Profile = 'Private'; Enabled = 'True' }
        }

        'Distributed Transaction Coordinator'
        {
            @{ Name = 'MSDTC-In-TCP'; DisplayName = 'Distributed Transaction Coordinator (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'MSDTC-KTMRM-In-TCP'; DisplayName = 'Distributed Transaction Coordinator (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'MSDTC-RPCSS-In-TCP'; DisplayName = 'Distributed Transaction Coordinator (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' }
        }

        'DNS Service'
        {
            @{ Name = 'DNSSrv-RPCEPMAP-TCP-In'; DisplayName = 'RPC Endpoint Mapper (TCP, Incoming)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'DNSSrv-DNS-TCP-In'; DisplayName = 'DNS (TCP, Incoming)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'DNSSrv-DNS-UDP-In'; DisplayName = 'DNS (UDP, Incoming)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'DNSSrv-RPC-TCP-In'; DisplayName = 'RPC (TCP, Incoming)'; Profile = 'Any'; Enabled = 'True' }
        }

        'DNS Proxy Service'
        {
            @{ Name = 'DnsProxy-TCP-In'; DisplayName = 'DNS Proxy (TCP, Incoming)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'DnsProxy-UDP-In'; DisplayName = 'DNS Proxy (UDP, Incoming)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Failover Cluster Manager'
        {
            @{ Name = 'FailoverClusterManager-ICMPv4-ER-In'; DisplayName = 'Failover Cluster Manager (ICMP4-ER-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'FailoverClusterManager-ICMPv6-ER-In'; DisplayName = 'Failover Cluster Manager (ICMP6-ER-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'File and Printer Sharing'
        {
            @{ Name = '{8F114141-A7AE-4E72-B6F4-F47EA793ADD0}'; DisplayName = 'File and Printer Sharing (LLMNR-UDP-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = '{5E478D01-15ED-4844-99AB-0EDA5793A294}'; DisplayName = 'File and Printer Sharing (Echo Request - ICMPv6-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = '{D09814D0-74B7-47D5-A4DA-9C09B04A5015}'; DisplayName = 'File and Printer Sharing (Echo Request - ICMPv4-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = '{0C121589-5566-47B5-BADF-EBB59142375D}'; DisplayName = 'File and Printer Sharing (Spooler Service - RPC-EPMAP)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = '{F18C5C27-16C8-4D65-AF89-50B808C55B6A}'; DisplayName = 'File and Printer Sharing (Spooler Service - RPC)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = '{2BBE3F5E-AEAE-4063-950C-F630E60700D5}'; DisplayName = 'File and Printer Sharing (NB-Datagram-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = '{9A7940ED-ACE1-4ABD-8633-C0A1EAC67AEC}'; DisplayName = 'File and Printer Sharing (NB-Name-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = '{166FD20A-5857-4C24-AB8D-5CE3F1D2AC7F}'; DisplayName = 'File and Printer Sharing (SMB-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = '{253F271E-C7CA-417C-BFAC-9AE2D2EBFFAC}'; DisplayName = 'File and Printer Sharing (NB-Session-In)'; Profile = 'Domain'; Enabled = 'True' }
        }

        'File and Printer Sharing over SMBDirect'
        {
            @{ Name = 'FPSSMBD-iWARP-In-TCP'; DisplayName = 'File and Printer Sharing over SMBDirect (iWARP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'File Replication'
        {
            @{ Name = 'NTFRS-NTFRSSvc-In-TCP'; DisplayName = 'File Replication (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'NTFRS-NTFRSSvc-RPCSS-In-TCP'; DisplayName = 'File Replication (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' }
        }

        'File Server Remote Management'
        {
            @{ Name = 'FileServer-ServerManager-Winmgmt-TCP-In'; DisplayName = 'File Server Remote Management (WMI-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'FileServer-ServerManager-DCOM-TCP-In'; DisplayName = 'File Server Remote Management (DCOM-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'FileServer-ServerManager-SMB-TCP-In'; DisplayName = 'File Server Remote Management (SMB-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Google Chrome'
        {
            @{ Name = '{E2FFDC38-CA56-4E34-A5C0-A2109DFAB0D0}'; DisplayName = 'Google Chrome (mDNS-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Hyper-V'
        {
            @{ Name = 'VIRT-WMI-RPCSS-In-TCP-NoScope'; DisplayName = 'Hyper-V - WMI (DCOM-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'VIRT-WMI-WINMGMT-In-TCP-NoScope'; DisplayName = 'Hyper-V - WMI (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'VIRT-WMI-ASYNC-In-TCP-NoScope'; DisplayName = 'Hyper-V - WMI (Async-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'VIRT-VMMS-RPC-EPMAP-In-NoScope'; DisplayName = 'Hyper-V (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'VIRT-VMMS-RPC-In-NoScope'; DisplayName = 'Hyper-V (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'VIRT-MIGL-In-TCP-NoScope'; DisplayName = 'Hyper-V (MIG-TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'VIRT-REMOTEDESKTOP-In-TCP-NoScope'; DisplayName = 'Hyper-V (REMOTE_DESKTOP_TCP_IN)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Hyper-V Management Clients'
        {
            @{ Name = 'VIRTCL-WMI-RPCSS-In-TCP-NoScope'; DisplayName = 'Hyper-V Management Clients - WMI (DCOM-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'VIRTCL-WMI-WINMGMT-In-TCP-NoScope'; DisplayName = 'Hyper-V Management Clients - WMI (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'VIRTCL-WMI-ASYNC-In-TCP-NoScope'; DisplayName = 'Hyper-V Management Clients - WMI (Async-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Hyper-V Replica HTTP'
        {
            @{ Name = 'VIRT-HVRHTTPL-In-TCP-NoScope'; DisplayName = 'Hyper-V Replica HTTP Listener (TCP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Hyper-V Replica HTTPS'
        {
            @{ Name = 'VIRT-HVRHTTPSL-In-TCP-NoScope'; DisplayName = 'Hyper-V Replica HTTPS Listener (TCP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'iSCSI Service'
        {
            @{ Name = 'MsiScsi-In-TCP'; DisplayName = 'iSCSI Service (TCP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Kerberos Key Distribution Center'
        {
            @{ Name = 'ADDS-Kerberos-TCP-In'; DisplayName = 'Kerberos Key Distribution Center (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-Kerberos-UDP-In'; DisplayName = 'Kerberos Key Distribution Center (UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-Kerberos-Password-TCP-In'; DisplayName = 'Kerberos Key Distribution Center - PCR (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'ADDS-Kerberos-Password-UDP-In'; DisplayName = 'Kerberos Key Distribution Center - PCR (UDP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Key Management Service'
        {
            @{ Name = 'SPPSVC-In-TCP'; DisplayName = 'Key Management Service (TCP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'mDNS'
        {
            @{ Name = 'MDNS-In-UDP-Private-Active'; DisplayName = 'mDNS (UDP-In)'; Profile = 'Private'; Enabled = 'True' },
            @{ Name = 'MDNS-In-UDP-Domain-Active'; DisplayName = 'mDNS (UDP-In)'; Profile = 'Domain'; Enabled = 'True' }
        }

        'Microsoft Key Distribution Service'
        {
            @{ Name = 'KDSSVC-RPCSS-In-TCP'; DisplayName = 'Microsoft Key Distribution Service'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'KDSSVC-RPC-In-TCP'; DisplayName = 'Microsoft Key Distribution Service'; Profile = 'Any'; Enabled = 'True' }
        }

        'Netlogon Service'
        {
            @{ Name = 'Netlogon-NamedPipe-In'; DisplayName = 'Netlogon Service (NP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Netlogon-TCP-RPC-In'; DisplayName = 'Netlogon Service Authz (RPC)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Network Controller Host Agent Firewall Group'
        {
            @{ Name = 'Microsoft-Windows-Hyper-V-HostAgent'; DisplayName = 'Network Controller Host Agent (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-Hyper-V-HostAgent-WCF'; DisplayName = 'Network Controller Host Agent WCF (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Microsoft-Windows-Hyper-V-HostAgent-WCF-TLS'; DisplayName = 'Network Controller Host Agent WCF over TLS (TCP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Network Discovery'
        {
            @{ Name = '{475EBDF0-98AD-4E77-8B1C-B653FBCF7259}'; DisplayName = 'Network Discovery (Pub-WSD-In)'; Profile = 'Private'; Enabled = 'True' },
            @{ Name = '{8CD6A5A0-1519-4C02-A64E-72B8C7950B40}'; DisplayName = 'Network Discovery (LLMNR-UDP-In)'; Profile = 'Private'; Enabled = 'True' },
            @{ Name = '{E09ED450-A240-46BD-B0C8-DD34B700FA0D}'; DisplayName = 'Network Discovery (WSD-In)'; Profile = 'Private'; Enabled = 'True' },
            @{ Name = '{028C4F25-A0F6-4630-B2C7-1E96187B14A8}'; DisplayName = 'Network Discovery (SSDP-In)'; Profile = 'Private'; Enabled = 'True' },
            @{ Name = '{00E2A1DE-746D-468D-94F3-57C69DF47DC2}'; DisplayName = 'Network Discovery (WSD Events-In)'; Profile = 'Private'; Enabled = 'True' },
            @{ Name = '{C0F08C1F-DD47-4FE2-A7F7-642EC940A138}'; DisplayName = 'Network Discovery (WSD EventsSecure-In)'; Profile = 'Private'; Enabled = 'True' },
            @{ Name = '{DDB69CCD-5566-4AD9-AA45-2FE9E115689A}'; DisplayName = 'Network Discovery (NB-Datagram-In)'; Profile = 'Private'; Enabled = 'True' },
            @{ Name = '{15B5D2BB-7CC2-4B3A-ACAC-9FD405CE1F74}'; DisplayName = 'Network Discovery (NB-Name-In)'; Profile = 'Private'; Enabled = 'True' },
            @{ Name = '{AFF843A0-40A1-4A11-B1CD-58DF6E20A579}'; DisplayName = 'Network Discovery (UPnP-In)'; Profile = 'Private'; Enabled = 'True' }
        }

        'Network Policy Server'
        {
            @{ Name = 'NPS-NPSSvc-In-UDP-1645'; DisplayName = 'Network Policy Server (Legacy RADIUS Authentication - UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'NPS-NPSSvc-In-UDP-1646'; DisplayName = 'Network Policy Server (Legacy RADIUS Accounting - UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'NPS-NPSSvc-In-UDP-1812'; DisplayName = 'Network Policy Server (RADIUS Authentication - UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'NPS-NPSSvc-In-UDP-1813'; DisplayName = 'Network Policy Server (RADIUS Accounting - UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'NPS-NPSSvc-In-DCOM'; DisplayName = 'Network Policy Server (DCOM-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'NPS-NPSSvc-In-RPC'; DisplayName = 'Network Policy Server (RPC)'; Profile = 'Any'; Enabled = 'True' }
        }

        'OpenSSH Server'
        {
            @{ Name = 'OpenSSH-Server-In-TCP'; DisplayName = 'OpenSSH SSH Server (sshd)'; Profile = 'Any'; Enabled = 'True' }
        }


        'Performance Logs and Alerts'
        {
            @{ Name = 'PerfLogsAlerts-PLASrv-In-TCP-NoScope'; DisplayName = 'Performance Logs and Alerts (TCP-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'PerfLogsAlerts-DCOM-In-TCP-NoScope'; DisplayName = 'Performance Logs and Alerts (DCOM-In)'; Profile = 'Domain'; Enabled = 'True' }
        }

        'Remote Desktop'
        {
            @{ Name = 'RemoteDesktop-UserMode-In-TCP'; DisplayName = 'Remote Desktop - User Mode (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteDesktop-UserMode-In-UDP'; DisplayName = 'Remote Desktop - User Mode (UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteDesktop-Shadow-In-TCP'; DisplayName = 'Remote Desktop - Shadow (TCP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Remote Desktop (WebSocket)'
        {
            @{ Name = 'RemoteDesktop-In-TCP-WS'; DisplayName = 'Remote Desktop - (TCP-WS-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteDesktop-In-TCP-WSS'; DisplayName = 'Remote Desktop - (TCP-WSS-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Remote Desktop Gateway Server Farm'
        {
            @{ Name = 'TSG-RPC-LoadBalancer-RPC-In-TCP'; DisplayName = 'Remote Desktop Gateway Server Farm (RPC HTTP Load Balancing Service)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'TSG-LoadBalancer-In-TCP'; DisplayName = 'Remote Desktop Gateway Server Farm (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'TSG-RPCSS-In-TCP'; DisplayName = 'Remote Desktop Gateway Server Farm (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Remote Desktop Gateway Server Transport'
        {
            @{ Name = 'TSG-HTTPS-Transport-In-TCP'; DisplayName = 'Remote Desktop Gateway HTTP Listener'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'TSG-UDP-Transport-In-UDP'; DisplayName = 'Remote Desktop Gateway UDP Listener'; Profile = 'Any'; Enabled = 'True' }
        }

        'Remote Desktop Licensing Server'
        {
            @{ Name = 'TermServLicensing-In-TCP'; DisplayName = 'Remote Desktop Licensing Server(RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'TermServLicensing-RPCSS-In-TCP'; DisplayName = 'Remote Desktop Licensing Server(RPC - EPMAP)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'TermServLicensing-NP-In-TCP'; DisplayName = 'Remote Desktop Licensing Server(NP - In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'TermServLicensing-WMI-DCOM-In-TCP'; DisplayName = 'Remote Desktop Licensing Server - WMI(DCOM - In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'TermServLicensing-WMI-In-TCP'; DisplayName = 'Remote Desktop Licensing Server - WMI(TCP - In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Remote Desktop Services'
        {
            @{ Name = 'TermService-In-TCP'; DisplayName = 'Remote Desktop Services (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'TermService-RPCSS-In-TCP'; DisplayName = 'Remote Desktop Services (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'TermService-NP-In-TCP'; DisplayName = 'Remote Desktop Services (NP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'TermService-WMI-DCOM-In-TCP'; DisplayName = 'Remote Desktop Services - WMI (DCOM-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'TermService-WMI-In-TCP'; DisplayName = 'Remote Desktop Services - WMI (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteDesktopServices-UserMode-In-TCP'; DisplayName = 'Remote Desktop Services - User Mode (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteDesktopServices-UserMode-In-UDP'; DisplayName = 'Remote Desktop Services - User Mode (UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteDesktopServices-Shadow-In-TCP'; DisplayName = 'Remote Desktop Services - Shadow (TCP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Remote Event Log Management'
        {
            @{ Name = 'RemoteEventLogSvc-In-TCP'; DisplayName = 'Remote Event Log Management (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteEventLogSvc-NP-In-TCP'; DisplayName = 'Remote Event Log Management (NP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteEventLogSvc-RPCSS-In-TCP'; DisplayName = 'Remote Event Log Management (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Remote Event Monitor'
        {
            @{ Name = 'EventForwarder-In-TCP'; DisplayName = 'Remote Event Monitor (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'EventForwarder-RPCSS-In-TCP'; DisplayName = 'Remote Event Monitor (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Remote Scheduled Tasks Management'
        {
            @{ Name = 'RemoteTask-In-TCP'; DisplayName = 'Remote Scheduled Tasks Management (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteTask-RPCSS-In-TCP'; DisplayName = 'Remote Scheduled Tasks Management (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Remote Service Management'
        {
            @{ Name = 'RemoteSvcAdmin-In-TCP'; DisplayName = 'Remote Service Management (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteSvcAdmin-NP-In-TCP'; DisplayName = 'Remote Service Management (NP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteSvcAdmin-RPCSS-In-TCP'; DisplayName = 'Remote Service Management (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Remote Shutdown'
        {
            @{ Name = 'Wininit-Shutdown-In-Rule-TCP-RPC'; DisplayName = 'Inbound Rule for Remote Shutdown (TCP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'Wininit-Shutdown-In-Rule-TCP-RPC-EPMapper'; DisplayName = 'Inbound Rule for Remote Shutdown (RPC-EP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Remote Volume Management'
        {
            @{ Name = 'RVM-VDS-In-TCP'; DisplayName = 'Remote Volume Management - Virtual Disk Service (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RVM-VDSLDR-In-TCP'; DisplayName = 'Remote Volume Management - Virtual Disk Service Loader (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RVM-RPCSS-In-TCP'; DisplayName = 'Remote Volume Management (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' }
        }

        'RemoteApp and Desktop Connection Management'
        {
            @{ Name = 'tsCPubRPC-RPC-In-TCP'; DisplayName = 'RemoteApp and Desktop Connection Management (RPC)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Routing and Remote Access'
        {
            @{ Name = 'RRAS-GRE-In'; DisplayName = 'Routing and Remote Access (GRE-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RRAS-L2TP-In-UDP'; DisplayName = 'Routing and Remote Access (L2TP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RRAS-PPTP-In-TCP'; DisplayName = 'Routing and Remote Access (PPTP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Secure Socket Tunneling Protocol'
        {
            @{ Name = 'SSTP-IN-TCP'; DisplayName = 'Secure Socket Tunneling Protocol (SSTP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Secure World Wide Web Services (HTTPS)'
        {
            @{ Name = 'IIS-WebServerRole-HTTPS-In-TCP'; DisplayName = 'World Wide Web Services (HTTPS Traffic-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Shell Input Application'
        {
        }

        'SNMP Service'
        {
            @{ Name = 'SNMP-In-UDP-NoScope'; DisplayName = 'SNMP Service (UDP In)'; Profile = 'Domain'; Enabled = 'True' }
        }

        'SNMP Trap'
        {
            @{ Name = 'SNMPTRAP-In-UDP-NoScope'; DisplayName = 'SNMP Trap Service (UDP In)'; Profile = 'Domain'; Enabled = 'True' }
        }

        'Software Load Balancer'
        {
            @{ Name = 'SLBM-MUX-IN-TCP'; DisplayName = 'Software Load Balancer Multiplexer (TCP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'System Insights'
        {
            @{ Name = 'SystemInsights-Allow-In'; DisplayName = 'System Insights (TCP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'TPM Virtual Smart Card Management'
        {
            @{ Name = 'TPMVSCMGR-RPCSS-In-TCP-NoScope'; DisplayName = 'TPM Virtual Smart Card Management (DCOM-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'TPMVSCMGR-Server-In-TCP-NoScope'; DisplayName = 'TPM Virtual Smart Card Management (TCP-In)'; Profile = 'Domain'; Enabled = 'True' }
        }

        'Virtual Machine Monitoring'
        {
            @{ Name = 'vm-monitoring-dcom'; DisplayName = 'Virtual Machine Monitoring (DCOM-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'vm-monitoring-icmpv4'; DisplayName = 'Virtual Machine Monitoring (Echo Request - ICMPv4-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'vm-monitoring-icmpv6'; DisplayName = 'Virtual Machine Monitoring (Echo Request - ICMPv6-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'vm-monitoring-nb-session'; DisplayName = 'Virtual Machine Monitoring (NB-Session-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'vm-monitoring-rpc'; DisplayName = 'Virtual Machine Monitoring (RPC)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Web Management Service (HTTP)'
        {
            @{ Name = 'IIS-WebServerRole-WMSVC-In-TCP'; DisplayName = 'Web Management Service (HTTP Traffic-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Windows Default Lock Screen'
        {
        }

        'Windows Defender Firewall Remote Management'
        {
            @{ Name = 'RemoteFwAdmin-In-TCP'; DisplayName = 'Windows Defender Firewall Remote Management (RPC)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'RemoteFwAdmin-RPCSS-In-TCP'; DisplayName = 'Windows Defender Firewall Remote Management (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Windows Defender SmartScreen'
        {
        }

        'Windows Deployment Services'
        {
            @{ Name = 'WDS-RPCSS-In-TCP'; DisplayName = 'Windows Deployment Services (RPC-EPMAP)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'WDS-RPC-In-TCP'; DisplayName = 'Windows Deployment Services (RPC-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'WDS-WdsServer-In-UDP'; DisplayName = 'Windows Deployment Services (UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'WDS-NP-In-TCP'; DisplayName = 'Windows Deployment Services (NP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Windows Device Management'
        {
        }

        'Windows Management Instrumentation (WMI)'
        {
            @{ Name = 'WMI-RPCSS-In-TCP'; DisplayName = 'Windows Management Instrumentation (DCOM-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'WMI-WINMGMT-In-TCP'; DisplayName = 'Windows Management Instrumentation (WMI-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'WMI-ASYNC-In-TCP'; DisplayName = 'Windows Management Instrumentation (ASync-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Windows Media Player'
        {
            @{ Name = 'WMP-In-UDP-x86'; DisplayName = 'Windows Media Player x86 (UDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'WMP-In-UDP'; DisplayName = 'Windows Media Player (UDP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Windows Media Player Network Sharing Service'
        {
            @{ Name = 'WMPNSS-QWave-In-UDP-NoScope'; DisplayName = 'Windows Media Player Network Sharing Service (qWave-UDP-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'WMPNSS-QWave-In-TCP-NoScope'; DisplayName = 'Windows Media Player Network Sharing Service (qWave-TCP-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'WMPNSS-HTTPSTR-In-TCP-NoScope'; DisplayName = 'Windows Media Player Network Sharing Service (HTTP-Streaming-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'WMPNSS-WMP-In-UDP-NoScope'; DisplayName = 'Windows Media Player Network Sharing Service (Streaming-UDP-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'WMPNSS-In-UDP-NoScope'; DisplayName = 'Windows Media Player Network Sharing Service (UDP-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'WMPNSS-In-TCP-NoScope'; DisplayName = 'Windows Media Player Network Sharing Service (TCP-In)'; Profile = 'Domain'; Enabled = 'True' },
            @{ Name = 'WMPNSS-SSDPSrv-In-UDP'; DisplayName = 'Windows Media Player Network Sharing Service (SSDP-In)'; Profile = 'Any'; Enabled = 'True' },
            @{ Name = 'WMPNSS-UPnPHost-In-TCP'; DisplayName = 'Windows Media Player Network Sharing Service (UPnP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'Windows Media Player Network Sharing Service (Internet)'
        {
            @{ Name = 'WMPNSS-RME-HTTP-In-TCP'; DisplayName = 'Windows Media Player Network Sharing Service (HTTP-Streaming-In)'; Profile = 'Domain, Private'; Enabled = 'True' }
        }

        'Windows Remote Management'
        {
            @{ Name = 'WINRM-HTTP-In-TCP'; DisplayName = 'Windows Remote Management (HTTP-In)'; Profile = 'Domain, Private'; Enabled = 'True' }
        }

        'Windows Remote Management (Compatibility)'
        {
            @{ Name = 'WINRM-HTTP-Compat-In-TCP'; DisplayName = 'Windows Remote Management - Compatibility Mode (HTTP-In)'; Profile = 'Any'; Enabled = 'True' }
        }

        'World Wide Web Services (HTTP)'
        {
            @{ Name = 'IIS-WebServerRole-HTTP-In-TCP'; DisplayName = 'World Wide Web Services (HTTP Traffic-In)'; Profile = 'Any'; Enabled = 'True' }
        }
    } #end switch

    return $rules

} #end Get-NetFirewallGroup


<#
    .NOTES
        HELPER FUNCTIONS
#>

function Get-PrincipalSecurityIdentifier
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [System.String]
        $Principal
    )

    $ntAccount = $Principal.Split('\\').Trim()

    $objUser = New-Object -TypeName System.Security.Principal.NTAccount($ntAccount[0], $ntAccount[1])

    $objSid = $objUser.Translate([System.Security.Principal.SecurityIdentifier])

    return $objSid.Value
}


configuration FirewallRulesInbound
{
    param
    (
        [Parameter()]
        [System.Collections.Hashtable[]]
        $PredefinedGroups,

        [Parameter()]
        [System.Collections.Hashtable[]]
        $InboundRules
    )

    <#
        Import required modules
    #>
    Import-DscResource -ModuleName NetworkingDsc



    <#
        Enumerate all pre-defined firewall groups
    #>
    if ($PSBoundParameters.ContainsKey('PredefinedGroups'))
    {
        foreach ($g in $PredefinedGroups)
        {
            # remove case sensitivity of ordered Dictionary or Hashtables
            $g = @{} + $g

            # if not specified, ensure Present
            if (-not $g.ContainsKey('Ensure'))
            {
                $g.Ensure = 'Present'
            }

            # retrieve a list of firewall rules for the named group
            $firewallRules = Get-NetFirewallGroup -DisplayGroup $g.DisplayGroup

            # enumerate the returned rules and create the DSC resources
            foreach ($r in $firewallRules)
            {
                # remove case sensitivity of ordered Dictionary or Hashtables
                $r = @{} + $r

                # re-format the Profile
                $r.Profile = switch ($r.Profile)
                {
                    'Domain, Private'
                    {
                        $r.Profile.Split(',').Trim()
                    }

                    Default
                    {
                        $r.Profile
                    }
                }

                # if the Firewall Group is to be 'Absent', disable the firewall rule
                if ($g.Enabled -eq $false)
                {
                    $r.Enabled = 'False'
                }


                # ensure the rule is present
                $r.Ensure = $g.Ensure

                # create execution name for the resource
                $executionName = "DisplayGroup_$("$($r.Name)_$($r.Enabled)" -replace '[-(){}.:\s]', '_')"

                $object = @"

                Creating DSC resource for Firewall with the following values:

                    Firewall $($executionName)
                    {
                        Name        = '$($r.Name)'
                        DisplayName = '$($r.DisplayName)'
                        Profile     = '$($r.Profile)'
                        Enabled     = '$($r.Enabled)'
                        Ensure      = '$($r.Ensure)'
                    }

"@
                Write-Host "$object" -ForegroundColor Yellow

                # create DSC resource for firewall rule
                $Splatting = @{
                    ResourceName  = 'Firewall'
                    ExecutionName = $executionName
                    Properties    = $r
                    NoInvoke      = $true
                }
                (Get-DscSplattedResource @Splatting).Invoke($r)
            } #end foreach
        } #end foreach
    } #end PredefinedGroups


    <#
        Enumerate all firewall rules
    #>
    if ($PSBoundParameters.ContainsKey('InboundRules'))
    {
        foreach ($r in $InboundRules)
        {

            # remove case sensitivity or ordered Dictionary or Hashtable
            $r = @{} + $r

            # this resource must be an inbound rule
            $r.Direction = 'Inbound'

            # the property '' must be specified, otherwise fail
            if (-not $r.ContainsKey('Name'))
            {
                throw "ERROR: The property 'Name' is not defined."
            }

            # the property '' must be specified, otherwise set default
            if (-not $r.ContainsKey('Enabled'))
            {
                Write-Host "Property 'Enabled' is not found..." -ForegroundColor Red
                $r.Enabled = 'True'
            }
            else
            {
                Write-Host "Property 'Enabled' is found..." -ForegroundColor Yellow
            }

            # the property '' must be specified, otherwise set default
            if (-not $r.ContainsKey('Action'))
            {
                Write-Host "Property 'Action' is not found..." -ForegroundColor Red
                $r.Action = 'NotConfigured'
            }
            else
            {
                Write-Host "Property 'Action' is found..." -ForegroundColor Yellow
            }

            # if the property '' is not specified, set defaults
            if (-not $r.ContainsKey('Profile'))
            {
                Write-Host "Property 'Profile' is not found..." -ForegroundColor Red
                $r.Profile = 'Any'
            }
            else
            {
                Write-Host "Property 'Profile' is found..." -ForegroundColor Yellow
            }

            # if the property 'LocalUser' is not specified, set defaults
            if (-not $r.ContainsKey('LocalUser'))
            {
                Write-Host "Property 'LocalUser' is not found..." -ForegroundColor Red
                $r.LocalUser = 'Any'
            }

            # if the property 'RemoteMachine' is specified, construct IPsec rules
            if ($r.ContainsKey('RemoteMachines'))
            {
                Write-Host "Property 'RemoteMachines' is found..." -ForegroundColor Yellow

                # enumerate all remote machine entries
                foreach ($m in $r.RemoteMachines)
                {
                    $isFirst = $true

                    if ($isFirst)
                    {
                        $sid = Get-PrincipalSecurityIdentifier -Principal $m -Verbose

                        Write-Host "The principal $m resolves to SID $sid" -ForegroundColor Yellow

                        $sddl = 'O:LSD:(A;;CC;;;{0})' -f $sid

                        $isFirst = $false
                    }
                    else
                    {
                        $append = '(A;;CC;;;{0})' -f (Get-PrincipalSecurityIdentifier -Principal $m)

                        $sddl = $sddl + $append
                    }
                } #end foreach

                $r.RemoteMachine = $sddl

                $r.Remove('RemoteMachines')
            }

            # if the property 'RemoteUser' is specified, construct
            if ($r.ContainsKey('RemoteUsers'))
            {
                Write-Host "Property 'RemoteUsers' is found..." -ForegroundColor Yellow

                # enumerate all remote machine entries
                foreach ($u in $r.RemoteUsers)
                {
                    $isFirst = $true

                    if ($isFirst)
                    {
                        $sid = Get-PrincipalSecurityIdentifier -Principal $u

                        Write-Host "The principal $u resolves to SID $sid" -ForegroundColor Yellow

                        $sddl = 'O:LSD:(A;;CC;;;{0})' -f $sid

                        $isFirst = $false
                    }
                    else
                    {
                        $append = '(A;;CC;;;{0})' -f (Get-PrincipalSecurityIdentifier -Principal $u)

                        $sddl = $sddl + $append
                    }
                } #end foreach

                $r.RemoteUser = $sddl

                $r.Remove('RemoteUsers')
            }

            # if not specified, ensure 'Present'
            if (-not $r.ContainsKey('Ensure'))
            {
                $r.Ensure = 'Present'
            }

            $executionName = "Firewall_$("$($r.Name)_$($r.Enabled)_$($r.Action)_$($r.Profile)" -replace '[-().:\s]', '_')"

            $object = @"

            Creating DSC resource for Firewall with the following values:

                Firewall $($executionName)
                {
                    Name            = '$($r.Name)'
                    Profile         = '$($r.Profile)'
                    Enabled         = '$($r.Enabled)'
                    Action          = '$($r.Action)'
                    RemoteMachine   = '$($r.RemoteMachine)'
                    RemoteUser      = '$($r.RemoteUser)'
                    Ensure          = '$($r.Ensure)'
                }

"@
            Write-Host "$object" -ForegroundColor Yellow

            # create DSC resource for firewall rule
            $Splatting = @{
                ResourceName  = 'Firewall'
                ExecutionName = $executionName
                Properties    = $r
                NoInvoke      = $true
            }
            (Get-DscSplattedResource @Splatting).Invoke($r)
        }
    } #end InboundRuiles
} #end configuration
