#public subnet
resource "google_compute_subnetwork" "public" {
    name            =  "public"
    ip_cidr_range   =  var.subnetwork_public
#    region          =  var.region
    network         =  google_compute_network.vpc.self_link

}

#private subnet
resource "google_compute_subnetwork" "private" {
    name            =  "private"
    ip_cidr_range   =  var.subnetwork_private
#    region          =  var.region
    network         =  google_compute_network.vpc.self_link
    
}