# VPC for lab environment named i2lab
resource "aws_vpc" "i2lab" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "vpc-${var.env}"
    environment = "${var.env}"
  }
}

# Public subnet for VPC
resource "aws_subnet" "public" {
  cidr_block = var.public_subnet_cidr_block
  vpc_id     = aws_vpc.i2lab.id
  availability_zone = var.availability_zone
  tags = {
    Name        = "public-${var.env}"
    environment = "${var.env}"
  }
}

# TGW subnet for attachments
resource "aws_subnet" "tgw" {
  cidr_block = var.tgw_subnet_cidr_block
  vpc_id     = aws_vpc.i2lab.id
  availability_zone = var.availability_zone
  tags = {
    Name        = "tgw-${var.env}"
    environment = "${var.env}"
  }
}

# Route table for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.i2lab.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_i2lab.id
  }
  tags = {
    Name        = "public-${var.env}"
    environment = "${var.env}"
  }
}

# Route table public subnet association
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
