resource "libvirt_cloudinit_disk" "cloud_init" {
  name      = "ubuntu_cloudinit"
  user_data = data.template_file.user_data.rendered
  #   network_config = data.template_file.network_config.rendered
  pool = var.default_pool_name
}
