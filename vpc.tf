#Main VPC
resource "google_compute_network" "vpc" {
  name = "${var.prefix_name}-vpc"
  auto_create_subnetworks = false  
}

# Cloud Router
resource "google_compute_router" "router" {
  name              = "router"
  network           = google_compute_network.vpc.self_link
  bgp {
    asn             = 64514
    advertise_mode  = "CUSTOM"
  }
}

# NAT Gateway

resource "google_compute_router_nat" "nat" {
    name                                = "nat"
    router                              = google_compute_router.router.name
    region                              = google_compute_router.router.region
    nat_ip_allocate_option              = "AUTO_ONLY"
    source_subnetwork_ip_ranges_to_nat  = "LIST_OF_SUBNETWORKS"

    subnetwork {
      name = "private"
      source_ip_ranges_to_nat = [ "ALL_IP_RANGES" ]
    }
}