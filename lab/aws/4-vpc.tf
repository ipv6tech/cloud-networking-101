# VPC for lab environment named i2lab
resource "aws_vpc" "i2lab" {
  cidr_block           = var.VPC_CIDR_BLOCK
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "vpc-${var.ENV}"
    environment = "${var.ENV}"
  }
}

# Public subnet for VPC
resource "aws_subnet" "public" {
  cidr_block = var.PUBLIC_SUBNET_CIDR_BLOCK
  vpc_id     = aws_vpc.i2lab.id
  availability_zone = var.AVAILABILITY_ZONE
  tags = {
    Name        = "public-${var.ENV}"
    environment = "${var.ENV}"
  }
}

# TGW subnet for attachments
resource "aws_subnet" "tgw" {
  cidr_block = var.TGW_SUBNET_CIDR_BLOCK
  vpc_id     = aws_vpc.i2lab.id
  availability_zone = var.AVAILABILITY_ZONE
  tags = {
    Name        = "tgw-${var.ENV}"
    environment = "${var.ENV}"
  }
}

# Route table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.i2lab.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_i2lab.id
  }
  route {
    cidr_block = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }
  tags = {
    Name        = "public-${var.ENV}"
    environment = "${var.ENV}"
  }
}

# Subnet associations with public route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "tgw" {
  subnet_id      = aws_subnet.tgw.id
  route_table_id = aws_route_table.public.id
}
