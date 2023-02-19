resource "libvirt_volume" "domain_vol" {
  name           = format("%s-vol.qcow2", local.domain_name)
  base_volume_id = libvirt_volume.ubuntu_2204_amd64.id
}

resource "libvirt_domain" "ubuntu_test" {
  name       = local.domain_name
  arch       = "x86_64"
  vcpu       = "2"
  memory     = "2048"
  autostart  = false
  qemu_agent = true
  disk {
    volume_id = libvirt_volume.domain_vol.id
    scsi      = "true"
  }
  network_interface {
    network_id = libvirt_network.default_network.id
    hostname   = format("%s-net", local.domain_name)
    addresses  = ["192.168.123.90"]
  }
  graphics {
    type        = "vnc"
    listen_type = "address"
  }
  video {
    type = "vga"
  }
  console {
    type        = "pty"
    target_port = "0"
    target_type = "virtio"
    source_path = "/dev/pts/4"
  }
  cpu {
    mode = "host-passthrough"
  }
  #   tpm {
  #     backend_type    = "emulator"
  #     # backend_version = "2.0"
  #   }
  cmdline = []
}
