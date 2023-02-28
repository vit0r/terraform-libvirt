resource "libvirt_volume" "ubuntu2204_amd64" {
  count  = var.ubuntu2204_domains_count > 0 ? 1 : 0
  name   = "ubuntu2204-amd64.qcow2"
  format = "qcow2"
  source = local.ubuntu2204
  pool   = var.default_pool_name
}

resource "libvirt_volume" "ubuntu2004_amd64" {
  count  = var.ubuntu2004_domains_count > 0 ? 1 : 0
  name   = "ubuntu2004-amd64.qcow2"
  format = "qcow2"
  source = local.ubuntu2004
  pool   = var.default_pool_name
}

resource "libvirt_volume" "centos9_amd64" {
  count  = var.centos_domains_count > 0 ? 1 : 0
  name   = "centos9-amd64.qcow2"
  format = "qcow2"
  source = local.centos9
  pool   = var.default_pool_name
}
