terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

locals {
  combined_tags = concat(var.tags, ["kubernetes", "cluster", var.cluster_name])
}

module "master" {
  source  = "gitlab.com/devops9483002/proxmox-virtual-machine/proxmox"
  version = "0.4.0"

  count = length(var.master_mapping)

  # General settings
  name          = "${var.cluster_name}-master-${count.index + 1}"
  description   = var.master_description
  target_node   = var.master_mapping[count.index].node
  qemu_agent    = var.qemu_agent
  template_name = var.master_vm_template
  tags          = count.index == 0 ? concat(local.combined_tags, ["controlplane-maste"]) : concat(local.combined_tags, ["controlplane-slave"])

  # Network settings
  ipconfig0_ip   = var.master_mapping[count.index].ipconfig0_ip
  ipconfig0_cidr = var.ipconfig0_cidr
  ipconfig0_gw   = var.ipconfig0_gw
  nameserver     = var.nameserver

  # Cloud-init settings
  os_type            = var.os_type
  cloudinit_user     = var.cloudinit_user
  cloudinit_password = var.cloudinit_password
  cloudinit_sshkey   = var.cloudinit_sshkey
  cloudinit_cdrom    = var.cloudinit_cdrom

  # Hardware settings
  sockets      = var.master_sockets
  cores        = var.master_cores
  memory       = var.master_memory
  disk_size    = var.master_disk_size
  storage_name = var.master_mapping[count.index].storage_name

  # High Availability settings
  hastate = var.hastate
  hagroup = var.master_mapping[count.index].hagroup
}

module "worker" {
  source  = "gitlab.com/devops9483002/proxmox-virtual-machine/proxmox"
  version = "0.4.0"

  count = length(var.worker_mapping)

  # General settings
  name          = "${var.cluster_name}-worker-${count.index + 1}"
  description   = var.worker_description
  target_node   = var.worker_mapping[count.index].node
  qemu_agent    = var.qemu_agent
  template_name = var.worker_vm_template
  tags          = concat(local.combined_tags, ["worker"])

  # Network settings
  ipconfig0_ip   = var.worker_mapping[count.index].ipconfig0_ip
  ipconfig0_cidr = var.ipconfig0_cidr
  ipconfig0_gw   = var.ipconfig0_gw
  nameserver     = var.nameserver

  # Cloud-init settings
  os_type            = var.os_type
  cloudinit_user     = var.cloudinit_user
  cloudinit_password = var.cloudinit_password
  cloudinit_sshkey   = var.cloudinit_sshkey
  cloudinit_cdrom    = var.cloudinit_cdrom

  # Hardware settings
  sockets      = var.worker_sockets
  cores        = var.worker_cores
  memory       = var.worker_memory
  disk_size    = var.worker_disk_size
  storage_name = var.worker_mapping[count.index].storage_name

  # High Availability settings
  hastate = var.hastate
  hagroup = var.worker_mapping[count.index].hagroup
}
