# Oracle Notes

## Architecture

![oci](oracle/oci.png)

**Region** - a location that oracle has a presense
    - several locations with many availability domains, many with one availablity domain
**Availablity Domain** - one or more data centers, in regions that have multiple Availability domains, these can operate independently from each other and keep going even if one availability domain goes offline.
**Fault Domain** - Each fault domain has a minimum of three racks that have compute, load balancing and network type resources.

### Virtual Cloud Network (VCN)

![vcn](/oracle/vcn.png)

**VCN** is a software-defined network that you set up in the Oracle Cloud Infrastructure data centers in a particular region. A VCN can be thought of as a representation of a physical data center, it is a base resource that other resources get built upon and grouped within.

- Private network(s)
- Resides in a single region
- Up to 5 non-overlapping IPv4 CIDR blocks
  - Up to 300 subnets per VCN
- !! CIDR blocks can be modified after VCNs are created
- IPv6 is optional in a VCN

#### IP Addressing

**CIDR Blocks** are a large block of IP addresses that can be further divided to create smaller blocks of contiguous IP addresses. For the purpose of Cloud Networking we can refer to the large block assigned to a VCN or region as the CIDR and the smaller blocks of addresses as subnets.

A CIDR block is a VCN IP address range that is the superset address range that can be subnetted into smaller subnets inside the VCN.

- Allowable IPv4 address range size in a VCN is between a /16 through /30
- First two IP addresses in the range is used as the gateway and the last IP in a range is broadcast, leaving all others usable

**Private IP Addresses** are not directly reachable over the Internet.

**Public IP Addresses** can be assigned to a resource and reachable over the Internet.

- Two types, **ephermeral** and **reserved** IP addresses
- instances in a public subnet by default get a public IP address assigned.
- by default these automatically assigned IP's will be ephermeral and you can not change the type to a reserved IP.
- reserved IP addresses can be moved from vnic to vnic which means they can move between instances.

#### Subnets

![subnets](/oracle/oci-subnets.png)

- two different constructs, private and public
- typically RFC-1918 but don't have to be
- subnets can be **availablity domain specific** or a **regional specific**

**Availablity Domain Subnets** resides inside a single availablity domain in a VCN.

**Regional Subnets** stretch across all availablity domains within a region.

> [!Note]
> Oracle recommends use of **regional subnets** because they're more flexible. They make it easier to efficiently divide your VCN into subnets while also designing for availability domain failure.

> [!Caution]
> Resources created in a regional subnet still reside inside a specified availablity domain. If that AD goes down, the resource will go down but resources in other AD's using the regional subnet will still be reachable.

**Public** Would have
**Private** Would

#### Security Lists

Security lists allow you to control traffic in/out of a set of resources in a VCN.

- Typically subnet based
- enforced at the VNIC level
- associated when the subnet is created or after, if none is specified when the subnet is created a default security list is applied to the subnet
- have up to 5 security lists applied to a subnet
- applies to an instance regardless if they are trying to communicate within the same VCN or a different VCN
- Security list rules are stateful by default, can also be configured to be stateless
- If a list has both stateful and stateless matches, the stateless match is preferred

#### Gateways Overview

**Internet gateway** allows communication from resources inside a _public_ subnet to the Internet.

**NAT gateway** allows communication from resources inside a _private_ subnet to the Internet.
**Service gateway** allows resources to bypass using the Internet to reach resources in the Oracle Services Network (OSN)

> [!NOTE]
> **Oracle Services Network** (OSN) is a network operated by Oracle with publicly available resources

**Dynamic Routing Gateway** _(DRG)_ allows communication to on-prem resources via FastConnect or VPN.
