variable "project" {}
variable "credentials_path" {
  type = string
  default = "~/.config/gcloud/terraform-gcp.json"
}
variable "region" {
  type = string
  default = "europe-north1"
}
variable "network_name" {
  type = string
  default = "my-custom-mode-network"
}
variable "network_mtu" {
  type = number
  default = 1460
}
variable "auto_create_subnetworks" {
  type = bool
  default = false
}
variable "subnetwork_name" {
  type = string
  default = "my-custom-subnet"
}
variable "subnetwork_cidr" {
  type = string
  default = "10.0.1.0/24"
}
variable "zone" {
  type = string
  default = "europe-north1-a"
}
variable "machine_name" {
  type = string
  nullable = false
}
variable "machine_type" {
  type = string
  default = "f1-micro"
}
variable "machine_tags" {
  type = list
  default = []
}
variable "boot_disk_image" {
  type = string
  default = "debian-cloud/debian-11"
}