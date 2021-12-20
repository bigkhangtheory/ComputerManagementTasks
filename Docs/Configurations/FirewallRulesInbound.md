# FirewallRulesInbound

The **FirewallRulesInbound** DSC configuration is used to control inbound firewall rules for a node.

<br />

## Project Information

|                  |                                                                                                                                                     |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Source**       | https://github.com/bigkhangtheory/ComputerManagementTasks/tree/master/ComputerManagementTasks/DscResources/FirewallRulesInbound |
| **Dependencies** | [NetworkingDsc][NetworkingDsc], [PSDesiredStateConfiguration][PSDesiredStateConfiguration]                                                          |
| **Resources**    | [Firewall][Firewall]                                                                                                                                |

<br />

## Parameters

### Table. Attributes of `FirewallRulesInbound`

| Parameter            | Attribute | DataType        | Description                                                        | Allowed Values |
| :------------------- | :-------- | :-------------- | :----------------------------------------------------------------- | :------------- |
| **PredefinedGroups** |           | `[Hashtable[]]` | Specifies a list of Windows Advanced Firewall Groups to configure. |                |
| **InboundRules**     |           | `[Hashtable[]]` | Specifies a list of Windows Advanced Firewall rules to configure.  |                |

<br />

### Table. Attributes of `PredefinedGroups`

