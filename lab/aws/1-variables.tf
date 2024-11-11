#############################################################################################
# This file contains the variables/settings that will be used in building the AWS environment
#############################################################################################

# set the environment name
variable "env" {
  description = "Environment name"
  type        = string
  default     = "i2lab"
}

# set local host OS to `linux` or `windows`- used for ssh-config generation and other functions
variable "host_os" {
  description = "local host OS type"
  type        = string
  default     = "linux" // Use "linux" for unix based OS (including MacOS), use "windows" for windows host OS
}

# set AWS region
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1" //change to region you wish to test in
}

# set availability zone
variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
  default     = "us-east-1a" //change to match the region you are testing in
}

# set instance type
variable "instance_type" {
  description = "Type of AWS instance to deploy"
  type        = string
  default     = "t2.micro" # use t2.micro if you are "free tier eligible" otherwise t3.nano is less expensive
}
# set ssh key name and location
variable "public_key" {
  description = "Path to public key"
  type        = string
  default     = "~/.ssh/one-ring.pub" // one ring to rule them all! change to match your key name and location
}
variable "private_key" {
  description = "Path to private key"
  type        = string
  default     = "~/.ssh/one-ring" // change to match your key name and location
}

#####################
# VPC Variables
#####################

#set vpc cidr block
variable "vpc_cidr_block" {
  description = "CIDR block for Test VPC"
  type        = string
  default     = "10.192.0.0/16" //change if you need/want your VPC to have a different CIDR block
}

# set public subnet block
variable "public_subnet_cidr_block" {
  description = "CIDR block for Public Subnet"
  type        = string
  default     = "10.192.1.0/24" //change to give the test VPC a different CIDR block
}
# set tgw subnet block
variable "tgw_subnet_cidr_block" {
  description = "CIDR block for TGW Subnet"
  type        = string
  default     = "10.192.0.240/28" //change to give the test VPC a different CIDR block
}

##################################
# set variables for direct connect
##################################

/* 
variable "i2cr_bgp_asn" {
  description = "BGP autonomous system number from I2CC side of connection"
  type        = string
  default     = "55038"
}
variable "i2cr_vlan_id" {
  description = "BGP VLAN ID from the I2CR side of connection"
  type        = string
  //  default     = "1024" // change to match the vlan configured in I2CR
}
variable "primary_bgp_key" {
  description = "BGP auth key for primary virtual interface configured in I2CR"
  type        = string
  // default     = "yourkey" // change to match the key configured in I2CR
} 

variable "aws_primary_address" {
  description = "IP addressing on the AWS side of the connection"
  type        = string
  default     = "10.192.0.2/30" // change to match address configured on I2CR for AWS
}
variable "i2cr_primary_address" {
  description = "IP addressing on the I2CR side of connection"
  type        = string
  default     = "10.192.0.1/30" // change to match address configured on I2CR
}
*/

# Variables for budget alerts
variable "email" {
  description = "Please enter the email address to which budget notifications should be addressed."
  type        = string
  default     = "aws+alerts@yourdomain.com" # Change to your email address
}

variable "budget_amount" {
  description = "The total budget amount (USD) per month. Do not include dollar sign."
  type        = number
  default     = 10
}

variable "low_threshold" {
  description = "Enter a number for the low threshold budget notification."
  type        = number
  default     = 50
}

variable "high_threshold" {
  description = "Enter a number for the high threshold budget notification."
  type        = number
  default     = 80
}