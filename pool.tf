resource "libvirt_pool" "libvirt_pool" {
  name = "libvirtpool"
  type = "dir"
  path = "/libvirtpool"
}