| Parameter        | Attribute  | DataType   | Description                                                                                    | Allowed Values                                            |
| :--------------- | :--------- | :--------- | :--------------------------------------------------------------------------------------------- | :-------------------------------------------------------- |
| **DisplayGroup** | *Required* | `[String]` | Specifies that only matching firewall rules of the indicated group association are configured. | *see [Firewall Rules by Group](#firewall-rules-by-group)* |
| **Enabled**      |            | `[String]` | Enable or disable the supplied configuration.                                                  | `True`, `False`                                           |
| **Ensure**       |            | `[String]` | Ensure the presence/absence of the resource.                                                   | `Present`, `Absent`                                       |

---

<br />

#### Table. Attributes of `InboundRules`

| Parameter               | Attribute  | DataType     | Description                                                                           | Allowed Values                                                                                             |
| ----------------------- | ---------- | ------------ | ------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| **Name**                | *Required* | `[String]`   | Name of the Firewall Rule.                                                            |                                                                                                            |
| **DisplayName**         |            | `[String]`   | Localized, user-facing name of the Firewall Rule being created.                       |                                                                                                            |
| **Group**               |            | `[String]`   | Name of the Firewall Group where we want to put the Firewall Rule.                    |                                                                                                            |
| **Ensure**              |            | `[String]`   | Ensure the presence/absence of the resource.                                          | `Present`, `Absent`                                                                                        |
| **Enabled**             |            | `[String]`   | Enable or disable the supplied configuration.                                         | `True`, `False`                                                                                            |
| **Action**              |            | `[String]`   | Allow or Block the supplied configuration.                                            | `NotConfigured`, `Allow`, `Block`                                                                          |
| **Profile**             |            | `[String[]]` | Specifies one or more profiles to which the rule is assigned.                         |                                                                                                            |
| **Direction**           |            | `[String]`   | Direction of the connection.                                                          | `Inbound`, `Outbound`                                                                                      |
| **RemotePort**          |            | `[String[]]` | Specific Port used for filter. Specified by port number, range, or keyword            |                                                                                                            |
| **LocalPort**           |            | `[String[]]` | Local Port used for the filter.                                                       |                                                                                                            |
| **Protocol**            |            | `[String]`   | Specific Protocol for filter. Specified by name, number, or range.                    |                                                                                                            |
| **Description**         |            | `[String]`   | Documentation for the Rule.                                                           |                                                                                                            |
| **Program**             |            | `[String]`   | Path and file name of the program for which the rule is applied.                      |                                                                                                            |
| **Service**             |            | `[String]`   | Specifies the short name of a Windows service to which the firewall rule applies.     |                                                                                                            |
| **Authentication**      |            | `[String]`   | Specifies that authentication is required on firewall rules.                          | `NotRequired`, `Required`, `NoEncap`                                                                       |
| **Encryption**          |            | `[String]`   | Specifies that encryption in authentication is required on firewall rules.            | `NotRequired`, `Required`, `Dynamic`                                                                       |
| **InterfaceAlias**      |            | `[String[]]` | Specifies the alias of the interface that applies to the traffic.                     |                                                                                                            |
| **InterfaceType**       |            | `[String]`   | Specifies the indicated interface types are subject to the requirements of this rule. | `Any`, `Wired`, `Wireless`, `RemoteAccess`                                                                 |
| **LocalAddress**        |            | `[String[]]` | Specifies that network packets with matching IP addresses match this rule.            |                                                                                                            |
| **LocalUser**           |            | `[String]`   | Specifies the principals to which network traffic this firewall rule applies.         |                                                                                                            |
| **Package**             |            | `[String]`   | Specifies the Windows Store application to which the firewall rule applies.           |                                                                                                            |
| **Platform**            |            | `[String[]]` | Specifies which version of Windows the associated rule applies.                       |                                                                                                            |
| **RemoteAddress**       |            | `[String[]]` | Specifies that network packets with matching IP addresses match this rule.            |                                                                                                            |
| **RemoteMachines**      |            | `[String[]]` | Specifies that matching IPsec rules of the indicated computer accounts are created.   |                                                                                                            |
| **RemoteUsers**         |            | `[String[]]` | Specifies that matching IPsec rules of the indicated user accounts are created.       |                                                                                                            |
| **DynamicTransport**    |            | `[String]`   | Specifies a dynamic transport.                                                        | `Any`, `ProximityApps`, `ProximitySharing`, `WifiDirectPrinting`, `WifiDirectDisplay`, `WifiDirectDevices` |
| **EdgeTraversalPolicy** |            | `[String]`   | Matching firewall rules of the indicated edge traversal policy are created.           | `Block`, `Allow`, `DeferToUser`, `DeferToApp`                                                              |
| **IcmpType**            |            | `[String[]]` | Specifies the ICMP type codes.                                                        |                                                                                                            |
| **LocalOnlyMapping**    |            | `[Boolean]`  | Indicates that matching firewall rules of the indicated value are created.            |                                                                                                            |
| **LooseSourceMapping**  |            | `[Boolean]`  | Indicates that matching firewall rules of the indicated value are created.            |                                                                                                            |
| **OverrideBlockRules**  |            | `[Boolean]`  | Indicates that matching network traffic that would otherwise be blocked are allowed.  |                                                                                                            |
| **Owner**               |            | `[String]`   | Specifies that matching firewall rules of the indicated owner are created.            |                                                                                                            |
| **DisplayGroup**        | Read       | `[String]`   | The current value of the Display Group of the Firewall Rule.                          |                                                                                                            |


---

## Example *FirewallRulesInbound*

```yaml
FirewallRulesInbound:
  PredefinedGroups:
    - DisplayGroup: COM+ Network Access
      Enabled: true

    - DisplayGroup: COM+ Remote Administration
      Enabled: true

    - DisplayGroup: Core Networking
      Enabled: true

    - DisplayGroup: Delivery Optimization
      Enabled: true

    - DisplayGroup: DFS Management
      Enabled: true

    - DisplayGroup: DFS Replication
      Enabled: true

  InboundRules:
    - Name: WinRM SSL
      DisplayName: WinRM SSL
      Enabled: True
      Description: Allow filtered WinRM connections
      Direction: Inbound
      Profile: Domain, Private
      Action: Allow
      LocalPort: 5896
      RemoteMachines:
        - MAPCOM\Bastion Hosts
      RemoteUsers:
        - MAPCOM\Privileged WinRM Users
```

<br />

## Lookup Options in `Datum.yml`

```yaml
lookup_options:

  FirewallRulesInbound:
    merge_hash: deep
  FirewallRulesInbound\PredefinedGroups:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - DisplayGroup
        - Enabled
  FirewallRulesInbound\InboundRules:
    merge_hash_array: UniqueKeyValTuples
    merge_options:
      tuple_keys:
        - Name
        - Enabled
```

# Firewall Rules by Group

This section identifies matching firewall rules that are associated with a Windows Firewall Group.

---

## Active Directory Domain Services

| Display Name                                                                     | Description                                                                                                                  | Profile | Protocol | Local Port | Service                         | Program                             |
| -------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **Active Directory Domain Controller (RPC)**                                     | Inbound rule to allow remote RPC/TCP access to the Active Directory Domain Controller service.                               | Any     | `TCP`    | `RPC`      | **Any**                         | `%systemroot%\System32\lsass.exe`   |
| **Active Directory Domain Controller (RPC-EPMAP)**                               | Inbound rule for the RPCSS service to allow RPC/TCP traffic to the Active Directory Domain Controller service.               | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%systemroot%\system32\svchost.exe` |
| **Active Directory Domain Controller - LDAP (TCP-In)**                           | Inbound rule for the Active Directory Domain Controller service to allow remote LDAP traffic. [TCP 389]                      | Any     | `TCP`    | `389`      | **Any**                         | `%systemroot%\System32\lsass.exe`   |
| **Active Directory Domain Controller - LDAP (UDP-In)**                           | Inbound rule for the Active Directory Domain Controller service to allow remote LDAP traffic. [UDP 389]                      | Any     | `UDP`    | `389`      | **Any**                         | `%systemroot%\System32\lsass.exe`   |
| **Active Directory Domain Controller - Secure LDAP (TCP-In)**                    | Inbound rule for the Active Directory Domain Controller service to allow remote Secure LDAP traffic. [TCP 636]               | Any     | `TCP`    | `636`      | **Any**                         | `%systemroot%\System32\lsass.exe`   |
| **Active Directory Domain Controller - LDAP for Global Catalog (TCP-In)**        | Inbound rule for the Active Directory Domain Controller service to allow remote Global Catalog traffic. [TCP 3268]           | Any     | `TCP`    | `3268`     | **Any**                         | `%systemroot%\System32\lsass.exe`   |
| **Active Directory Domain Controller - Secure LDAP for Global Catalog (TCP-In)** | Inbound rule for the Active Directory Domain Controller service to allow remote Secure Global Catalog traffic. [TCP 3269]    | Any     | `TCP`    | `3269`     | **Any**                         | `%systemroot%\System32\lsass.exe`   |
| **Active Directory Domain Controller - SAM/LSA (NP-UDP-In)**                     | Inbound rule for the Active Directory Domain Controller service to be remotely managed over Named Pipes. [UDP 445]           | Any     | `UDP`    | `445`      | **Any**                         | `System`                            |
| **Active Directory Domain Controller - SAM/LSA (NP-TCP-In)**                     | Inbound rule for the Active Directory Domain Controller service to be remotely managed over Named Pipes. [TCP 445]           | Any     | `TCP`    | `445`      | **Any**                         | `System`                            |
| **Active Directory Domain Controller - NetBIOS name resolution (UDP-In)**        | Inbound rule for the Active Directory Domain Controller service to allow NetBIOS name resolution. [UDP 138]                  | Any     | `UDP`    | `138`      | **Any**                         | `System`                            |
| **Active Directory Domain Controller - W32Time (NTP-UDP-In)**                    | Inbound rule for the Active Directory Domain Controller service to allow NTP traffic for the Windows Time service. [UDP 123] | Any     | `UDP`    | `123`      | **Windows Time**                | `%systemroot%\System32\svchost.exe` |
| **Active Directory Domain Controller -  Echo Request (ICMPv4-In)**               | Inbound rule for the Active Directory Domain Controller service to allow Echo requests (ping).                               | Any     | `ICMPv4` | `RPC`      | **Any**                         | `System`                            |
| **Active Directory Domain Controller -  Echo Request (ICMPv6-In)**               | Inbound rule for the Active Directory Domain Controller service to allow Echo requests (ping).                               | Any     | `ICMPv6` | `RPC`      | **Any**                         | `System`                            |

<br />


## Active Directory Web Services

| Display Name                               | Description                                               | Profile | Protocol | Local Port | Service                           | Program                                                       |
| ------------------------------------------ | --------------------------------------------------------- | ------- | -------- | ---------- | --------------------------------- | ------------------------------------------------------------- |
| **Active Directory Web Services (TCP-In)** | Inbound rule for the Active Directory Web Services. [TCP] | Any     | `TCP`    | `9389`     | **Active Directory Web Services** | `%systemroot%\ADWS\Microsoft.ActiveDirectory.WebServices.exe` |

<br />

## AllJoyn Router

| Display Name                | Description                                   | Profile         | Protocol | Local Port | Service                    | Program                             |
| --------------------------- | --------------------------------------------- | --------------- | -------- | ---------- | -------------------------- | ----------------------------------- |
| **AllJoyn Router (TCP-In)** | Inbound rule for AllJoyn Router traffic [TCP] | Domain, Private | `TCP`    | `9955`     | **AllJoyn Router Service** | `%SystemRoot%\system32\svchost.exe` |
| **AllJoyn Router (UDP-In)** | Inbound rule for AllJoyn Router traffic [UDP] | Domain, Private | `UDP`    | `Any`      | **AllJoyn Router Service** | `%SystemRoot%\system32\svchost.exe` |

<br />


## BranchCache - Content Retrieval (Uses HTTP)

| Display Name                                | Description                                                             | Profile | Protocol | Local Port | Service | Program  |
| ------------------------------------------- | ----------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **BranchCache Content Retrieval (HTTP-In)** | Inbound rule for BranchCache to allow data transfer using HTTP [TCP 80] | Any     | `TCP`    | `80`       | *Any*   | `SYSTEM` |

<br />


## BranchCache - Hosted Cache Client (Uses HTTPS)

| Display Name | Description | Profile | Protocol | Local Port | Service | Program |
| ------------ | ----------- | ------- | -------- | ---------- | ------- | ------- |

<br />


## BranchCache - Hosted Cache Server (Uses HTTPS)

| Display Name                                  | Description                                                                                      | Profile | Protocol | Local Port | Service | Program  |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------ | ------- | -------- | ---------- | ------- | -------- |
| **BranchCache Hosted Cache Server (HTTP-In)** | Inbound rule for BranchCache to allow communication between a hosted cache and its clients [TCP] | Any     | `TCP`    | `80 443`   | *Any*   | `SYSTEM` |

<br />


## BranchCache - Peer Discovery (Uses WSD)

| Display Name                            | Description                                                     | Profile | Protocol | Local Port | Service         | Program                             |
| --------------------------------------- | --------------------------------------------------------------- | ------- | -------- | ---------- | --------------- | ----------------------------------- |
| **BranchCache Peer Discovery (WSD-In)** | Inbound rule for BranchCache to allow peer discovery [UDP 3702] | Any     | `UDP`    | `3702`     | **BranchCache** | `%systemroot%\system32\svchost.exe` |

<br />


## Captive Portal Flow

| Display Name | Description | Profile | Protocol | Local Port | Service | Program |
| ------------ | ----------- | ------- | -------- | ---------- | ------- | ------- |

<br />


## Cast to Device functionality

| Display Name                                            | Description                                                                                                 | Profile | Protocol | Local Port          | Service | Program                               |
| ------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ------- | -------- | ------------------- | ------- | ------------------------------------- |
| **Cast to Device streaming server (HTTP-Streaming-In)** | Inbound rule for the Cast to Device server to allow streaming using HTTP. [TCP 10246]                       | Domain  | `TCP`    | `10246`             | *Any*   | `System`                              |
| **Cast to Device streaming server (HTTP-Streaming-In)** | Inbound rule for the Cast to Device server to allow streaming using HTTP. [TCP 10246]                       | Private | `TCP`    | `10246`             | *Any*   | `System`                              |
| **Cast to Device streaming server (RTCP-Streaming-In)** | Inbound rule for the Cast to Device server to allow streaming using RTSP and RTP. [UDP]                     | Domain  | `UDP`    | `Any`               | *Any*   | `%SystemRoot%\system32\mdeserver.exe` |
| **Cast to Device streaming server (RTCP-Streaming-In)** | Inbound rule for the Cast to Device server to allow streaming using RTSP and RTP. [UDP]                     | Private | `UDP`    | `Any`               | *Any*   | `%SystemRoot%\system32\mdeserver.exe` |
| **Cast to Device streaming server (RTSP-Streaming-In)** | Inbound rule for the Cast to Device server to allow streaming using RTSP and RTP. [TCP 23554, 23555, 23556] | Domain  | `TCP`    | `23554 23555 23556` | *Any*   | `%SystemRoot%\system32\mdeserver.exe` |
| **Cast to Device streaming server (RTSP-Streaming-In)** | Inbound rule for the Cast to Device server to allow streaming using RTSP and RTP. [TCP 23554, 23555, 23556] | Private | `TCP`    | `23554 23555 23556` | *Any*   | `%SystemRoot%\system32\mdeserver.exe` |

<br />


## COM+ Network Access

| Display Name                      | Description                                                           | Profile | Protocol | Local Port | Service                         | Program                             |
| --------------------------------- | --------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **COM+ Network Access (DCOM-In)** | Inbound rule to allow DCOM traffic for COM+ Network Access. [TCP 135] | Any     | `TCP`    | `135`      | **Remote Procedure Call (RPC)** | `%systemroot%\system32\svchost.exe` |

<br />


## COM+ Remote Administration

| Display Name                             | Description                                                                                  | Profile | Protocol | Local Port | Service                     | Program                             |
| ---------------------------------------- | -------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | --------------------------- | ----------------------------------- |
| **COM+ Remote Administration (DCOM-In)** | Inbound rule to allow DCOM traffic to the COM+ System Application for remote administration. | Any     | `TCP`    | `RPC`      | **COM+ System Application** | `%systemroot%\system32\dllhost.exe` |

<br />

## Certification Authority

| Display Name                                                                          | Description                                                                                               | Profile | Protocol | Local Port | Service                                   | Program                             |
| ------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ----------------------------------------- | ----------------------------------- |
| **Certification Authority Enrollment and Management Protocol (CERTSVC-RPC-NP-IN)**    | An inbound rule to allow traffic to the Certification Authority for certificate enrollment                | Any     | `TCP`    | `445`      | **Any**                                   | `System`                            |
| **Certification Authority Enrollment and Management Protocol (CERTSVC-RPC-TCP-IN)**   | An inbound rule to allow traffic to the Certification Authority for certificate enrollment                | Any     | `TCP`    | `RPC`      | **Active Directory Certificate Services** | `%systemroot%\system32\certsrv.exe` |
| **Certification Authority Enrollment and Management Protocol (CERTSVC-RPC-EPMAP-IN)** | An inbound rule to allow traffic to the Certification Authority for certificate enrollment and management | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)**           | `%systemroot%\system32\svchost.exe` |
| **Certification Authority Enrollment and Management Protocol (CERTSVC-DCOM-IN)**      | An inbound rule to allow traffic to the Certification Authority for certificate enrollment and management | Any     | `TCP`    | `135`      | **Remote Procedure Call (RPC)**           | `%systemroot%\system32\svchost.exe` |

<br />

## Core Networking

| Display Name                                                                   | Description                                                                                                                                                                                                                  | Profile | Protocol | Local Port  | Service         | Program                             |
| ------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | -------- | ----------- | --------------- | ----------------------------------- |
| **Core Networking - Destination Unreachable (ICMPv6-In)**                      | Destination Unreachable error messages are sent from any node that a packet traverses which is unable to forward the packet for any reason except congestion.                                                                | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Packet Too Big (ICMPv6-In)**                               | Packet Too Big error messages are sent from any node that a packet traverses which is unable to forward the packet because the packet is too large for the next link.                                                        | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Time Exceeded (ICMPv6-In)**                                | Time Exceeded error messages are generated from any node that a packet traverses if the Hop Limit value is decremented to zero at any point on the path.                                                                     | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Parameter Problem (ICMPv6-In)**                            | Parameter Problem error messages are sent by nodes as a result of incorrectly generated packets.                                                                                                                             | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Neighbor Discovery Solicitation (ICMPv6-In)**              | Neighbor Discovery Solicitations are sent by nodes to discover the link-layer address of another on-link IPv6 node.                                                                                                          | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Neighbor Discovery Advertisement (ICMPv6-In)**             | Neighbor Discovery Advertisement messages are sent by nodes to notify other nodes of link-layer address changes or in response to a Neighbor Discovery Solicitation request.                                                 | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Router Advertisement (ICMPv6-In)**                         | Router Advertisement messages are sent by routers to other nodes for stateless auto-configuration.                                                                                                                           | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Router Solicitation (ICMPv6-In)**                          | Router Solicitation messages are sent by nodes seeking routers to provide stateless auto-configuration.                                                                                                                      | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Multicast Listener Query (ICMPv6-In)**                     | An IPv6 multicast-capable router uses the Multicast Listener Query message to query a link for multicast group membership.                                                                                                   | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Multicast Listener Report (ICMPv6-In)**                    | The Multicast Listener Report message is used by a listening node to either immediately report its interest in receiving multicast traffic at a specific multicast address or in response to a Multicast Listener Query.     | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Multicast Listener Report v2 (ICMPv6-In)**                 | Multicast Listener Report v2 message is used by a listening node to either immediately report its interest in receiving multicast traffic at a specific multicast address or in response to a Multicast Listener Query.      | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Multicast Listener Done (ICMPv6-In)**                      | Multicast Listener Done messages inform local routers that there are no longer any members remaining for a specific multicast address on the subnet.                                                                         | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Destination Unreachable Fragmentation Needed (ICMPv4-In)** | Destination Unreachable Fragmentation Needed error messages are sent from any node that a packet traverses which is unable to forward the packet because fragmentation was needed and the don't fragment bit was set.        | Any     | `ICMPv4` | `RPC`       | *Any*           | `System`                            |
| **Core Networking - Internet Group Management Protocol (IGMP-In)**             | IGMP messages are sent and received by nodes to create, join and depart multicast groups.                                                                                                                                    | Any     | `2`      | `Any`       | *Any*           | `System`                            |
| **Core Networking - Dynamic Host Configuration Protocol (DHCP-In)**            | Allows DHCP (Dynamic Host Configuration Protocol) messages for stateful auto-configuration.                                                                                                                                  | Any     | `UDP`    | `68`        | **DHCP Client** | `%SystemRoot%\system32\svchost.exe` |
| **Core Networking - Dynamic Host Configuration Protocol for IPv6(DHCPV6-In)**  | Allows DHCPV6 (Dynamic Host Configuration Protocol for IPv6) messages for stateful and stateless configuration.                                                                                                              | Any     | `UDP`    | `546`       | **DHCP Client** | `%SystemRoot%\system32\svchost.exe` |
| **Core Networking - Teredo (UDP-In)**                                          | Inbound UDP rule to allow Teredo edge traversal, a technology that provides address assignment and automatic tunneling for unicast IPv6 traffic when an IPv6/IPv4 host is located behind an IPv4 network address translator. | Any     | `UDP`    | `Teredo`    | **IP Helper**   | `%SystemRoot%\system32\svchost.exe` |
| **Core Networking - IPHTTPS (TCP-In)**                                         | Inbound TCP rule to allow IPHTTPS tunneling technology to provide connectivity across HTTP proxies and firewalls.                                                                                                            | Any     | `TCP`    | `IPHTTPSIn` | *Any*           | `System`                            |
| **Core Networking - IPv6 (IPv6-In)**                                           | Inbound rule required to permit IPv6 traffic for ISATAP (Intra-Site Automatic Tunnel Addressing Protocol) and 6to4 tunneling services.                                                                                       | Any     | `41`     | `Any`       | *Any*           | `System`                            |
| **Core Networking - Teredo (ICMPv6-In)**                                       | Echo Request messages are sent as ping requests to other nodes.                                                                                                                                                              | Any     | `ICMPv6` | `RPC`       | *Any*           | `System`                            |

<br />


## Cortana

| Display Name | Description                | Profile         | Protocol | Local Port | Service | Program |
| ------------ | -------------------------- | --------------- | -------- | ---------- | ------- | ------- |
| **Cortana**  | Search the web and Windows | Domain, Private | `Any`    | `Any`      | *Any*   | `Any`   |
| **Cortana**  | Search the web and Windows | Domain, Private | `Any`    | `Any`      | *Any*   | `Any`   |
| **Cortana**  | Search the web and Windows | Domain, Private | `Any`    | `Any`      | *Any*   | `Any`   |
| **Cortana**  | Search the web and Windows | Domain, Private | `Any`    | `Any`      | *Any*   | `Any`   |

<br />

## Cortana

| Display Name | Description                | Profile         | Protocol | Local Port | Service | Program |
| ------------ | -------------------------- | --------------- | -------- | ---------- | ------- | ------- |
| **Cortana**  | Search the web and Windows | Domain, Private | `Any`    | `Any`      | *Any*   | `Any`   |
| **Cortana**  | Search the web and Windows | Domain, Private | `Any`    | `Any`      | *Any*   | `Any`   |
| **Cortana**  | Search the web and Windows | Domain, Private | `Any`    | `Any`      | *Any*   | `Any`   |
| **Cortana**  | Search the web and Windows | Domain, Private | `Any`    | `Any`      | *Any*   | `Any`   |

<br />


## Delivery Optimization

| Display Name                       | Description                                                                | Profile | Protocol | Local Port | Service                   | Program                             |
| ---------------------------------- | -------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------- | ----------------------------------- |
| **Delivery Optimization (TCP-In)** | Inbound rule to allow Delivery Optimization to connect to remote endpoints | Any     | `TCP`    | `7680`     | **Delivery Optimization** | `%SystemRoot%\system32\svchost.exe` |
| **Delivery Optimization (UDP-In)** | Inbound rule to allow Delivery Optimization to connect to remote endpoints | Any     | `UDP`    | `7680`     | **Delivery Optimization** | `%SystemRoot%\system32\svchost.exe` |

<br />


## Desktop App Web Viewer

| Display Name | Description | Profile | Protocol | Local Port | Service | Program |
| ------------ | ----------- | ------- | -------- | ---------- | ------- | ------- |

<br />

## DFS Management

| Display Name                 | Description                                                                                                          | Profile | Protocol | Local Port | Service                                | Program                                |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | -------------------------------------- | -------------------------------------- |
| **DFS Management (TCP-In)**  | Inbound rule for DFS Management to allow the DFS Management service to be remotely managed via DCOM.                 | Any     | `TCP`    | `RPC`      | **Any**                                | `%systemroot%\system32\dfsfrsHost.exe` |
| **DFS Management (DCOM-In)** | Inbound rule for DFS Management to allow remote DCOM activation via the RPCSS service.                               | Any     | `TCP`    | `135`      | **Remote Procedure Call (RPC)**        | `%systemroot%\system32\svchost.exe`    |
| **DFS Management (WMI-In)**  | Inbound rule for DFS Management to allow remote invocation of WMI.                                                   | Any     | `TCP`    | `RPC`      | **Windows Management Instrumentation** | `%systemroot%\system32\svchost.exe`    |
| **DFS Management (SMB-In)**  | Inbound rule for DFS Management to allow Server Message Block transmission and reception via Named Pipes. [TCP 445]. | Any     | `TCP`    | `445`      | **Any**                                | `System`                               |

<br />

## DFS Replication

| Display Name                    | Description                                                                      | Profile | Protocol | Local Port | Service                         | Program                             |
| ------------------------------- | -------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **DFS Replication (RPC-In)**    | Inbound rule to allow DFS Replication RPC traffic.                               | Any     | `TCP`    | `RPC`      | **DFS Replication**             | `%SystemRoot%\system32\dfsrs.exe`   |
| **DFS Replication (RPC-EPMAP)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic for DFS Replication. | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%systemroot%\system32\svchost.exe` |

<br />

## DHCP Server

| Display Name                | Description                                                                                  | Profile | Protocol | Local Port | Service         | Program                             |
| --------------------------- | -------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | --------------- | ----------------------------------- |
| **DHCP Server v4 (UDP-In)** | An inbound rule to allow traffic to the IPv4 Dynamic Host Control Protocol Server. [UDP 67]  | Any     | `UDP`    | `67`       | **DHCP Server** | `%systemroot%\system32\svchost.exe` |
| **DHCP Server v6 (UDP-In)** | An inbound rule to allow traffic to the IPv6 Dynamic Host Control Protocol Server. [UDP 547] | Any     | `UDP`    | `547`      | **DHCP Server** | `%systemroot%\system32\svchost.exe` |
| **DHCP Server v4 (UDP-In)** | An inbound rule to allow traffic so that rogue detection works in V4. [UDP 68]               | Any     | `UDP`    | `68`       | **DHCP Server** | `%systemroot%\system32\svchost.exe` |
| **DHCP Server v6 (UDP-In)** | An inbound rule to allow traffic so that rogue detection works in V6. [UDP 546]              | Any     | `UDP`    | `546`      | **DHCP Server** | `%systemroot%\system32\svchost.exe` |

<br />

## DHCP Server Management

| Display Name                                                   | Description                                                                                                                           | Profile | Protocol | Local Port | Service                         | Program                              |
| -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ------------------------------------ |
| **DHCP Server (RPC-In)**                                       | An inbound rule to allow traffic to allow RPC traffic for DHCP Server management.                                                     | Any     | `TCP`    | `RPC`      | **DHCP Server**                 | `%systemroot%\system32\svchost.exe`  |
| **DHCP Server (RPCSS-In)**                                     | An inbound rule to allow traffic to allow RPCSS traffic for DHCP Server management.                                                   | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%systemroot%\system32\svchost.exe`  |
| **DHCP Server - Remote Service Management using SCM (RPC-in)** | An inbound rule to allow services to be remotely managed using Service Control Manager. This rule is added with the DHCP Server role. | Any     | `TCP`    | `RPC`      | **Any**                         | `%systemroot%\system32\services.exe` |
| **DHCP Server Failover (TCP-In)**                              | An inbound rule to allow DHCP failover messages to the IPv4 Dynamic Host Configuration Protocol Server. [TCP 647]                     | Any     | `TCP`    | `647`      | **DHCP Server**                 | `%systemroot%\system32\svchost.exe`  |
| **DHCP Server (SMB-In)**                                       | An inbound rule to allow creation of DHCP server security groups remotely. [TCP 445]                                                  | Any     | `TCP`    | `445`      | **Any**                         | `System`                             |

<br />

## DiagTrack

| Display Name | Description | Profile | Protocol | Local Port | Service | Program |
| ------------ | ----------- | ------- | -------- | ---------- | ------- | ------- |

<br />

## DIAL protocol server

| Display Name                       | Description                                                                                   | Profile | Protocol | Local Port | Service | Program  |
| ---------------------------------- | --------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **DIAL protocol server (HTTP-In)** | Inbound rule for DIAL protocol server to allow remote control of Apps using HTTP. [TCP 10247] | Domain  | `TCP`    | `10247`    | *Any*   | `System` |
| **DIAL protocol server (HTTP-In)** | Inbound rule for DIAL protocol server to allow remote control of Apps using HTTP. [TCP 10247] | Private | `TCP`    | `10247`    | *Any*   | `System` |

<br />

## Distributed Transaction Coordinator

| Display Name                                        | Description                                                                                                                                              | Profile | Protocol | Local Port | Service                                           | Program                             |
| --------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------------------------- | ----------------------------------- |
| **Distributed Transaction Coordinator (TCP-In)**    | Inbound rule to allow traffic for the Distributed Transaction Coordinator. [TCP]                                                                         | Any     | `TCP`    | `Any`      | *Any*                                             | `%SystemRoot%\system32\msdtc.exe`   |
| **Distributed Transaction Coordinator (RPC)**       | Inbound rule for the Kernel Transaction Resource Manager for Distributed Transaction Coordinator service to be remotely managed via RPC/TCP.             | Any     | `TCP`    | `RPC`      | **KtmRm for Distributed Transaction Coordinator** | `%SystemRoot%\system32\svchost.exe` |
| **Distributed Transaction Coordinator (RPC-EPMAP)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic for the Kernel Transaction Resource Manager for Distributed Transaction Coordinator service. | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)**                   | `%SystemRoot%\system32\svchost.exe` |

<br />

## DNS Service

| Display Name                            | Description                                                                     | Profile | Protocol | Local Port | Service                         | Program                             |
| --------------------------------------- | ------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **RPC Endpoint Mapper (TCP, Incoming)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic to the DNS Service. | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%systemroot%\system32\svchost.exe` |
| **DNS (TCP, Incoming)**                 | Inbound rule to allow remote TCP access to the DNS service.                     | Any     | `TCP`    | `53`       | **DNS Server**                  | `%systemroot%\System32\dns.exe`     |
| **DNS (UDP, Incoming)**                 | Inbound rule to allow remote UDP access to the DNS service.                     | Any     | `UDP`    | `53`       | **DNS Server**                  | `%systemroot%\System32\dns.exe`     |
| **RPC (TCP, Incoming)**                 | Inbound rule to allow remote RPC/TCP access to the DNS service.                 | Any     | `TCP`    | `RPC`      | **DNS Server**                  | `%systemroot%\System32\dns.exe`     |

<br />

## DNS Proxy Service

| Display Name                  | Description                                                       | Profile | Protocol | Local Port | Service               | Program                                        |
| ----------------------------- | ----------------------------------------------------------------- | ------- | -------- | ---------- | --------------------- | ---------------------------------------------- |
| **DNS Proxy (TCP, Incoming)** | Inbound rule to allow remote TCP access to the DNS proxy service. | Any     | `TCP`    | `53`       | **DNS Proxy Service** | `%systemroot%\System32\Microsoft.DnsProxy.exe` |
| **DNS Proxy (UDP, Incoming)** | Inbound rule to allow remote UDP access to the DNS proxy service. | Any     | `UDP`    | `53`       | **DNS Proxy Service** | `%systemroot%\System32\Microsoft.DnsProxy.exe` |

<br />

## Email and accounts

| Display Name | Description | Profile | Protocol | Local Port | Service | Program |
| ------------ | ----------- | ------- | -------- | ---------- | ------- | ------- |

<br />

## Failover Cluster Manager

| Display Name                               | Description                                                                               | Profile | Protocol | Local Port | Service | Program  |
| ------------------------------------------ | ----------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **Failover Cluster Manager (ICMP4-ER-In)** | Inbound rule for Failover Cluster management tools to allow ICMP4 echo response messages. | Any     | `ICMPv4` | `RPC`      | **Any** | `System` |
| **Failover Cluster Manager (ICMP6-ER-In)** | Inbound rule for Failover Cluster management tools to allow ICMP6 echo response messages. | Any     | `ICMPv6` | `RPC`      | **Any** | `System` |

<br />

## File and Printer Sharing

| Display Name                                               | Description                                                                                                                   | Profile | Protocol | Local Port | Service                         | Program                             |
| ---------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **File and Printer Sharing (LLMNR-UDP-In)**                | Inbound rule for File and Printer Sharing to allow Link Local Multicast Name Resolution. [UDP 5355]                           | Domain  | `UDP`    | `5355`     | **DNS Client**                  | `%SystemRoot%\system32\svchost.exe` |
| **File and Printer Sharing (Echo Request - ICMPv6-In)**    | Echo Request messages are sent as ping requests to other nodes.                                                               | Domain  | `ICMPv6` | `RPC`      | *Any*                           | `System`                            |
| **File and Printer Sharing (Echo Request - ICMPv4-In)**    | Echo Request messages are sent as ping requests to other nodes.                                                               | Domain  | `ICMPv4` | `RPC`      | *Any*                           | `System`                            |
| **File and Printer Sharing (Spooler Service - RPC-EPMAP)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic for the Spooler Service.                                          | Domain  | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%SystemRoot%\system32\svchost.exe` |
| **File and Printer Sharing (Spooler Service - RPC)**       | Inbound rule for File and Printer Sharing to allow the Print Spooler Service to communicate via TCP/RPC.                      | Domain  | `TCP`    | `RPC`      | **Print Spooler**               | `%SystemRoot%\system32\spoolsv.exe` |
| **File and Printer Sharing (NB-Datagram-In)**              | Inbound rule for File and Printer Sharing to allow NetBIOS Datagram transmission and reception. [UDP 138]                     | Domain  | `UDP`    | `138`      | *Any*                           | `System`                            |
| **File and Printer Sharing (NB-Name-In)**                  | Inbound rule for File and Printer Sharing to allow NetBIOS Name Resolution. [UDP 137]                                         | Domain  | `UDP`    | `137`      | *Any*                           | `System`                            |
| **File and Printer Sharing (SMB-In)**                      | Inbound rule for File and Printer Sharing to allow Server Message Block transmission and reception via Named Pipes. [TCP 445] | Domain  | `TCP`    | `445`      | *Any*                           | `System`                            |
| **File and Printer Sharing (NB-Session-In)**               | Inbound rule for File and Printer Sharing to allow NetBIOS Session Service connections. [TCP 139]                             | Domain  | `TCP`    | `139`      | *Any*                           | `System`                            |

<br />

## File and Printer Sharing over SMBDirect

| Display Name                                           | Description                                                                        | Profile | Protocol | Local Port | Service | Program  |
| ------------------------------------------------------ | ---------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **File and Printer Sharing over SMBDirect (iWARP-In)** | Inbound rule for File and Printer Sharing over SMBDirect to allow iWARP [TCP 5445] | Any     | `TCP`    | `5445`     | *Any*   | `System` |

<br />

## File Replication

| Display Name                     | Description                                                                       | Profile | Protocol | Local Port | Service                         | Program                             |
| -------------------------------- | --------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **File Replication (RPC)**       | Inbound rule to allow File Replication RPC traffic.                               | Any     | `TCP`    | `RPC`      | **File Replication**            | `%SystemRoot%\system32\NTFRS.exe`   |
| **File Replication (RPC-EPMAP)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic for File Replication. | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%systemroot%\system32\svchost.exe` |

<br />

## File Server Remote Management

| Display Name                                | Description                                                          | Profile | Protocol | Local Port | Service                                | Program                             |
| ------------------------------------------- | -------------------------------------------------------------------- | ------- | -------- | ---------- | -------------------------------------- | ----------------------------------- |
| **File Server Remote Management (WMI-In)**  | Inbound rule to allow WMI traffic to manage the File Services role.  | Any     | `TCP`    | `RPC`      | **Windows Management Instrumentation** | `%systemroot%\system32\svchost.exe` |
| **File Server Remote Management (DCOM-In)** | Inbound rule to allow DCOM traffic to manage the File Services role. | Any     | `TCP`    | `135`      | **Remote Procedure Call (RPC)**        | `%systemroot%\system32\svchost.exe` |
| **File Server Remote Management (SMB-In)**  | Inbound rule to allow SMB traffic to manage the File Services role.  | Any     | `TCP`    | `445`      | *Any*                                  | `System`                            |

<br />

## Google Chrome

| Display Name                | Description                                           | Profile | Protocol | Local Port | Service | Program                                                 |
| --------------------------- | ----------------------------------------------------- | ------- | -------- | ---------- | ------- | ------------------------------------------------------- |
| **Google Chrome (mDNS-In)** | Inbound rule for Google Chrome to allow mDNS traffic. | Any     | `UDP`    | `5353`     | **Any** | `C:\Program Files\Google\Chrome\Application\chrome.exe` |

<br />

## Hyper-V

| Display Name                        | Description                                                                        | Profile | Protocol | Local Port | Service                                | Program                                   |
| ----------------------------------- | ---------------------------------------------------------------------------------- | ------- | -------- | ---------- | -------------------------------------- | ----------------------------------------- |
| **Hyper-V - WMI (DCOM-In)**         | Inbound rule for Hyper-V to allow WMI management via DCOM. [TCP 135]               | Any     | `TCP`    | `135`      | **Remote Procedure Call (RPC)**        | `%SystemRoot%\system32\svchost.exe`       |
| **Hyper-V - WMI (TCP-In)**          | Inbound rule for Hyper-V to allow remote WMI traffic. [TCP]                        | Any     | `TCP`    | `Any`      | **Windows Management Instrumentation** | `%SystemRoot%\system32\svchost.exe`       |
| **Hyper-V - WMI (Async-In)**        | Inbound rule for Hyper-V to allow asynchronous WMI traffic. [TCP]                  | Any     | `TCP`    | `Any`      | **Any**                                | `%systemroot%\system32\wbem\unsecapp.exe` |
| **Hyper-V (RPC-EPMAP)**             | Inbound rule for the RPCSS service to allow RPC/TCP traffic for Hyper-V.           | Any     | `TCP`    | `RPCEPMap` | **Any**                                | `System`                                  |
| **Hyper-V (RPC)**                   | Inbound rule for Hyper-V to allow remote management via RPC/TCP.                   | Any     | `TCP`    | `RPC`      | **Any**                                | `System`                                  |
| **Hyper-V (MIG-TCP-In)**            | Inbound rule for Hyper-V to allow planned failover of virtual machines. [TCP 6600] | Any     | `TCP`    | `6600`     | **Hyper-V Virtual Machine Management** | `%systemroot%\system32\vmms.exe`          |
| **Hyper-V (REMOTE_DESKTOP_TCP_IN)** | Inbound rule for Hyper-V to allow remote connection to virtual machine. [TCP 2179] | Any     | `TCP`    | `2179`     | **Hyper-V Virtual Machine Management** | `%systemroot%\system32\vmms.exe`          |

<br />

## Hyper-V Management Clients

| Display Name                                    | Description                                                                                 | Profile | Protocol | Local Port | Service                                | Program                                   |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | -------------------------------------- | ----------------------------------------- |
| **Hyper-V Management Clients - WMI (DCOM-In)**  | Inbound rule for the Hyper-V management clients to allow WMI management via DCOM. [TCP 135] | Any     | `TCP`    | `135`      | **Remote Procedure Call (RPC)**        | `%SystemRoot%\system32\svchost.exe`       |
| **Hyper-V Management Clients - WMI (TCP-In)**   | Inbound rule for the Hyper-V management clients to allow remote WMI traffic. [TCP]          | Any     | `TCP`    | `Any`      | **Windows Management Instrumentation** | `%SystemRoot%\system32\svchost.exe`       |
| **Hyper-V Management Clients - WMI (Async-In)** | Inbound rule for the Hyper-V management clients to allow asynchronous WMI traffic. [TCP]    | Any     | `TCP`    | `Any`      | **Any**                                | `%systemroot%\system32\wbem\unsecapp.exe` |

<br />

## Hyper-V Replica HTTP

| Display Name                               | Description                                                                                | Profile | Protocol | Local Port | Service | Program  |
| ------------------------------------------ | ------------------------------------------------------------------------------------------ | ------- | -------- | ---------- | ------- | -------- |
| **Hyper-V Replica HTTP Listener (TCP-In)** | Inbound rule for Hyper-V Replica listener to accept HTTP connection for replication. [TCP] | Any     | `TCP`    | `80`       | **Any** | `System` |

<br />

## Hyper-V Replica HTTPS

| Display Name                                | Description                                                                                 | Profile | Protocol | Local Port | Service | Program  |
| ------------------------------------------- | ------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **Hyper-V Replica HTTPS Listener (TCP-In)** | Inbound rule for Hyper-V Replica listener to accept HTTPS connection for replication. [TCP] | Any     | `TCP`    | `443`      | **Any** | `System` |

<br />

## iSCSI Service

| Display Name               | Description                                                                                      | Profile | Protocol | Local Port | Service                               | Program                             |
| -------------------------- | ------------------------------------------------------------------------------------------------ | ------- | -------- | ---------- | ------------------------------------- | ----------------------------------- |
| **iSCSI Service (TCP-In)** | Inbound rule for the iSCSI Service to allow communications with an iSCSI server or device. [TCP] | Any     | `TCP`    | `Any`      | **Microsoft iSCSI Initiator Service** | `%SystemRoot%\system32\svchost.exe` |

<br />

## Kerberos Key Distribution Center

| Display Name                                        | Description                                                                                                    | Profile | Protocol | Local Port | Service | Program                           |
| --------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | --------------------------------- |
| **Kerberos Key Distribution Center (TCP-In)**       | Inbound rule for the Kerberos Key Distribution Center service. [TCP 88]                                        | Any     | `TCP`    | `88`       | **Any** | `%systemroot%\System32\lsass.exe` |
| **Kerberos Key Distribution Center (UDP-In)**       | Inbound rule for the Kerberos Key Distribution Center service. [UDP 88]                                        | Any     | `UDP`    | `88`       | **Any** | `%systemroot%\System32\lsass.exe` |
| **Kerberos Key Distribution Center - PCR (TCP-In)** | Inbound rule for the Kerberos Key Distribution Center service to allow for password change requests. [TCP 464] | Any     | `TCP`    | `464`      | **Any** | `%systemroot%\System32\lsass.exe` |
| **Kerberos Key Distribution Center - PCR (UDP-In)** | Inbound rule for the Kerberos Key Distribution Center service to allow for password change requests. [UDP 464] | Any     | `UDP`    | `464`      | **Any** | `%systemroot%\System32\lsass.exe` |

<br />

## Key Management Service

| Display Name                        | Description                                                                                                  | Profile | Protocol | Local Port | Service                 | Program                                  |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------ | ------- | -------- | ---------- | ----------------------- | ---------------------------------------- |
| **Key Management Service (TCP-In)** | Inbound rule for the Key Management Service to allow for machine counting and license compliance. [TCP 1688] | Any     | `TCP`    | `1688`     | **Software Protection** | `%SystemRoot%\system32\sppextcomobj.exe` |

<br />


## mDNS

| Display Name      | Description                         | Profile | Protocol | Local Port | Service        | Program                             |
| ----------------- | ----------------------------------- | ------- | -------- | ---------- | -------------- | ----------------------------------- |
| **mDNS (UDP-In)** | Inbound rule for mDNS traffic [UDP] | Private | `UDP`    | `5353`     | **DNS Client** | `%SystemRoot%\system32\svchost.exe` |
| **mDNS (UDP-In)** | Inbound rule for mDNS traffic [UDP] | Domain  | `UDP`    | `5353`     | **DNS Client** | `%SystemRoot%\system32\svchost.exe` |

<br />

## Microsoft Key Distribution Service

| Display Name                           | Description                        | Profile | Protocol | Local Port | Service                                | Program                           |
| -------------------------------------- | ---------------------------------- | ------- | -------- | ---------- | -------------------------------------- | --------------------------------- |
| **Microsoft Key Distribution Service** | Microsoft Key Distribution Service | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)**        | `%systemroot%\system32\lsass.exe` |
| **Microsoft Key Distribution Service** | Microsoft Key Distribution Service | Any     | `TCP`    | `RPC`      | **Microsoft Key Distribution Service** | `%systemroot%\system32\lsass.exe` |

