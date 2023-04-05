# Firewall
resource "google_compute_firewall" "allow-http" {
  name        = "firewall-http"
  network     = google_compute_network.vpc.self_link
  description = "Creates firewall rule 80"

  allow {
    protocol  = "http"
    ports     = ["80"]
  }
}
resource "google_compute_firewall" "allow-https" {
  name        = "firewall-https"
  network     = google_compute_network.vpc.self_link
  description = "Creates firewall rule 443"
  allow {
    protocol  = "https"
    ports     = ["443"]
  }
}
  resource "google_compute_firewall" "allow-internal" {
  name        = "firewall-allow-internal"
  network     = google_compute_network.vpc.self_link
  description = "Creates firewall rule subnetwork ranges"

allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  source_ranges = [
    "${var.subnetwork_public}",
    "${var.subnetwork_private}",
  ]
  }
##  deny {

#  direction = "EGRESS"
#  destination_ranges = ["0.0.0.0/0"]
#
/*  deny {
    protocol  = "all"
    source_ranges        = ["0.0.0.0/0"]
  }
  */