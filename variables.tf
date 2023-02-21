variable "libvirt_system" {
  type        = string
  default     = "qemu:///system"
  description = "(optional) default is qemu:///system"
}

variable "default_pool_name" {
  type        = string
  default     = "default"
  description = "(optional) default pool name is default"
}

variable "ubuntu_domains_count" {
  type    = number
  default = 4
}

variable "centos_domains_count" {
  type    = number
  default = 0
}

variable "libvirt_network_name" {
  type    = string
  default = "boomkvmlibvirt-net"
}
variable "libvirt_network_cidr" {
  type    = string
  default = "192.168.123.0/24"
}

variable "libvirt_network_domain" {
  type    = string
  default = "test.local"
}

variable "libvirt_network_mode" {
  type    = string
  default = "nat"
}