<br />


## Narrator QuickStart

| Display Name | Description | Profile | Protocol | Local Port | Service | Program |
| ------------ | ----------- | ------- | -------- | ---------- | ------- | ------- |

<br />


## Netlogon Service

| Display Name                     | Description                                                                         | Profile | Protocol | Local Port | Service | Program                           |
| -------------------------------- | ----------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | --------------------------------- |
| **Netlogon Service (NP-In)**     | Inbound rule for the NetLogon service to be remotely managed over Named Pipes.      | Any     | `TCP`    | `445`      | *Any*   | `System`                          |
| **Netlogon Service Authz (RPC)** | Inbound rule for the NetLogon service to process remote authz requests via RPC/TCP. | Any     | `TCP`    | `RPC`      | *Any*   | `%SystemRoot%\System32\lsass.exe` |

<br />

## Network Controller Host Agent Firewall Group

| Display Name                                            | Description                                                                   | Profile | Protocol | Local Port | Service           | Program                             |
| ------------------------------------------------------- | ----------------------------------------------------------------------------- | ------- | -------- | ---------- | ----------------- | ----------------------------------- |
| **Network Controller Host Agent (TCP-In)**              | Allow all inbound TCP traffic to Network Controller Host Agent                | Any     | `TCP`    | `Any`      | **NC Host Agent** | `%SystemRoot%\system32\svchost.exe` |
| **Network Controller Host Agent WCF (TCP-In)**          | Allow inbound port 80 TCP traffic to Network Controller Host Agent for WCF    | Any     | `TCP`    | `80`       | **Any**           | `system`                            |
| **Network Controller Host Agent WCF over TLS (TCP-In)** | Allow inbound port 443 HTTPS traffic to Network Controller Host Agent for WCF | Any     | `TCP`    | `443`      | **Any**           | `system`                            |

