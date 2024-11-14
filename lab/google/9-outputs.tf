output "vm_ip" {
  value = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip
}
# output ssh command to connect to i2lab instance
output "ssh_command" {
  value = "ssh -i ${var.PRIVATE_KEY} admin@${google_compute_instance.vm.network_interface.0.access_config.0.nat_ip}"
}