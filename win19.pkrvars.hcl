disk_size="5s"
boot_wait="40960"
iso_checksum="3022424f777b66a698047ba1c37812026b9714c5"
//url of iso file : https://software-static.download.prss.microsoft.com/pr/download/17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso
iso_url="file:///C:/Users/user/Desktop/Stage Vermeg/17763.737.190906-2324.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso"
memsize="2048"
numvcpus="2"
vm_name="Win2019"
ssh_password="packer"
ssh_username="Administrator"
iso_checksum_type    = "sha256"
memory               = "2048"
no_proxy             = ""
home=""
virtualbox_guest_os_type="windows9srv-64"
version              = "0.1"
update               = "true"
http_proxy           = ""
https_proxy          = ""
vram="12"
cpus                 = "2"
disk_size            = "80480"
headless             = "false"
hostname             = "bionic64"
output_directory     = "output-win19"
//we can set communicator to winrm
communicator         = "ssh"
vboxmanage = [
        ["modifyvm", "{{.Name}}", "--memory", var.memsize],
        ["modifyvm", "{{.Name}}", "--cpus", var.numvcpus]
    ]

winrm_use_ssl        = true
winrm_insecure       = true
winrm_timeout        = "4h"
floppy_files         = ["scripts/bios/gui/autounattend-2019.xml"]
shutdown_command     = "shutdown /s /t 5 /f /d p:4:1 /c \"Packer Shutdown\""
