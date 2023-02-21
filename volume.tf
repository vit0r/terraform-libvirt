resource "libvirt_volume" "ubuntu2204_amd64" {
  name   = "ubuntu2204-amd64.qcow2"
  format = "qcow2"
  source = local.ubuntu2204_source_url
  pool   = var.default_pool_name
}

resource "libvirt_volume" "ubuntu2004_amd64" {
  name   = "ubuntu2004-amd64.qcow2"
  format = "qcow2"
  source = local.ubuntu2004_source_url
  pool   = var.default_pool_name
}

resource "libvirt_volume" "centos9_amd64" {
  name   = "centos9-amd64.qcow2"
  format = "qcow2"
  source = local.centos9_source_url
  pool   = var.default_pool_name
}
