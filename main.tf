terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
            version = "~>3.0"
        }
    }

}

provider "google" {

#  credentials = file("test-key.json")
  project = var.project
  region = var.region
  zone = var.zone


  user_project_override = "true"
}