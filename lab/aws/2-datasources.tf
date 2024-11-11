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

# Grab latest Amazon Linux 2023 AMI ID for the region defined in variables (included in free-tier)
data "aws_ami" "amazon_linux2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
