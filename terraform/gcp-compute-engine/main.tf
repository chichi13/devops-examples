terraform {
  required_providers {
    google = ">= 4.48.0"
  }
}

provider "google" {
  project = var.project
  credentials = file(var.credentials_path)
  region = var.region
  zone = var.zone
}

# [START compute_network]
resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  mtu                     = var.network_mtu
}

resource "google_compute_subnetwork" "default" {
  name          = var.subnetwork_name
  ip_cidr_range = var.subnetwork_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}
# [END compute_network]

# [START compute_instance]
# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = var.machine_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.machine_tags

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.default.id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
# [END compute_instance]