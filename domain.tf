resource "libvirt_volume" "ubuntu_domain_vol" {
  name             = format("%s-vol.qcow2", local.domain_name)
  base_volume_id   = libvirt_volume.ubuntu_amd64.id
  size             = 26843545600 # 25gb
  base_volume_pool = var.default_pool_name
}

resource "libvirt_domain" "ubuntu_test" {
  name       = local.domain_name
  cloudinit  = libvirt_cloudinit_disk.cloud_init.id
  arch       = "x86_64"
  vcpu       = "2"
  memory     = "2048"
  autostart  = false
  qemu_agent = true
  disk {
    volume_id = libvirt_volume.ubuntu_domain_vol.id
    scsi      = "true"
  }
  network_interface {
    network_id = libvirt_network.default_network.id
    hostname   = format("%s-net", local.domain_name)
    addresses  = ["192.168.123.90"]
  }
  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
  video {
    type = "virtio"
  }
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }
  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }
  cpu {
    mode = "host-passthrough"
  }
  #   tpm {
  #     backend_type    = "emulator"
  #     # backend_version = "2.0"
  #   }
  boot_device {
    dev = ["hd"]
  }
  cmdline = []
}
