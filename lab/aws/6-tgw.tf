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

/*Comment this section out if you wish to manually do Step 5 under the AWS provisioning in Lab 5*/
# create transit gateway attachment to the tgw-subnet in i2lab VPC
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw-att" {
  subnet_ids         = [aws_subnet.tgw.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.i2lab.id
  tags = {
    Name        = "tgw-att_${var.ENV}"
    environment = "${var.ENV}"
  }
}

/* This takes a while, plus I think we should do this as part of the lab setup, not as part of the Terraform script
# Create an association between DXGW and TGW
resource "aws_dx_gateway_association" "i2lab-dxgw-tgw" {
  dx_gateway_id         = aws_dx_gateway.dxgw-i2lab.id
  associated_gateway_id = aws_ec2_transit_gateway.tgw-i2lab.id
  allowed_prefixes = [
    var.VPC_CIDR_BLOCK
  ]
}
*/