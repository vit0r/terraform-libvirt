locals {
  domain_name_ubuntu = "ubuntu-vm"
}

resource "libvirt_volume" "ubuntu2204_domain_vol" {
  count            = var.ubuntu2204_domains_count
  name             = format("%s-%s-vol.qcow2", local.domain_name_ubuntu, count.index)
  base_volume_id   = libvirt_volume.ubuntu2204_amd64.0.id
  size             = 26843545600 # 25gb
  base_volume_pool = var.default_pool_name
}

resource "libvirt_domain" "ubuntu2204" {
  count      = var.ubuntu2204_domains_count
  name       = format("%s-%s", local.domain_name_ubuntu, count.index)
  cloudinit  = libvirt_cloudinit_disk.cloud_init.id
  arch       = "x86_64"
  vcpu       = "2"
  memory     = "4048"
  autostart  = false
  qemu_agent = true
  disk {
    volume_id = libvirt_volume.ubuntu2204_domain_vol[count.index].id
    scsi      = "true"
  }
  network_interface {
    network_id = libvirt_network.network.id
    hostname   = format("%s%s", local.domain_name_ubuntu, count.index)
    addresses  = [format("192.168.123.%s", count.index + 10)]
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
