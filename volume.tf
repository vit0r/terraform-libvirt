resource "libvirt_volume" "ubuntu_2204_amd64" {
  name   = "ubuntu-22.04-amd64.qcow2"
  format = "qcow2"
  source = local.ubuntu_default_source_url
  pool   = var.default_pool_name
}
