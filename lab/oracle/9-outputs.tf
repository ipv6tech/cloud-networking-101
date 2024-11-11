# output public ip for i2lab instance
output "i2lab_public_ip" {
  value = oci_core_instance.i2lab.public_ip
}
# output private ip for i2lab instance
output "i2lab_private_ip" {
  value = oci_core_instance.i2lab.private_ip
}
# output ssh command to connect to i2lab instance
output "ssh_command" {
  value = "ssh -i ${var.private_key} admin@${oci_core_instance.i2lab.public_ip}"
}
#output the availability domains
output "availability_domains" {
  value = data.oci_identity_availability_domains.ADs.availability_domains[*].name
}