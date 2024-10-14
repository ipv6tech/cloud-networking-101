# Networking in the Cloud

If you are here I assume you either enjoy computer networking or are looking to develop a healthy understanding of the importance of networking in the cloud. Networking is a core component of the cloud. The cloud environments are built on SDN and ubiquitious connectivity. Building well-defined infrastructure is cruicial to reliable and scalable services.

Unfortuntantly we cannot cover all networking services, we could spend a solid week just on networking in AWS alone.

What we will *attempt* to cover!

- Best practices regardless of the Cloud
- Overview of each providers core network infrastructure
- Comparison of providers architectures and terminology
- How Internet2 supports resilient cloud connectivity
  - I2PX Internet2 Peering Exchange
  - I2CC Internet2 Cloud Connect
  - I2RPI Internet2 Rapid Private Interconnect
  - Cost savings potential

My hope for you is to leave this workshop prepared to put some of what you've learnt here into practice. highlights the importance of peaks your interest in netwo

## "Well-Architected" Framework - Network Focus

Most CSP's use the term `well-architected` to describe framework for their specific clouds.

Importance of IP Planning

Redundancy v Resiliancy

## AWS Networking

Some of the areas we won't be covering in detail during this workshop:

- Route53 (DNS) + health checks
- CloudFront (CDN)
- CloudWAN (use AWS backbone for connectivity between your enterprise sites)
- Private Link

AWS Security areas including:

- Web Application Firewall (WAF)
- AWS Network Firewall
- AWS Shield

### VPC

### Subnets

- Reside in a single AZ
  - Once you create a subnet in a AZ you can not move it to a different AZ

- AWS uses 5 address out of each block

```text
.0 - network
.255 - broadcast
.1 - gateway
.2 - dns
.3 - future use
```

#### Gateways

Egress (Only) Internet Gateway
Internet Gateway
NAT Gateway

##### NAT Gateway

Use a NAT Gateway in each AZ

## VPN

Traffic speed limitation around 1.25Gbps
Careful choosing encryption type as that can further impact the performance
Consider a tunnel with the Transit Gateway Connect service for [up to 5Gbps](https://docs.aws.amazon.com/vpc/latest/tgw/transit-gateway-quotas.html) per tunnel

- second tunnel doesn't cost any more than just using a single tunnel
- recommend using BGP, AWS will use MED to shift traffic from one tunnel to the other before maintenance
- failure detection relies on BGP timers which are 90 seconds
  - BFD is only supported on DX connections (for sub 1 second link failure detection)
- AWS recommends VPN connections to each region you have resources in
  - TGW from region to region works but if there is a problem in one region you've disconnected the other regions from your on-prem.

### VGW (VPN Gateway)

### DX (Direct Connect)

Use "VIFs" to connect customer router to a resource inside AWS
    - Can be a VPC via a Virtual Private Gateway
    - Can be a DXGW

Public VIF - enables access to public services (such as S3)
Private VIF - enables private access to a VPC
Transit VIF needed for transit gw, cloud wan,

### DXGW (Direct Connect Gateway)

Direct Connect gateway (DXGW) is a global resource and highly available AWS resource
DXGW is not part of the data path - traffic goes from DX location via the shortest path across AWS to the TGW or VPC resources
You can think of DXGW kind of like a Route reflector

> [! NOTE]
> Direct Connect gateway does not filter prefixes, so extending network segmentation for security isolation or customized routing decisions becomes burdensome at scale

### Transit GW

- Transit gateways are highly available by design
- Regional resource that resides outside of a VPC
- Simplifies networking by acting as a regional router
- Uses Attachments to establish connectivity between resources
- Data flow through the TGW is encrypted

Attachments: Four types of attachments to connect resources
    1. VPC
    2. Direct Connect Gateway
    3. VPN
    4. Transit Gateway Connect (GRE overlay connectivity)   Typically used as a VPN replacement with SD-WAN gateways/appliances.

Transit Gateway Peering:
Ability to peer with other TGW's in different regions to route traffic between regions, across AWS's backbone.

Association:
    Route table used to route packet from an attachment, each attachment can have a different route-table

Propagation:
    Route Table where the attachment routes are installed.

TGW Billing:
    Billed on number of attachments and then bandwidth over attachments

### Routing

#### Static

#### BGP (Dynamic)

##### ASN Info

Best practice to use a unique ASN for each transit GW

## Troubleshooting

**VPC Debugging tool** - spins up an EC2 instance with MTR that logs out to CloudWatch metrics
