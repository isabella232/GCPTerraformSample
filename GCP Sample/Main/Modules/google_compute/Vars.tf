variable project {}

variable instance_name {}
variable machine_type {
    default = "n1-standard-2"
}
variable zone {
}
variable network_tags {
    type = "list"
    default = []
}
variable boot_disk_type {
}
variable subnetwork {  
}
variable metadata {
    type    = "map"
    default = {}
}

variable boot_disk_image {
    default = "debian-cloud/debian-8"
}
variable boot_disk_size {
    default = "30"
}
variable additional_disk {
    default = "no"
}
variable second_disk_image {}
variable second_disk_size {}
variable second_disk_type {
}
variable init_script {}