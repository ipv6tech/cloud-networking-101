# Variables (Customize these as needed)
variable "ENV" {
  type    = string
}
variable "GC_PROJECT_ID" {
  type    = string
}
variable "GC_REGION" {
  type    = string
  default = "us-east4"
}
variable "GC_ZONE" {
  type    = string
  default = "us-east4-a"
}
variable "MACHINE_TYPE" {
  type    = string
  default = "f1-micro"
}
variable "IMAGE" {
  type    = string
  default = "debian-cloud/debian-12"
}
variable "SUBNET_IP_CIDR_RANGE" {
  type    = string
  default = "10.208.1.0/24"
}
variable "GC_VPC_CIDR" {
  type    = string
  default = "10.208.0.0/16"
}
variable "PUBLIC_KEY" {
  type    = string
  default = "~/.ssh/one-ring.pub"
}
variable "PRIVATE_KEY" {
  type    = string
  default = "~/.ssh/one-ring"
}
variable "SSH_USER" {
  type    = string
  default = "admin"
}
variable "CR_ASN" {
  type    = number
  default = "16550"
}
variable "I2CC_ASN" {
  type    = number
  default = "55038"
}
variable "CR_PEER_IP" {
  type    = string
  default = "10.208.0.1/30"
}