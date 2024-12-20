# Firewall rule to allow SSH to the VM in the private subnet
resource "google_compute_firewall" "allow_from_internet" {
  project = var.GC_PROJECT_ID
  name    = "allow-from-internet"
  network = google_compute_network.main.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
}

# Small VM Instance in the Private Subnet
resource "google_compute_instance" "vm" {
  project      = var.GC_PROJECT_ID
  name         = "${var.ENV}-google"
  zone         = var.GC_ZONE
  machine_type = var.MACHINE_TYPE
  network_interface {
    subnetwork = google_compute_subnetwork.public.id
    access_config {
      network_tier = "STANDARD"
    }
  }
  //metadata_startup_script = file("files/startup.sh")
  metadata = {
    ssh-keys = "${var.SSH_USER}:${file(var.PUBLIC_KEY)}"
  }
  boot_disk {
    initialize_params {
      image = var.IMAGE
    }
  }
  provisioner "local-exec" {
    command = templatefile("files/linux-ssh-config.tpl", {
      host         = "google"
      hostname     = self.network_interface[0].access_config[0].nat_ip
      user         = "admin"
      identityfile = var.PRIVATE_KEY
    })
  }
}