# Firewall rule to allow SSH to the VM in the private subnet
resource "google_compute_firewall" "allow_from_internet" {
  project = var.gc_project_id
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
  project      = var.gc_project_id
  name         = "${var.env}-gcloud"
  zone         = var.gc_zone
  machine_type = var.machine_type
  network_interface {
    subnetwork = google_compute_subnetwork.public.id
    access_config {
      network_tier = "STANDARD"
    }
  }
  //metadata_startup_script = file("files/startup.sh")
  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.public_key)}"
  }
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  provisioner "local-exec" {
    command = templatefile("files/linux-ssh-config.tpl", {
      host         = "${var.env}-gcloud"
      hostname     = self.network_interface[0].access_config[0].nat_ip
      user         = "admin"
      identityfile = var.private_key
    })
  }
}