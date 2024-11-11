# Create direct connect gateway
resource "aws_dx_gateway" "dxgw-i2lab" {
  name            = "dxgw-${var.env}"
  amazon_side_asn = "65001"
}