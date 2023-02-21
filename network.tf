resource "libvirt_network" "network" {
  name      = var.libvirt_network_name
  mode      = var.libvirt_network_mode
  domain    = var.libvirt_network_domain
  addresses = [var.libvirt_network_cidr]
  dns {
    enabled    = true
    local_only = true
  }
  dhcp {
    enabled = false
  }
}
