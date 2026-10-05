resource "proxmox_vm_qemu" "backup01" {

  name        = "backup01"
  vmid        = 102
  target_node = "pve"

  clone      = "debian-template"
  full_clone = true

  cpu {
    cores = 2
  }

  memory = 2048

  agent  = 1
  scsihw = "virtio-scsi-pci"

  boot = "order=scsi0"

  network {
    id       = 0
    model    = "virtio"
    bridge   = "vmbr0"
    firewall = true
  }

  disk {
    slot    = "scsi0"
    type    = "disk"
    storage = "local-lvm"
    size    = "25G"
  }

  disk {
    slot    = "ide2"
    type    = "cloudinit"
    storage = "local-lvm"
  }

  ipconfig0 = "ip=192.168.18.50/24,gw=192.168.18.1"

  sshkeys = file("keys/terraform_backup01.pub")

  os_type = "cloud-init"
}
