variable "project" {
    default = "tevora-cloud-security"
}

variable "region" {
    default = "us-central1"
}

variable "zone" {
    default = "us-central1-c"
}

variable "cidrs" {
  type = list
  default = []
}

variable "subnetwork_public" {
  default = "10.26.1.0/24"
}

variable "subnetwork_private" {
  default = "10.26.2.0/24"
}


variable "prefix_name" {
    default = "Tevora"  
}

## enable API
variable "gcp_service_list" {
  description ="The list of apis necessary for the project"
  type = list(string)
  default = [
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "storage.googleapis.com",
    "serviceusage.googleapis.com",
    "compute.googleapis.com"
  ]
}