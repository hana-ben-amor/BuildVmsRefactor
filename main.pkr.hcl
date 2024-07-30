variable "cpus" {}
variable "disk_size" {}
variable "headless" {}
variable "hostname" {}
variable "http_proxy" {}
variable "https_proxy" {}
variable "iso_checksum" {}
variable "iso_checksum_type" {}
variable "memory" {}
variable "no_proxy" {}
variable "ssh_fullname" {}
variable "ssh_password" {}
variable "ssh_username" {}
variable "update" {}
variable "version" {}
variable "virtualbox_guest_os_type" {}
variable "vm_name" {}
variable "home" {}
variable "vram"{}
variable output_directory{}
variable iso_url{}
variable boot_command{
  type=list(string)
}
variable vboxmanage{
  type = list(list(string))
}
variable floppy_files{}
variable communicator{}
variable ssh_wait_timeout{}
source "virtualbox-iso" "vm" {
 
  boot_command= "${var.boot_command}"
  disk_size               = "${var.disk_size}"
  guest_os_type           = "${var.virtualbox_guest_os_type}"
  hard_drive_interface    = "sata"
  headless                = "${var.headless}"
  http_directory          = "./http"
  iso_checksum            = "${var.iso_checksum_type}:${var.iso_checksum}"
  iso_urls                = [
    "${var.iso_url}"
  ]
  output_directory        = "${var.output_directory}" 
  communicator="${var.communicator}"
  ssh_username            = "${var.ssh_username}"
  ssh_password            = "${var.ssh_password}"
  floppy_files            = "${var.floppy_files}"
  shutdown_command        = "echo '${var.ssh_password}'|sudo -S shutdown -P now" 
  shutdown_timeout        = "30m"
  ssh_wait_timeout        = "${var.ssh_wait_timeout}"
  guest_additions_mode    = "disable"
  vboxmanage             = "${var.vboxmanage}"
  virtualbox_version_file = ".vbox_version"
  vm_name                 = "${var.vm_name}"
  format                  = "ova"

}

source "qemu" "vm" {
  boot_command            = var.boot_command
  disk_size               = var.disk_size
  memory                  = var.memory
  cpus                    = var.cpus
  iso_checksum            = "${var.iso_checksum_type}:${var.iso_checksum}"
  iso_url                 = var.iso_url
  output_directory        = var.output_directory
  communicator            = var.communicator
  ssh_username            = var.ssh_username
  ssh_password            = var.ssh_password
  shutdown_command        = "echo '${var.ssh_password}'|sudo -S shutdown -P now"
  shutdown_timeout        = "30m"
  ssh_wait_timeout        = var.ssh_wait_timeout
  boot_wait               = "10s"
  accelerator             = "kvm"
  qemu_args               = ["-device", "virtio-balloon-pci"]
  format                  = "qcow2"
  vm_name                 = var.vm_name
}



build {
  sources = [
    "source.virtualbox-iso.vm",
    "source.qemu.vm"]
  
  provisioner "file" {
  source      = ".ssh/id_ed25519.pub"
  destination = "/tmp/id_ed25519.pub"
}

provisioner "shell" {
  inline = [
    "mkdir -p /home/packer/.ssh",
    "cat /tmp/id_ed25519.pub >> /home/packer/.ssh/authorized_keys",
    "chmod 600 /home/packer/.ssh/authorized_keys",
    "chown packer:packer /home/packer/.ssh /home/packer/.ssh/authorized_keys",
    "rm /tmp/id_ed25519.pub"
  ]
}  
}
