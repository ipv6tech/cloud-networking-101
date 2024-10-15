# VPC for lab environment named i2-lab
resource "aws_vpc" "i2-lab" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name        = "vpc-${var.env}"
    environment = "${var.env}"
  }
}

# Public subnet for VPC
resource "aws_subnet" "pub-subnet-i2-lab" {
  cidr_block = var.public_subnet_cidr_block
  vpc_id     = aws_vpc.i2-lab.id
  tags = {
    Name        = "pub-subnet-${var.env}"
    environment = "${var.env}"
  }
}

# TGW subnet for attachments
resource "aws_subnet" "tgw-subnet-i2-lab" {
  cidr_block = var.tgw_subnet_cidr_block
  vpc_id     = aws_vpc.i2-lab.id
  tags = {
    Name        = "tgw-subnet-${var.env}"
    environment = "${var.env}"
  }
}

# Route table for public subnet
resource "aws_route_table" "pub-rt-i2-lab" {
  vpc_id = aws_vpc.i2-lab.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-i2-lab.id
  }
  tags = {
    Name        = "pub-rt-${var.env}"
    environment = "${var.env}"
  }
}

# Route table public subnet association
resource "aws_route_table_association" "assoc-pub-subnet-i2-lab" {
  subnet_id      = aws_subnet.pub-subnet-i2-lab.id
  route_table_id = aws_route_table.pub-rt-i2-lab.id
}

# Internet Gateway for Public Subnet
resource "aws_internet_gateway" "igw-i2-lab" {
  vpc_id = aws_vpc.i2-lab.id
  tags = {
    Name        = "igw-${var.env}"
    environment = "${var.env}"
  }
}