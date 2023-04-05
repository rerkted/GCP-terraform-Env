#Instance (VM)
resource "google_compute_instance_template" "instance" {
    name = "instance"
    metadata_startup_script = file ("startup.sh")
    machine_type = "ec2-micro"
    can_ip_forward = false
    project = var.project

   # tags = [ "instance", "autoscaling", "allow-lb-service" ]
    disk {
      source_image  = google_compute_network.vpc.name
    }

   #Instance connected to the VPC 
  network_interface {
    network = google_compute_network.vpc.self_link
    access_config {
    }
  }
    metadata = {
      "key" = "value"
    }

    service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }
}

resource "google_compute_target_pool" "pool" {
    name    = "pool"
    project = var.project
    region  = var.region
  
}

resource "google_compute_instance_group_manager" "igm" {
    name = "igm"
    zone = var.zone
    project = var.project
    version {
      instance_template = google_compute_instance_template.instance.self_link
      name = "primary"
    }
    
    target_pools = [google_compute_target_pool.pool.self_link]
    base_instance_name = "${var.prefix_name}-pool"
}

data "google_compute_image" "debian" {
  family  = "debian-11"
  project = "debian-cloud"
}