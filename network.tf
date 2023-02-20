resource "libvirt_network" "default_network" {
  name      = "default_network"
  mode      = "nat"
  domain    = "libvirt.test.local"
  addresses = ["192.168.123.0/24"]
  dns {
    enabled    = true
    local_only = true
  }
  dhcp {
    enabled = true
  }
}
