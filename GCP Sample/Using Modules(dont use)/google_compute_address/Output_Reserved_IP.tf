#output "my_reserve_int_ip" {
#  value = "${google_compute_address.reserve_int_ip.self_link}"
#}

#output "my_reserve_int_ip_addr" {
#  value = "${google_compute_address.reserve_int_ip.address}"
#}

output "my_reserve_ext_ip" {
  value = "${google_compute_address.reserve_ext_ip.self_link}"
}

output "my_static_ip" {
  value = "${google_compute_address.reserve_ext_ip.address}"
}

output "my_glob_ip" {
  value = "${google_compute_global_address.reserve_glob_ip.address}"
}
