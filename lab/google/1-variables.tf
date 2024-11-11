# Variables (Customize these as needed)
variable "env" {
  type    = string
  default = "i2lab"
}
variable "project_id" {
  type    = string
  default = "i2lab-440216"
}
variable "region" {
  type    = string
  default = "us-east4"
}
variable "zone" {
  type    = string
  default = "us-east4-a"
}
variable "machine_type" {
  type    = string
  default = "f1-micro"
}
variable "image" {
  type    = string
  default = "debian-cloud/debian-12"
}
variable "subnet_ip_cidr_range" {
  type    = string
  default = "10.208.1.0/24"
}
/*variable "vpc_cidr" {
  type    = string
  default = "10.208.0.0/16"
}*/
variable "public_key" {
  type    = string
  default = "~/.ssh/one-ring.pub"
}
variable "private_key" {
  type    = string
  default = "~/.ssh/one-ring"
}
variable "ssh_user" {
  type    = string
  default = "admin"
}
variable "cr_asn" {
  type    = number
  default = "16550"
}
variable "i2cc_asn" {
  type    = number
  default = "55038"
}
variable "cr_peer_ip" {
  type    = string
  default = "10.208.0.1/30"
}