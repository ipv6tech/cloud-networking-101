# Lab 4: Building Dedicated Connections to the Cloud

## Objective

Establish connectivity between the Internet2 Virtual Router that you build in Lab 1 with the CSP's of your choice.

Anti Best Practices we will follow include:

- Building the slowest speed connection possible
- Building non-redundant connections to the CSP's
- Not using IPv6 in this version of the workshop
- Using minimal security with wide open access
-
-
-

<br>

![image](files/multicloud.png)

---

## AWS: Building a Hosted Direct Connect (DX) Connection

1. In the Internet2 Insight Console...
2. Over in your AWS console navigate to the Direct Connect service and accept the new hosted connection.
3. Configure AWS DXGW with the VIF
4. Associate the TGW with the DXGW
5. Associate the TGW with the i2lab VPC.

---

## Azure: Building an ExpressRoute (ER) Connection

---

## Google: Building a Partner Interconnect Connection

---

## Oracle: Building a FastConnect Connection

---

## :rocket: [Take me to Lab 5](lab5.md)
