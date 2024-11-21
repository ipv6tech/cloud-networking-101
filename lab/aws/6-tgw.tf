# create transit gateway
resource "aws_ec2_transit_gateway" "tgw" {
  description                     = "TGW for ${var.ENV} environment"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  auto_accept_shared_attachments  = "enable"
  amazon_side_asn                 = "65010"
  tags = {
    Name        = "tgw_${var.ENV}"
    environment = "${var.ENV}"
  }
}

# create transit gateway attachment to i2lab VPC
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att" {
  subnet_ids         = [aws_subnet.tgw.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.i2lab.id
  tags = {
    Name        = "tgw-att_${var.ENV}"
    environment = "${var.ENV}"
  }
}

/* This takes a while, and I think we should do this as part of the lab setup, not as part of the Terraform script
# Create an association between DXGW and TGW
resource "aws_dx_gateway_association" "i2lab-dxgw-tgw" {
  dx_gateway_id         = aws_dx_gateway.dxgw-i2lab.id
  associated_gateway_id = aws_ec2_transit_gateway.tgw-i2lab.id
  allowed_prefixes = [
    var.VPC_CIDR_BLOCK
  ]
}
*/

// Not sure if this is needed or not
/*
# create route table for TGW
resource "aws_ec2_transit_gateway_route_table" "i2lab" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  tags = {
    Name        = "tgw_rt_${var.ENV}"
    environment = "${var.ENV}"
  }
}
*/

/* Code below here is a first draft, untested and may not work as expected
these steps are completed manually as part of the lab. */

/* # create transit virtual interface
resource "aws_dx_hosted_transit_virtual_interface" "primary-vif" {
  connection_id    = var.i2cc_primary_connection_id
  name             = "transit_vif-i2lab"
  vlan             = var.i2cr_vlan_id
  address_family   = "ipv4"
  bgp_asn          = var.i2cr_bgp_asn
  amazon_address   = var.aws_primary_address
  customer_address = var.i2cr_primary_address
  owner_account_id = env("AWS_ACCOUNT_ID")
  bgp_auth_key     = var.primary_bgp_key
} */

/* #accept hosted connection
resource "aws_dx_hosted_transit_virtual_interface_accepter" "accepter" {
  virtual_interface_id = aws_dx_hosted_transit_virtual_interface.primary-vif.id
  dx_gateway_id        = aws_dx_gateway.dxgw-i2lab.id
} */