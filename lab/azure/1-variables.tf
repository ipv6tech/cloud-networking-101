
# Set Environment variable
variable "ENV" {
  description = "The ENVironment name"
  default     = "i2lab"
  type        = string
}

# set Azure location
variable "AZ_LOCATION" {
  description = "Azure Location"
  type        = string
  default     = "eastus2" //change to location you wish to deploy in
}

# set ssh key name and location
variable "PUBLIC_KEY" {
  description = "Path to public key"
  type        = string
  default     = "~/.ssh/one-ring.pub"
}
variable "PRIVATE_KEY" {
  description = "Path to private key"
  type        = string
  default     = "~/.ssh/one-ring"
}

variable "AZ_ADMIN_PASSWORD" {
  description = "The password for the admin user"
  type        = string
  default     = "i2lab-Passw0rd9234!" // change me
}

#set vnet cidr block
variable "VNET_CIDR_BLOCK" {
  description = "CIDR block for Test VNET"
  type        = string
  default     = "10.200.0.0/16" //change if you need/want your vnet to have a different CIDR block
}

# set public subnet block
variable "PUBLIC_SUBNET_CIDR_BLOCK" {
  description = "CIDR block for Public Subnet"
  type        = string
  default     = "10.200.1.0/24" //change to give the lab vnet a different CIDR block
}

# set vng subnet block
variable "VNG_SUBNET_CIDR_BLOCK" {
  description = "CIDR block for vng Subnet"
  type        = string
  default     = "10.200.0.224/27" //change to give the lab vnet a different CIDR block
}

# Azure budget for each month
variable "BUDGET_AMOUNT" {
  description = "The total budget amount (USD) per month. Do not include dollar sign."
  type        = number
  default     = 10
}
# EMAIL address for budget notifications
variable "EMAIL" {
  description = "Please enter the EMAIL address to which budget notifications should be addressed."
  type        = string
  default     = "alerts@yourmail.com"
}
variable "AZ_SUBSCRIPTION_ID" {
  description = "The Azure subscription ID"
  type        = string
}