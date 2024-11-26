# Lab 7: Bonus Lab - Verifying Routing Tables with the CSPs

In this lab we will look at some of the network tools that the CSPs provide to help look at the routing tables and which prefixes are seen by our i2lab environment with that provider.

---

## AWS Routing

The "cloud" way of doing this is to create a log 

---

## Azure Routing

There are two common places in Azure that you can look for routing information. The first is in the ER peerings service and the second is in the subnet/VPC level.

### ER Peering Routing Table

How to view the ER routing table:

1. Navigate to the ER service....
![View ER Route Table](files/az_er_route_table.png)

### VNet/Subnet Routing Table

How to view the VNet routing table:

1. Navigate to the VNet
2. Do some stuff....

## Google Cloud Routing

From the Cloud Router we can see what the routing table looks like.

### Cloud Router Routing Table

1. Navigate to Google Cloud Router Service
2. Verify

### VPC Effective Routes

1. Navigate to the [VPC Network service](https://console.cloud.google.com/networking/networks)
2. Press **Routes** in the sidebar menu
3. In the **EFFECTIVE ROUTES** panel:
   - **Network** select **`i2lab-vpc`**.
   - **Region** select **`us-east4 (Northern Virginia)`**.
4. Press **VIEW**.
![GC Routing Table](files/gc_vpc_route_table.png)

This will show you the routes that are learned and installed in the VPC routing table. Bonus: try another region and see what the routing table looks like.

---

## Oracle Cloud Routing

### DRG Routing table

How to view the routing table for the DRG

1. 