<br />

## Network Discovery

| Display Name                                | Description                                                                                          | Profile | Protocol | Local Port | Service                                     | Program                             |
| ------------------------------------------- | ---------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------------------- | ----------------------------------- |
| **Network Discovery (Pub-WSD-In)**          | Inbound rule for Network Discovery to discover devices via Function Discovery. [UDP 3702]            | Private | `UDP`    | `3702`     | **Function Discovery Resource Publication** | `%SystemRoot%\system32\svchost.exe` |
| **Network Discovery (LLMNR-UDP-In)**        | Inbound rule for Network Discovery to allow Link Local Multicast Name Resolution. [UDP 5355]         | Private | `UDP`    | `5355`     | **DNS Client**                              | `%SystemRoot%\system32\svchost.exe` |
| **Network Discovery (WSD-In)**              | Inbound rule for Network Discovery to discover devices via Function Discovery. [UDP 3702]            | Private | `UDP`    | `3702`     | **Function Discovery Provider Host**        | `%SystemRoot%\system32\svchost.exe` |
| **Network Discovery (SSDP-In)**             | Inbound rule for Network Discovery to allow use of the Simple Service Discovery Protocol. [UDP 1900] | Private | `UDP`    | `1900`     | **SSDP Discovery**                          | `%SystemRoot%\system32\svchost.exe` |
| **Network Discovery (WSD Events-In)**       | Inbound rule for Network Discovery to allow WSDAPI Events via Function Discovery. [TCP 5357]         | Private | `TCP`    | `5357`     | *Any*                                       | `System`                            |
| **Network Discovery (WSD EventsSecure-In)** | Inbound rule for Network Discovery to allow Secure WSDAPI Events via Function Discovery. [TCP 5358]  | Private | `TCP`    | `5358`     | *Any*                                       | `System`                            |
| **Network Discovery (NB-Datagram-In)**      | Inbound rule for Network Discovery to allow NetBIOS Datagram transmission and reception. [UDP 138]   | Private | `UDP`    | `138`      | *Any*                                       | `System`                            |
| **Network Discovery (NB-Name-In)**          | Inbound rule for Network Discovery to allow NetBIOS Name Resolution. [UDP 137]                       | Private | `UDP`    | `137`      | *Any*                                       | `System`                            |
| **Network Discovery (UPnP-In)**             | Inbound rule for Network Discovery to allow use of Universal Plug and Play. [TCP 2869]               | Private | `TCP`    | `2869`     | *Any*                                       | `System`                            |

