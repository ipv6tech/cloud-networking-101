# Internet Gateway for Public Subnet
resource "aws_internet_gateway" "igw_i2lab" {
  vpc_id = aws_vpc.i2lab.id
  tags = {
    Name        = "igw_${var.env}"
    environment = "${var.env}"
  }
}