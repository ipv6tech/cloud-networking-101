# Cloud Router for NAT and Partner Interconnect
resource "google_compute_router" "default" {
  project = var.gc_project_id
  name    = "cr-${var.env}"
  region  = var.gc_region
  network = google_compute_network.main.id
  bgp {
    asn = var.cr_asn
  }
}

/* # Cloud NAT Configuration
resource "google_compute_router_nat" "default" {
  project = var.project_id
  router  = google_compute_router.default.name
  name    = "nat-gw"
  region  = var.region

  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  subnetwork {
    name                    = google_compute_subnetwork.public.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
*/

/* build the peering to I2CC with code
resource "google_compute_router_peer" "i2cc" {
  name                      = "i2cc"
  router                    = "cr-${var.env}"
  region                    = var.region
  peer_ip_address           = var.cr_peer_ip
  peer_asn                  = var.i2cc_asn
  advertised_route_priority = 100
  interface                 = "interface-1"

  bfd {
    min_receive_interval        = 1000
    min_transmit_interval       = 1000
    multiplier                  = 5
    session_initialization_mode = "ACTIVE"
  }
}*/