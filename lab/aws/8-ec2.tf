
##############################
# Create i2lab instance
##############################

resource "aws_instance" "i2lab" {
  ami                         = data.aws_ami.debian12_linux.id //set to use lalab Debian 12 Linux from datasource.tf
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.sg_i2lab.id]
  key_name                    = aws_key_pair.one-ring.id # using for labing purposes until we get dynamic keys working
  user_data                   = file("files/userdata.tpl")
  provisioner "local-exec" {
    command = templatefile("files/${var.host_os}-ssh-config.tpl", {
      host         = "${var.env}-aws"
      hostname     = self.public_ip
      user         = "admin" // change to ec2 for amazon linux ami
      identityfile = var.private_key
    })
  }
  tags = {
    Name        = "${var.env}"
    environment = "${var.env}"
  }
}

# ssh key for ${var.env} instance
resource "aws_key_pair" "one-ring" {
  key_name   = "one-ring"
  public_key = file(var.public_key)
}

########################################################
# Create security Groups with ingress and egress rules
########################################################

# create sg_i2lab
resource "aws_security_group" "sg_i2lab" {
  name        = "sg_${var.env}"
  description = "allow ssh & icmp from anywhere"
  vpc_id      = aws_vpc.i2lab.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8 # the ICMP type number for 'Echo'
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "sg-${var.env}"
    environment = "${var.env}"
  }
}