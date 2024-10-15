# EC2 Instance options

# Grab latest Debian 12 Linux AMI ID for the region defined in the variable (included in free-tier)
data "aws_ami" "debian12_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }
}

# Grab latest Ubuntu 22.04 Linux AMI ID for the region defined in the variable
data "aws_ami" "ubuntu2204_linux" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Grab latest Amazon Linux 2023 AMI ID for the region defined in variables (included in free-tier)
data "aws_ami" "amazon_linux2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
