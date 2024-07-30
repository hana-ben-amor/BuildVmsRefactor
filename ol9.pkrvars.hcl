//iso_url download link : https://yum.oracle.com/ISOS/OracleLinux/OL9/u4/x86_64/OracleLinux-R9-U4-x86_64-dvd.iso
iso_url="file:///C:/Users/hanab/Desktop/Stage Vermeg/LinuxOs/OracleLinux-R9-U4-x86_64-dvd.iso"
iso_checksum_type    = "sha256"
memory               = "2048"
no_proxy             = ""
vm_name              = "oracle-linux-9.4-5"
home                 = ""
virtualbox_guest_os_type = "Oracle_64"
version              = "0.1"
update               = "true"
communicator         = "ssh"
ssh_username         = "oracle"
ssh_password         = "oraclepassword"
ssh_fullname         = "oracle"
ssh_wait_timeout        = "10000s"

iso_checksum="77034a4945474cb7c77820bd299cac9a557b8a298a5810c31d63ce404ad13c5e"
http_proxy           = ""
https_proxy          = ""
vram="12"
cpus                 = "2"
disk_size            = "80480"
headless             = "false"
hostname             = "bionic64"
output_directory     = "output-ol9"
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
