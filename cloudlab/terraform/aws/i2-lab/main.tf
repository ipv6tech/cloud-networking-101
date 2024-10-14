/* This terraform plan creates a AWS environment for the hands on lab portion
of a Internet2 Cloud Networking Workshop. The lab environment creates the following:
- VPC with a public subnet and a private subnet, an Internet Gateway, routing tables, and security groups.
- An EC2 instance in the private subnet.
- Direct Connect Gateway and Transit Gateway for connectivity to Internet2 Cloud Services
- Internet Gateway, security group, and an EC2 instance.
- Creates attachements between the DXGW, Transit Gateway, and VPC.

Do not forget to do a `terraform destroy` after you are done with the lab to clean up resources and keep costs to a minimum.
*/
