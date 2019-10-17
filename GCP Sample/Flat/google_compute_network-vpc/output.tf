output "my_network" {
  value = "${google_compute_network.vpc.self_link}"
}
