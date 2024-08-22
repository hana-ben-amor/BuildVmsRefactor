iso_url              = "file:///C:/Users/hanab/Downloads/OracleLinux-R8-U10-x86_64-dvd.iso"
iso_checksum_type    = "sha256"
memory               = "2048"
no_proxy             = ""
vm_name              = "oracle-linux-8.10-2"
home                 = ""
virtualbox_guest_os_type = "Oracle_64"
version              = "0.1"
update               = "true"
communicator         = "ssh"
ssh_username         = "packer"
ssh_password         = "packerpassword"
ssh_fullname         = "packer"
ssh_wait_timeout        = "10000s"
iso_checksum         = "7676a80eeaafa16903eebb2abba147a3afe230b130cc066d56fdd6854d8da900"
http_proxy           = ""
https_proxy          = ""
vram="12"
cpus                 = "2"
disk_size            = "80480"
headless             = "false"
hostname             = "bionic64"
output_directory     = "output-ol8"
boot_command = [
  "<esc><wait>",
  "vmlinuz initrd=initrd.img inst.ks=http://172.20.10.2:{{ .HTTPPort }}/ks.cfg",
  "<enter>"
]

vboxmanage             = [
  ["modifyvm", "{{ .Name }}", "--audio", "none"], 
  ["modifyvm", "{{ .Name }}", "--usb", "off"],
  ["modifyvm", "{{ .Name }}", "--vram", "${var.vram}"], 
  ["modifyvm", "{{ .Name }}", "--vrde", "off"], 
  ["modifyvm", "{{.Name}}", "--nic1", "bridged"],
  ["modifyvm", "{{.Name}}", "--bridgeadapter1","Intel(R) Wi-Fi 6E AX211 160MHz"],
  ["modifyvm", "{{ .Name }}", "--memory", "${var.memory}"], 
  ["modifyvm", "{{ .Name }}", "--cpus", "${var.cpus}"],
  // ["modifyvm", "{{ .Name }}", "--natpf1", "guestssh,tcp,,2236,,22"]
]

shutdown_command        = "echo '${var.ssh_password}'|sudo -S shutdown -P now" 
