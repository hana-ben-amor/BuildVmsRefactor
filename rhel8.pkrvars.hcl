//iso_url download link : https://access.cdn.redhat.com/content/origin/files/sha256/9b/9b3c8e31bc2cdd2de9cf96abb3726347f5840ff3b176270647b3e66639af291b/rhel-8.10-x86_64-dvd.iso?user=1401d69e48ed7e2eafbf339dce09c861&_auth_=1722124645_3c8ed39e15c7944165335dd41bd5f874
iso_url="file:///C:/Users/hanab/Desktop/Stage Vermeg/RedHat/rhel-8.10-x86_64-dvd.iso"
iso_checksum_type    = "sha256"
memory               = "2048"
no_proxy             = ""
vm_name="RHEL-8.10-3"
home= ""
virtualbox_guest_os_type ="rhel8-64"
version              = "0.1"
update               = "true"
communicator         = "ssh"
ssh_username         = "packer"
ssh_password         = "packerpassword"
ssh_fullname         = "packer"
ssh_wait_timeout        = "10000s"
iso_checksum="9b3c8e31bc2cdd2de9cf96abb3726347f5840ff3b176270647b3e66639af291b"
http_proxy           = ""
https_proxy          = ""
vram="12"
cpus                 = "2"
disk_size            = "80480"
headless             = "false"
hostname             = "bionic64"
output_directory     = "output-rhel8"
boot_command = [
      "<esc><wait>",
      // "vmlinuz initrd=initrd.img inst.geoloc=0 rd.driver.blacklist=dm-multipath net.ifnames=0 biosdevname=0 ",
      "vmlinuz initrd=initrd.img inst.ks=http://172.20.10.2:{{.HTTPPort}}/ks.cfg",
      "<enter>"
]

vboxmanage             = [
["modifyvm", "{{ .Name }}", "--audio", "none"], 
["modifyvm", "{{ .Name }}", "--usb", "off"],
["modifyvm", "{{ .Name }}", "--vram", "12"], 
["modifyvm", "{{ .Name }}", "--vrde", "off"], 
["modifyvm", "{{.Name}}", "--nic1", "bridged"],
["modifyvm", "{{.Name}}", "--bridgeadapter1","Intel(R) Wi-Fi 6E AX211 160MHz"],
["modifyvm", "{{ .Name }}", "--memory", "2048"], 
["modifyvm", "{{ .Name }}", "--cpus", "2"],
// ["modifyvm", "{{ .Name }}", "--natpf1", "guestssh,tcp,,2236,,22"]
]
floppy_files=[]
