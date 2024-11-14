variable "ENV" {
  description = "The environment name"
  type        = string
  default     = "i2lab"
}
variable "OCI_TENANCY" {
  description = "The OCID of your tenancy"
  type        = string
}
variable "OCI_USER" {
  description = "The OCID of your user"
  type        = string
}
variable "OCI_REGION" {
  description = "The region where the resources will be created"
  type        = string
  default     = "us-ashburn-1"
}
variable "OCI_COMPARTMENT" {
  description = "The OCID of the compartment where the resources will be created"
  type = string
}

variable "OCI_PRIVATE_KEY_FILE" {
  description = "The path to the api private key"
  type        = string
  default     = "~/.oci/oci_key.pem"
}

variable "OCI_FINGERPRINT" {
  description = "The fingerprint of the api public key"
  type        = string
}

# VM shape
variable "VM_SHAPE" {
  description = "The shape of the VM"
  type        = string
  default     = "VM.Standard.E4.Flex"
}
# VM OS
variable "OPERATING_SYSTEM" {
  description = "The operating system of the VM"
  type        = string
  default     = "Oracle Linux"
}
# VM Public ssh key
variable "PUBLIC_KEY" {
  type    = string
  default = "~/.ssh/one-ring.pub"
}
# VM Private ssh key
variable "PRIVATE_KEY" {
  type    = string
  default = "~/.ssh/one-ring"
}
#VM OS version
variable "OPERATING_SYSTEM_VERSION" {
  description = "The version of the operating system"
  type        = string
  default     = "9.4"
}

# CIDR blocks
variable "VCN_CIDR" {
  description = "The CIDR block for the i2lab VCN"
  type        = string
  default     = "10.216.0.0/16"
}
variable "SUBNET_CIDR" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.216.1.0/24"
}

# Ports allowed into the i2lab instance
variable "SERVICE_PORTS" {
  default = [80, 443, 22]
}