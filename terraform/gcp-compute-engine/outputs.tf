output "google_compute_instance" {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

#❯ tf show
# google_compute_instance.default:
# resource "google_compute_instance" "default" {
#     network_interface {
#         access_config {
#             nat_ip       = "X.X.X.X"
#         }
#     }
# }