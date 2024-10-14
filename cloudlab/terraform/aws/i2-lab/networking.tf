# Create direct connect gateway
resource "aws_dx_gateway" "dxgw-i2-lab" {
  name            = "dxgw-${var.env}"
  amazon_side_asn = "65001"
}

# create transit gateway
resource "aws_ec2_transit_gateway" "tgw-i2-lab" {
  description                     = "Transit Gateway for lab Env with I2CC"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  auto_accept_shared_attachments  = "enable"
  amazon_side_asn                 = "65010"
  tags = {
    Name        = "tgw-${var.env}"
    environment = "${var.env}"
  }
}

# create route table for TGW
resource "aws_ec2_transit_gateway_route_table" "tgw-rt-i2-lab" {
  transit_gateway_id = aws_ec2_transit_gateway.tgw-i2-lab.id
}

# create default route in the TGW routing table
resource "aws_ec2_transit_gateway_route" "tgw-default_route" {
  destination_cidr_block         = "0.0.0.0/0"
//  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.att-i2-lab.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.tgw-i2-lab.id
}

/* # create attachement between TGW and VPC
resource "aws_ec2_transit_gateway_vpc_attachment" "att-i2-lab" {
  subnet_ids         = [aws_subnet.tgw-subnet-i2-lab.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw-i2-lab.id
  vpc_id             = aws_vpc.i2-lab.id
  tags = {
    Name        = "att-${var.env}"
    environment = "${var.env}"
  }
} */

/* # Create an association between DXGW and TGW
resource "aws_dx_gateway_association" "i2-lab" {
  dx_gateway_id         = aws_dx_gateway.dxgw-i2-lab.id
  associated_gateway_id = aws_ec2_transit_gateway.tgw-i2-lab.id
  allowed_prefixes = [
    var.vpc_cidr_block
  ]
} */

/* # create transit virtual interface
resource "aws_dx_hosted_transit_virtual_interface" "primary-vif" {
  connection_id    = var.i2cc_primary_connection_id
  name             = "transit_vif-i2-lab"
  vlan             = var.i2cr_vlan_id
  address_family   = "ipv4"
  bgp_asn          = var.i2cr_bgp_asn
  amazon_address   = var.aws_primary_address
  customer_address = var.i2cr_primary_address
  owner_account_id = var.aws_account_id
  bgp_auth_key     = var.primary_bgp_key
} */

/* #accept hosted connection
resource "aws_dx_hosted_transit_virtual_interface_accepter" "accepter" {
  virtual_interface_id = aws_dx_hosted_transit_virtual_interface.primary-vif.id
  dx_gateway_id        = aws_dx_gateway.dxgw-i2-lab.id
} */