<br />


## OpenSSH Server

| Display Name                  | Description                                | Profile | Protocol | Local Port | Service | Program                                  |
| ----------------------------- | ------------------------------------------ | ------- | -------- | ---------- | ------- | ---------------------------------------- |
| **OpenSSH SSH Server (sshd)** | Inbound rule for OpenSSH SSH Server (sshd) | Any     | `TCP`    | `22`       | *Any*   | `%SystemRoot%\system32\OpenSSH\sshd.exe` |

<br />


## Performance Logs and Alerts

| Display Name                              | Description                                                                             | Profile | Protocol | Local Port | Service                         | Program                             |
| ----------------------------------------- | --------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **Performance Logs and Alerts (TCP-In)**  | Inbound rule for Performance Logs and Alerts traffic. [TCP-In]                          | Domain  | `TCP`    | `Any`      | *Any*                           | `%systemroot%\system32\plasrv.exe`  |
| **Performance Logs and Alerts (DCOM-In)** | Inbound rule for Performance Logs and Alerts to allow remote DCOM activation. [TCP-135] | Domain  | `TCP`    | `135`      | **Remote Procedure Call (RPC)** | `%systemroot%\system32\svchost.exe` |

<br />

## Remote Desktop

| Display Name                            | Description                                                                                                    | Profile | Protocol | Local Port | Service                     | Program                             |
| --------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | --------------------------- | ----------------------------------- |
| **Remote Desktop - User Mode (TCP-In)** | Inbound rule for the Remote Desktop service to allow RDP traffic. [TCP 3389]                                   | Any     | `TCP`    | `3389`     | **Remote Desktop Services** | `%SystemRoot%\system32\svchost.exe` |
| **Remote Desktop - User Mode (UDP-In)** | Inbound rule for the Remote Desktop service to allow RDP traffic. [UDP 3389]                                   | Any     | `UDP`    | `3389`     | **Remote Desktop Services** | `%SystemRoot%\system32\svchost.exe` |
| **Remote Desktop - Shadow (TCP-In)**    | Inbound rule for the Remote Desktop service to allow shadowing of an existing Remote Desktop session. (TCP-In) | Any     | `TCP`    | `Any`      | *Any*                       | `%SystemRoot%\system32\RdpSa.exe`   |

