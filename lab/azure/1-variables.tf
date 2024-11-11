/*
variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
  default        = var.arm_subscription_id
}
*/

// var env
variable "env" {
  description = "The environment name"
  default     = "i2lab"
  type        = string
}

# set Azure location
variable "location" {
  description = "Azure Location"
  type        = string
  default     = "eastus2" //change to location you wish to deploy in
}

# set ssh key name and location
variable "public_key" {
  description = "Path to public key"
  type        = string
  default     = "~/.ssh/one-ring.pub"
}
variable "private_key" {
  description = "Path to private key"
  type        = string
  default     = "~/.ssh/one-ring"
}

variable "admin_password" {
  description = "The password for the admin user"
  type        = string
  default     = "i2lab-Passw0rd9234!" // change me
}

#set vnet cidr block
variable "vnet_cidr_block" {
  description = "CIDR block for Test VNET"
  type        = string
  default     = "10.200.0.0/16" //change if you need/want your vnet to have a different CIDR block
}

# set public subnet block
variable "public_subnet_cidr_block" {
  description = "CIDR block for Public Subnet"
  type        = string
  default     = "10.200.1.0/24" //change to give the lab vnet a different CIDR block
}

# set vng subnet block
variable "vng_subnet_cidr_block" {
  description = "CIDR block for vng Subnet"
  type        = string
  default     = "10.200.0.240/28" //change to give the lab vnet a different CIDR block
}

# Azure budget for each month
variable "budget_amount" {
  description = "The total budget amount (USD) per month. Do not include dollar sign."
  type        = number
  default     = 10
}
# email address for budget notifications
variable "email" {
  description = "Please enter the email address to which budget notifications should be addressed."
  type        = string
  default     = "alerts@yourmail.com"
}
variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
}