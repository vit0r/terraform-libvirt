resource "libvirt_volume" "ubuntu_2204_amd64" {
  name   = "ubuntu-22.04-amd64"
  format = "qcow2"
  source = "https://cloud-images.ubuntu.com/jammy/20230218/jammy-server-cloudimg-amd64-disk-kvm.img"
  pool   = "default"
  # depends_on = [
  #   libvirt_pool.libvirt_otherpool_dir
  # ]
}