<br />

## Remote Desktop (WebSocket)

| Display Name                      | Description                                                                                        | Profile | Protocol | Local Port | Service | Program  |
| --------------------------------- | -------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **Remote Desktop - (TCP-WS-In)**  | Inbound rule for the Remote Desktop service to allow RDP over WebSocket traffic. [TCP 3387]        | Any     | `TCP`    | `3387`     | *Any*   | `System` |
| **Remote Desktop - (TCP-WSS-In)** | Inbound rule for the Remote Desktop service to allow RDP traffic over secure WebSocket. [TCP 3392] | Any     | `TCP`    | `3392`     | *Any*   | `System` |

<br />

### Remote Desktop Gateway Server Farm

| Display Name                                                             | Description                                                                                                | Profile | Protocol | Local Port | Service                             | Program                             |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ----------------------------------- | ----------------------------------- |
| **Remote Desktop Gateway Server Farm (RPC HTTP Load Balancing Service)** | Inbound rule for the Remote Desktop Gateway Server Farm to allow RPC Load balancing communications.        | Any     | `TCP`    | `RPC`      | **RPC/HTTP Load Balancing Service** | `%systemroot%\system32\svchost.exe` |
| **Remote Desktop Gateway Server Farm (TCP-In)**                          | Inbound rule to allow connections from other members of the Remote Desktop Gateway Server farm. [TCP 3388] | Any     | `TCP`    | `3388`     | **Remote Desktop Gateway**          | `%systemroot%\system32\svchost.exe` |
| **Remote Desktop Gateway Server Farm (RPC-EPMAP)**                       | Inbound rule for the RPCSS service to allow RPC/TCP traffic for the Remote Desktop Gateway Server Farm.    | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)**     | `%systemroot%\system32\svchost.exe` |

<br />

### Remote Desktop Gateway Server Transport

| Display Name                             | Description                                                                                                                                    | Profile | Protocol | Local Port | Service                    | Program                             |
| ---------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | -------------------------- | ----------------------------------- |
| **Remote Desktop Gateway HTTP Listener** | Inbound rule to allow connections to remote computers on your corporate network through HTTP(S) protocol on the Remote Desktop Gateway server. | Any     | `TCP`    | `443`      | **Any**                    | `System`                            |
| **Remote Desktop Gateway UDP Listener**  | Inbound rule to allow connections to remote computers on your corporate network through UDP protocol on the Remote Desktop Gateway server.     | Any     | `UDP`    | `3391`     | **Remote Desktop Gateway** | `%systemroot%\system32\svchost.exe` |

<br />

## Remote Event Log Management

| Display Name                                | Description                                                                                  | Profile | Protocol | Local Port | Service                         | Program                             |
| ------------------------------------------- | -------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **Remote Event Log Management (RPC)**       | Inbound rule for the local Event Log service to be remotely managed via RPC/TCP.             | Any     | `TCP`    | `RPC`      | **Windows Event Log**           | `%SystemRoot%\system32\svchost.exe` |
| **Remote Event Log Management (NP-In)**     | Inbound rule for the local Event Log service to be remotely managed over Named Pipes.        | Any     | `TCP`    | `445`      | *Any*                           | `System`                            |
| **Remote Event Log Management (RPC-EPMAP)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic for the local Event Log Service. | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%SystemRoot%\system32\svchost.exe` |

<br />

## Remote Event Monitor

| Display Name                         | Description                                                                              | Profile | Protocol | Local Port | Service                         | Program                                |
| ------------------------------------ | ---------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | -------------------------------------- |
| **Remote Event Monitor (RPC)**       | Inbound rule for remote event monitoring via RPC/TCP.                                    | Any     | `TCP`    | `RPC`      | *Any*                           | `%SystemRoot%\system32\NetEvtFwdr.exe` |
| **Remote Event Monitor (RPC-EPMAP)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic for remote event monitoring. | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%SystemRoot%\system32\svchost.exe`    |

