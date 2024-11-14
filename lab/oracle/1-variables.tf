variable "env"{
  description = "The environment name"
  type        = string
  default     = "i2lab"
}
variable "oci_tenancy" {
  description = "The OCID of your tenancy"
  type        = string
}
variable "oci_user" {
  description = "The OCID of your user"
  type        = string
}
variable "oci_region" {
  description = "The region where the resources will be created"
  type        = string
  default     = "us-ashburn-1"
}
variable "oci_compartment" {
  description = "The OCID of the compartment where the resources will be created"
  type = string
}

variable "oci_private_key_file" {
  description = "The path to the api private key"
  type        = string
  default     = "~/.oci/oci_key.pem"
}

variable "oci_fingerprint" {
  description = "The fingerprint of the api public key"
  type        = string
}

# VM shape
variable "vm_shape" {
  description = "The shape of the VM"
  type        = string
  default     = "VM.Standard.E4.Flex"
}
# VM OS
variable "operating_system" {
  description = "The operating system of the VM"
  type        = string
  default     = "Oracle Linux"
}
# VM Public ssh key
variable "public_key" {
  type    = string
  default = "~/.ssh/one-ring.pub"
}
# VM Private ssh key
variable "private_key" {
  type    = string
  default = "~/.ssh/one-ring"
}
#VM OS version
variable "operating_system_version" {
  description = "The version of the operating system"
  type        = string
  default     = "9.4"
}

# CIDR blocks
variable "vcn_cidr" {
  description = "The CIDR block for the i2lab VCN"
  type        = string
  default     = "10.216.0.0/16"
}
variable "subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.216.1.0/24"
}

# Ports allowed into the i2lab instance
variable "service_ports" {
  default = [80, 443, 22]
}