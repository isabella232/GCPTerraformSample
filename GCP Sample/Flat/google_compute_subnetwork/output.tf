output "my_subnet" {
  value = "${google_compute_subnetwork.subnet.*.self_link}"
}