<br />

## Remote Scheduled Tasks Management

| Display Name                                      | Description                                                                                 | Profile | Protocol | Local Port | Service                         | Program                             |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **Remote Scheduled Tasks Management (RPC)**       | Inbound rule for the Task Scheduler service to be remotely managed via RPC/TCP.             | Any     | `TCP`    | `RPC`      | **Task Scheduler**              | `%SystemRoot%\system32\svchost.exe` |
| **Remote Scheduled Tasks Management (RPC-EPMAP)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic for the Task Scheduler service. | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%SystemRoot%\system32\svchost.exe` |

<br />

## Remote Service Management

| Display Name                              | Description                                                                                        | Profile | Protocol | Local Port | Service                         | Program                              |
| ----------------------------------------- | -------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ------------------------------------ |
| **Remote Service Management (RPC)**       | Inbound rule for the local Service Control Manager to be remotely managed via RPC/TCP.             | Any     | `TCP`    | `RPC`      | *Any*                           | `%SystemRoot%\system32\services.exe` |
| **Remote Service Management (NP-In)**     | Inbound rule for the local Service Control Manager to be remotely managed over Named Pipes.        | Any     | `TCP`    | `445`      | *Any*                           | `System`                             |
| **Remote Service Management (RPC-EPMAP)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic for the local Service Control Manager. | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%SystemRoot%\system32\svchost.exe`  |

<br />

## Remote Shutdown

| Display Name                                     | Description                                                 | Profile | Protocol | Local Port | Service | Program                             |
| ------------------------------------------------ | ----------------------------------------------------------- | ------- | -------- | ---------- | ------- | ----------------------------------- |
| **Inbound Rule for Remote Shutdown (TCP-In)**    | Inbound rule for the Remote Shutdown via dynamic RPC/TCP.   | Any     | `TCP`    | `RPC`      | *Any*   | `%systemroot%\system32\wininit.exe` |
| **Inbound Rule for Remote Shutdown (RPC-EP-In)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic | Any     | `TCP`    | `RPCEPMap` | *Any*   | `%systemroot%\system32\wininit.exe` |

<br />

## Remote Volume Management

