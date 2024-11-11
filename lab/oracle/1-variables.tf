variable "env"{
  description = "The environment name"
  type        = string
  default     = "i2lab"
}
variable "tenancy_ocid" {
  description = "The OCID of your tenancy"
  type        = string
  default     = "ocid1.tenancy.oc1..aaaaaaaa3j"
}
variable "user_ocid" {
  description = "The OCID of your user"
  type        = string
  default     = "ocid1.user.oc1..aaaaaaaa3j"
}
variable "region" {
  description = "The region where the resources will be created"
  type        = string
  default     = "us-ashburn-1"
}
variable "compartment_ocid" {
  description = "The OCID of the compartment where the resources will be created"
  type = string
  default = "ocid1.compartment.oc1..aaaaaaaa3j"
}

variable "api_private_key_file" {
  description = "The path to the api private key"
  type        = string
  default     = "~/.oci/oci_key.pem"
}

variable "api_public_key_fingerprint" {
  description = "The fingerprint of the api public key"
  type        = string
  default     = "aa:bb:cc:dd:ee:ff:gg:hh:ii:jj:kk:ll:mm:nn:oo:pp"
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