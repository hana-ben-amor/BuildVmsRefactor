disk_size="5s"
boot_wait="40960"
iso_checksum="4f1457c4fe14ce48c9b2324924f33ca4f0470475e6da851b39ccbf98f44e7852"
// iso url link : https://software-static.download.prss.microsoft.com/sg/download/20348.169.210806-2348.fe_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso
iso_url="file:///C:/Users/user/20348.169.210806-2348.fe_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso"
memsize="2048"
numvcpus="2"
vm_name="Win2022_2"
ssh_password="packer"
ssh_username="Administrator"
iso_checksum_type    = "sha256"
memory               = "2048"
no_proxy             = ""
home=""
virtualbox_guest_os_type="Windows2022_64"
version              = "0.1"
update               = "true"
http_proxy           = ""
https_proxy          = ""
vram="12"
cpus                 = "2"
disk_size            = "80480"
headless             = "false"
hostname             = "bionic64"
output_directory     = "output-win22"
//we can set communicator to winrm
communicator         = "ssh"
vboxmanage = [
        ["modifyvm", "{{.Name}}", "--memory", var.memsize],
        ["modifyvm", "{{.Name}}", "--cpus", var.numvcpus]
    ]

winrm_use_ssl        = true
winrm_insecure       = true
winrm_timeout        = "4h"
floppy_files         = ["scripts/bios/gui/autounattend.xml"]
shutdown_command     = "shutdown /s /t 5 /f /d p:4:1 /c \"Packer Shutdown\""