| Display Name                                                     | Description                                                                                                     | Profile | Protocol | Local Port | Service                         | Program                             |
| ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **Remote Volume Management - Virtual Disk Service (RPC)**        | Inbound rule for the Remote Volume Management - Virtual Disk Service to be remotely managed via RPC/TCP.        | Any     | `TCP`    | `RPC`      | **Virtual Disk**                | `%SystemRoot%\system32\vds.exe`     |
| **Remote Volume Management - Virtual Disk Service Loader (RPC)** | Inbound rule for the Remote Volume Management - Virtual Disk Service Loader to be remotely managed via RPC/TCP. | Any     | `TCP`    | `RPC`      | *Any*                           | `%SystemRoot%\system32\vdsldr.exe`  |
| **Remote Volume Management (RPC-EPMAP)**                         | Inbound rule for the RPCSS service to allow RPC/TCP traffic for Remote Volume Management.                       | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%SystemRoot%\system32\svchost.exe` |

<br />

## RemoteApp and Desktop Connection Management

| Display Name                                          | Description                                                                                                  | Profile | Protocol | Local Port | Service                                         | Program                             |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ------- | -------- | ---------- | ----------------------------------------------- | ----------------------------------- |
| **RemoteApp and Desktop Connection Management (RPC)** | Inbound rule to allow RemoteApp and Desktop Connection Management to be remotely managed via RPC/TCP traffic | Any     | `TCP`    | `5504`     | **RemoteApp and Desktop Connection Management** | `%systemroot%\system32\svchost.exe` |

<br />

## Routing and Remote Access

| Display Name                            | Description                                                                       | Profile | Protocol | Local Port | Service | Program  |
| --------------------------------------- | --------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **Routing and Remote Access (GRE-In)**  | Inbound rule for RRAS to allow Generic Routing Encapsulation Protocol traffic.    | Any     | `47`     | `Any`      | *Any*   | `System` |
| **Routing and Remote Access (L2TP-In)** | Inbound rule for RRAS to allow Layer 2 Tunnel Protocol traffic. [UDP 1701]        | Any     | `UDP`    | `1701`     | *Any*   | `System` |
| **Routing and Remote Access (PPTP-In)** | Inbound rule for RRAS to allow Point-to-Point Tunnel Protocol traffic. [TCP 1723] | Any     | `TCP`    | `1723`     | *Any*   | `System` |

<br />

## Secure Socket Tunneling Protocol

| Display Name                                   | Description                                                                         | Profile | Protocol | Local Port | Service | Program  |
| ---------------------------------------------- | ----------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **Secure Socket Tunneling Protocol (SSTP-In)** | Inbound rule to allow HTTPS traffic for Secure Socket Tunneling Protocol. [TCP 443] | Any     | `TCP`    | `443`      | *Any*   | `System` |

<br />

## Secure World Wide Web Services (HTTPS)

| Display Name                                   | Description                                                                              | Profile | Protocol | Local Port | Service | Program  |
| ---------------------------------------------- | ---------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **World Wide Web Services (HTTPS Traffic-In)** | An inbound rule to allow HTTPS traffic for Internet Information Services (IIS) [TCP 443] | Any     | `TCP`    | `443`      | *Any*   | `System` |

<br />

## SNMP Service

| Display Name              | Description                                                                                             | Profile | Protocol | Local Port | Service          | Program                          |
| ------------------------- | ------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ---------------- | -------------------------------- |
| **SNMP Service (UDP In)** | Inbound rule for the Simple Network Management Protocol (SNMP) Service to allow SNMP traffic. [UDP 161] | Domain  | `UDP`    | `161`      | **SNMP Service** | `%SystemRoot%\system32\snmp.exe` |

<br />

## SNMP Trap

| Display Name                   | Description                                                           | Profile | Protocol | Local Port | Service       | Program                              |
| ------------------------------ | --------------------------------------------------------------------- | ------- | -------- | ---------- | ------------- | ------------------------------------ |
| **SNMP Trap Service (UDP In)** | Inbound rule for the SNMP Trap Service to allow SNMP traps. [UDP 162] | Domain  | `UDP`    | `162`      | **SNMP Trap** | `%SystemRoot%\system32\snmptrap.exe` |

<br />

## Software Load Balancer

| Display Name                                    | Description                                                                                       | Profile | Protocol | Local Port | Service | Program                                |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------------------------------------- |
| **Software Load Balancer Multiplexer (TCP-In)** | The Software Load Balancer Multiplexer enables TCP communication to the Network Controller. [TCP] | Any     | `TCP`    | `Any`      | ****    | `%SystemRoot%\system32\MuxSvcHost.exe` |

<br />

## System Insights

| Display Name                 | Description                                                     | Profile | Protocol | Local Port | Service | Program                            |
| ---------------------------- | --------------------------------------------------------------- | ------- | -------- | ---------- | ------- | ---------------------------------- |
| **System Insights (TCP-In)** | Inbound rule to allow traffic to System Insights service. [TCP] | Any     | `TCP`    | `30000`    | *Any*   | `%SystemRoot%\System32\wsisvc.exe` |

<br />

## TPM Virtual Smart Card Management

| Display Name                                    | Description                                                                                   | Profile | Protocol | Local Port | Service                         | Program                                     |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ------------------------------------------- |
| **TPM Virtual Smart Card Management (DCOM-In)** | Inbound rule for remote TPM Virtual Smart Card Management to allow DCOM activation. [TCP 135] | Domain  | `TCP`    | `135`      | **Remote Procedure Call (RPC)** | `%SystemRoot%\system32\svchost.exe`         |
| **TPM Virtual Smart Card Management (TCP-In)**  | Inbound rule for remote TPM Virtual Smart Card Management traffic. [TCP]                      | Domain  | `TCP`    | `Any`      | *Any*                           | `%SystemRoot%\system32\RmtTpmVscMgrSvr.exe` |

<br />

## Virtual Machine Monitoring

| Display Name                                              | Description                                                       | Profile | Protocol | Local Port | Service                         | Program                             |
| --------------------------------------------------------- | ----------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **Virtual Machine Monitoring (DCOM-In)**                  | Allow DCOM traffic for remote Windows Management Instrumentation. | Any     | `TCP`    | `135`      | **Remote Procedure Call (RPC)** | `%SystemRoot%\system32\svchost.exe` |
| **Virtual Machine Monitoring (Echo Request - ICMPv4-In)** | Echo Request messages are sent as ping requests to other nodes.   | Any     | `ICMPv4` | `Any`      | *Any*                           | `Any`                               |
| **Virtual Machine Monitoring (Echo Request - ICMPv6-In)** | Echo Request messages are sent as ping requests to other nodes.   | Any     | `ICMPv6` | `Any`      | *Any*                           | `Any`                               |
| **Virtual Machine Monitoring (NB-Session-In)**            | Allow NetBIOS Session Service connections.                        | Any     | `TCP`    | `139`      | *Any*                           | `Any`                               |
| **Virtual Machine Monitoring (RPC)**                      | Allow Task Scheduler service to be remotely managed via RPC/TCP.  | Any     | `TCP`    | `RPC`      | **Task Scheduler**              | `%SystemRoot%\system32\svchost.exe` |

<br />

## Web Management Service (HTTP)

| Display Name                                 | Description                                                                                                | Profile | Protocol | Local Port | Service | Program  |
| -------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **Web Management Service (HTTP Traffic-In)** | An inbound rule to allow Web Management Service traffic for Internet Information Services (IIS) [TCP 8172] | Any     | `TCP`    | `8172`     | *Any*   | `system` |

<br />

## Windows Deployment Services

| Display Name                                | Description                                                                                  | Profile | Protocol | Local Port | Service                                | Program                             |
| ------------------------------------------- | -------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | -------------------------------------- | ----------------------------------- |
| **Windows Deployment Services (RPC-EPMAP)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic for Windows Deployment Services. | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)**        | `%systemroot%\system32\svchost.exe` |
| **Windows Deployment Services (RPC-In)**    | Inbound rule for Windows Deployment Services to allow RPC/TCP traffic.                       | Any     | `TCP`    | `RPC`      | **Windows Deployment Services Server** | `%systemroot%\system32\svchost.exe` |
| **Windows Deployment Services (UDP-In)**    | Inbound rule for Windows Deployment Services to allow UDP traffic.                           | Any     | `UDP`    | `Any`      | **Windows Deployment Services Server** | `%systemroot%\system32\svchost.exe` |
| **Windows Deployment Services (NP-In)**     | Inbound rule to allow Windows Deployment Services to be remotely managed over Named Pipes.   | Any     | `TCP`    | `445`      | **Any**                                | `System`                            |

<br />

## Windows Defender Firewall Remote Management

| Display Name                                                | Description                                                                                    | Profile | Protocol | Local Port | Service                         | Program                             |
| ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------------------------------- | ----------------------------------- |
| **Windows Defender Firewall Remote Management (RPC)**       | Inbound rule for the Windows Defender Firewall to be remotely managed via RPC/TCP.             | Any     | `TCP`    | `RPC`      | **IPsec Policy Agent**          | `%SystemRoot%\system32\svchost.exe` |
| **Windows Defender Firewall Remote Management (RPC-EPMAP)** | Inbound rule for the RPCSS service to allow RPC/TCP traffic for the Windows Defender Firewall. | Any     | `TCP`    | `RPCEPMap` | **Remote Procedure Call (RPC)** | `%SystemRoot%\system32\svchost.exe` |

<br />

## Windows Management Instrumentation (WMI)

| Display Name                                      | Description                                                                                         | Profile | Protocol | Local Port | Service                                | Program                                   |
| ------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ------- | -------- | ---------- | -------------------------------------- | ----------------------------------------- |
| **Windows Management Instrumentation (DCOM-In)**  | Inbound rule to allow DCOM traffic for remote Windows Management Instrumentation. [TCP 135]         | Any     | `TCP`    | `135`      | **Remote Procedure Call (RPC)**        | `%SystemRoot%\system32\svchost.exe`       |
| **Windows Management Instrumentation (WMI-In)**   | Inbound rule to allow WMI traffic for remote Windows Management Instrumentation. [TCP]              | Any     | `TCP`    | `Any`      | **Windows Management Instrumentation** | `%SystemRoot%\system32\svchost.exe`       |
| **Windows Management Instrumentation (ASync-In)** | Inbound rule to allow Asynchronous WMI traffic for remote Windows Management Instrumentation. [TCP] | Any     | `TCP`    | `Any`      | *Any*                                  | `%systemroot%\system32\wbem\unsecapp.exe` |

<br />

## Windows Media Player

| Display Name                          | Description                                                               | Profile | Protocol | Local Port | Service | Program                                                 |
| ------------------------------------- | ------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | ------------------------------------------------------- |
| **Windows Media Player x86 (UDP-In)** | Inbound rule for Windows Media Player to allow UDP Media Streaming. [UDP] | Any     | `UDP`    | `Any`      | *Any*   | `%ProgramFiles(x86)%\Windows Media Player\wmplayer.exe` |
| **Windows Media Player (UDP-In)**     | Inbound rule for Windows Media Player to allow UDP Media Streaming. [UDP] | Any     | `UDP`    | `Any`      | *Any*   | `%ProgramFiles%\Windows Media Player\wmplayer.exe`      |

<br />

## Windows Media Player Network Sharing Service

| Display Name                                                         | Description                                                                                                                                      | Profile | Protocol | Local Port | Service                                    | Program                                            |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | ------- | -------- | ---------- | ------------------------------------------ | -------------------------------------------------- |
| **Windows Media Player Network Sharing Service (qWave-UDP-In)**      | Inbound rule for the Windows Media Player Network Sharing Service to allow use of the Quality Windows Audio Video Experience Service. [UDP 2177] | Domain  | `UDP`    | `2177`     | **Quality Windows Audio Video Experience** | `%SystemRoot%\system32\svchost.exe`                |
| **Windows Media Player Network Sharing Service (qWave-TCP-In)**      | Inbound rule for the Windows Media Player Network Sharing Service to allow use of the Quality Windows Audio Video Experience Service. [TCP 2177] | Domain  | `TCP`    | `2177`     | **Quality Windows Audio Video Experience** | `%SystemRoot%\system32\svchost.exe`                |
| **Windows Media Player Network Sharing Service (HTTP-Streaming-In)** | Inbound rule for the Windows Media Player Network Sharing Service to allow HTTP Media Streaming. [TCP 10243]                                     | Domain  | `TCP`    | `10243`    | *Any*                                      | `System`                                           |
| **Windows Media Player Network Sharing Service (Streaming-UDP-In)**  | Inbound rule for Windows Media Player to allow UDP Media Streaming. [UDP]                                                                        | Domain  | `UDP`    | `Any`      | *Any*                                      | `%PROGRAMFILES%\Windows Media Player\wmplayer.exe` |
| **Windows Media Player Network Sharing Service (UDP-In)**            | Inbound rule for the Windows Media Player Network Sharing Service to allow sharing traffic. [UDP]                                                | Domain  | `UDP`    | `Any`      | *Any*                                      | `%PROGRAMFILES%\Windows Media Player\wmpnetwk.exe` |
| **Windows Media Player Network Sharing Service (TCP-In)**            | Inbound rule for the Windows Media Player Network Sharing Service to allow sharing traffic. [TCP]                                                | Domain  | `TCP`    | `Any`      | *Any*                                      | `%PROGRAMFILES%\Windows Media Player\wmpnetwk.exe` |
| **Windows Media Player Network Sharing Service (SSDP-In)**           | Inbound rule for the Windows Media Player Network Sharing Service to allow use of the Simple Service Discovery Protocol. [UDP 1900]              | Any     | `UDP`    | `1900`     | **SSDP Discovery**                         | `%SystemRoot%\system32\svchost.exe`                |
| **Windows Media Player Network Sharing Service (UPnP-In)**           | Inbound rule for the Windows Media Player Network Sharing Service to allow use of Universal Plug and Play. [TCP 2869]                            | Any     | `TCP`    | `2869`     | *Any*                                      | `System`                                           |

<br />

## Windows Media Player Network Sharing Service (Internet)

| Display Name                                                         | Description                                                                                                  | Profile         | Protocol | Local Port | Service | Program  |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | --------------- | -------- | ---------- | ------- | -------- |
| **Windows Media Player Network Sharing Service (HTTP-Streaming-In)** | Inbound rule for the Windows Media Player Network Sharing Service to allow HTTP Media Streaming. [TCP 10245] | Domain, Private | `TCP`    | `10245`    | *Any*   | `System` |

<br />

## Windows Remote Management

| Display Name                            | Description                                                              | Profile         | Protocol | Local Port | Service | Program  |
| --------------------------------------- | ------------------------------------------------------------------------ | --------------- | -------- | ---------- | ------- | -------- |
| **Windows Remote Management (HTTP-In)** | Inbound rule for Windows Remote Management via WS-Management. [TCP 5985] | Domain, Private | `TCP`    | `5985`     | *Any*   | `System` |

<br />

## Windows Remote Management (Compatibility)

| Display Name                                                 | Description                                                                               | Profile | Protocol | Local Port | Service | Program  |
| ------------------------------------------------------------ | ----------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **Windows Remote Management - Compatibility Mode (HTTP-In)** | Compatibility mode inbound rule for Windows Remote Management via WS-Management. [TCP 80] | Any     | `TCP`    | `80`       | *Any*   | `System` |

<br />

## World Wide Web Services (HTTP)

| Display Name                                  | Description                                                                            | Profile | Protocol | Local Port | Service | Program  |
| --------------------------------------------- | -------------------------------------------------------------------------------------- | ------- | -------- | ---------- | ------- | -------- |
| **World Wide Web Services (HTTP Traffic-In)** | An inbound rule to allow HTTP traffic for Internet Information Services (IIS) [TCP 80] | Any     | `TCP`    | `80`       | *Any*   | `System` |

---

[NetworkingDsc]: https://github.com/dsccommunity/NetworkingDsc
[PSDesiredStateConfiguration]: https://docs.microsoft.com/en-us/powershell/module/psdesiredstateconfiguration/?view=powershell-7.1
[Firewall]: https://github.com/dsccommunity/NetworkingDsc/wiki/Firewall
[WindowsFeature]: https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/windowsfeatureresource?view=powershell-7.2