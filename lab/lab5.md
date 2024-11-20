# Lab 5: Building Dedicated Connections to the Cloud

## Objective

Establish connectivity between the Internet2 Virtual Router that you build in [Lab 1](lab1.md) with the CSPs of your choice.

<br>

![image](files/multicloud.png)

---

<details>
<summary><b>AWS: Building a Hosted Direct Connect (DX) Connection</b></summary>

### Starting in the Internet2 Insight Console

1. Navigate to your Virtual Network Space (VNS) from [Lab 1](lab1.md)
2. Find the Virtual Router you created in Lab 1.
3. Select **`Add Peering using AWS Direct Connect`**.
![AWS peering](files/i2cc_aws_peering.png)
4. Enter your **AWS Account ID**.
5. Filter by region to select **`US East (N. Virginia)`**.
6. Select an Interfaces that has bandwidth available.
7. Enter a **VLAN ID** or use the **`Auto`** button to pick the next available VLAN ID _(Note the VLAN ID, you'll need the VLAN ID later)_.
8. For **Max Bandwidth** select **`50 Mb/s`**.
9. For the **Internet2 IPv4 Address** enter **`10.192.0.2`** and for the prefix enter **`30`**.
10. For the **AWS ASN** enter **`65001`**.
11. For the **BGP Authentication Key** enter **`some_secret`**.
12. Leave the **MTU** at 1500 for our lab.
13. _(Optional)_ For the **Remote Name** you can enter a unique name.
14. _(Optional)_ Enter some details for the **Notes**.
15. Set the **Authoring State** to **`Live`** and live dangerously!
![AWS Peering Connection](files/i2cc_aws_peering_2.png)

### Accept the Direct Connect Connection

From the AWS Console

1. Search for **Direct Connect**.
2. Select the new connection and pick **`View details`**.
3. On the next screen select **`Accept`** for the connection. _(This will take a few minutes)_

### Configure AWS Direct Connect Gateway with a Transit VIF

After the connection shows as available

1. Select **`Virtual Interfaces`** in the left side bar.
2. Select **`Create virtual interface`**.
3. Select **`Transit`** under the **Virtual interface type**.
4. Enter a Virtual interface name like **`tvif-1`**.
5. In the **Connection** pull down select the DX Connection we accepted above :arrow_up:.
6. In the **Direct Connect gateway** pull down select **`dxgw-i2lab`**.
7. Enter the **VLAN ID** you choose in the Insight Console for the next connection.
8. Enter **`55038`** for the **BGP ASN** (of the Internet2 Virtual Router).
9. Expand the **Additional settings** section.
10. Enter **`10.192.0.2/30`** for **Your router peer ip**.
11. Enter **`10.192.0.1/30`** for **Amazon router peer IP**.
12. Enter **`some_secret`** for the **BGP authentication key**.
13. Select **``Create virtual interface``** 

> [!NOTE]
> It will take a while for the peering state and BGP status to show available. There must be a health check that periodically updates this status.

![AWS DXGW Peering](files/aws_dxgw_peering.png)

### Associate the TGW with the DXGW

Now that you built the DX connection and the DXGW peering we need to associate the Transit Gateway to the Direct Connect Gateway.

1. Select **`Transit Gateway`** from the left sidebar.
2. Select the transit gateway and press **`View details`**.
3. Press the orange **`Associate Direct Connect gateway`** button.
4. Under Association settings/Direct Connect gateways select **`dxgw-i2lab`**.
5. Under **Allowed prefixes** enter **`10.192.0.0/16`**,**`10.192.1.0/24`**, and **`10.192.0.240/28`**.
6. Press the orange **`Associate Direct Connect gateway`** button.

> [!NOTE]
> This take a good long while, go ahead and move on to the next step and check back periodically.

### Attach the TGW with the i2lab VPC

The final step for the AWS connectivity in this lab is to attach the transit gateway with the `i2lab` vpc.

1. In the AWS Console search or navigate to the [VPC service](https://us-east-1.console.aws.amazon.com/vpcconsole/home?region=us-east-1#Home:).
2. In the left side bar find the Transit Gateway section and select `Transit gateway attachments`.
3. Press the orange **`Create transit gateway attachment`** button.
4. Enter **`tgw-att-1`** for the **Name tag**.
5. Select the transit gateway in the **Transit gateway ID** pull down.
6. Make sure the attachment type is set to **VPC**.
7. Under the VPC attachment section, select the VPC in the **VPC ID** pull down menu.
8. Under the Subnet IDs pull down select the subnet that include the name **`tgw-i2lab`**.
9. Press the orange **`Create transit gateway attachment`** button.
![Transit Gateway Attachment](files/tgw-att-1.png)

> [!NOTE]
> This take a good long while, go ahead and move on to the next step and check back periodically.

</details>

---

<details>
<summary><b>Azure: Building an ExpressRoute (ER) Connection</b></summary>

</details>

---

<details>
<summary><b>Google: Building a Partner Interconnect Connection</b></summary>

The process of building a Partner Interconnect starts in the [Google Cloud Console](https://console.cloud.google.com/hybrid/interconnects/).

Create a VLAN attachment for a Partner Interconnect connection. This step generates a pairing key that you use in Internet2 Insight Console. The pairing key is a unique key that lets a service provider identify and connect to your Virtual Private Cloud (VPC) network and associated Cloud Router. The Internet2 Console requires this key to complete the configuration of your VLAN attachment.

### Step 1: Create the Interconnect attachment

1. In the Google Cloud console, go to the Cloud Interconnect VLAN attachments tab.
2. Press **`Create VLAN attachments`**.
3. Select **`Partner Interconnect connection`**.
4. In the Encrypt interconnect section, select **`Set up unencrypted Interconnect`**.
5. Press **`Continue`**.
6. On the next screen select **`I already have a service provider`**.
7. Select **`Create a single VLAN`**.
8. For the Network and Region fields, select the **`i2lab-vpc`** network and the **`us-east4`** region.
9.  Under the Cloud Router pull down select **`cr-i2lab`**.
10. VLAN attachment name: Give the VLAN a name such as **`i2cc-vlan`** for the attachment.
11. IP stack type: Select **`IPv4 (single-stack)`**.
12. Use a Maximum transmission unit (MTU) for the attachment of **`1460`**. _(The VPC network that uses the attachment must have an MTU set to the same value. In addition, the on-premises virtual machine (VM) instances and routers must have their MTU set to the same value as well. If your network has the default MTU of 1460, then select 1460 as the VLAN attachment MTU.)_
13. To create the attachments, press **`Create`**. _(This action takes a few minutes to complete.)_
14. After creation is complete, **copy the pairing keys**. You will use these keys in the Internet2 Insight Console when you create the Google Partner Interconnect Connection.
15. Since we are requesting a Layer 3 connection with Internet2, you can pre-activate the attachment by selecting **`Enable`**. _(Activating attachments enables you to confirm that you're connecting to the expected service provider. Pre-activating attachments enables you to skip the activation step and lets the attachments start passing traffic immediately after your service provider completes their configuration.)_

### Optional Interconnect Steps

1. **(_Optional_)** You can optionally update your BGP sessions to use MD5 authentication. (I'd recommend skipping this for our lab environment, it'll be one less thing to configure or troubleshoot.)
2. **(_Optional_)** Bidirectional Forwarding Detection (BFD) for Cloud Router detects forwarding path outages such as link down events, allowing for more resilient hybrid networks. To update your BGP session to use BFD, see Configuring BFD.

### Step 2: Create the Internet2 Interconnect to Google Cloud

1. Navigate to your Virtual Network Space (VNS) from [Lab 1](lab1.md).
2. Find the Virtual Router you created in Lab 1.
3. Select **`Add Peering using Google Cloud Partner Interconnect`**.
![Google peering](files/i2cc_google_peering.png)
4. Enter your **Pairing Key** from Step 1 above.
5. Filter by region to select **`Equinix DC1-DC15, DC21 - Ashburn`**.
6. Select an Interfaces that has bandwidth available.
7. Enter a **VLAN ID** or use the **`Auto`** button to pick the next available VLAN ID _(Note the VLAN ID, you'll need the VLAN ID later)_.
8. For **Max Bandwidth** select **`50 Mb/s`**.
9. You can complete skip the IP Addressing for the Internet2 and Peer. _(This just gets overridden by Google.)_
10. For the **Peer ASN** enter **`16550`**.
11. _(Optional)_ For the **BGP Authentication Key** enter **`some_secret`**. _(If you set one in the Google Console you'll need to match it here or BGP won't come up.)_
12. _(Optional)_ For the **Remote Name** you can enter a unique name.
13. _(Optional)_ Enter some details for the **Notes**.
14. Set the **Authoring State** to **`Live`** and live dangerously!
![Google Peering Connection](files/i2cc_google_peering_2.png)

</details>

---

<details>
<summary><b>Oracle: Building a FastConnect Connection</b></summary>

</details>

---

**Nice work!**

At this point you've got the dedicated connectivity built to your cloud service providers. 

## :rocket: [I'm ready for Lab 6](lab6.md)
