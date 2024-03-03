terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

module "master" {
  source  = "gitlab.com/devops9483002/proxmox-virtual-machine/proxmox"
  version = "0.2.0"

  count = length(var.master_mapping)

  name        = "${var.cluster_name}-master-${count.index + 1}"
  description = var.master_description
  target_node = var.master_mapping[count.index].node
  qemu_agent  = var.qemu_agent
  hastate     = var.hastate
  hagroup     = var.master_mapping[count.index].hagroup

  template_name = var.master_vm_template
  os_type       = var.master_os_type

  cores        = var.master_cores
  memory       = var.master_memory
  disk_size    = var.master_disk_size
  storage_name = var.master_mapping[count.index].storage_name
}

module "worker" {
  source  = "gitlab.com/devops9483002/proxmox-virtual-machine/proxmox"
  version = "0.2.0"

  count = length(var.worker_mapping)

  name        = "${var.cluster_name}-worker-${count.index + 1}"
  description = var.worker_description
  target_node = var.worker_mapping[count.index].node
  qemu_agent  = var.qemu_agent
  hastate     = var.hastate
  hagroup     = var.worker_mapping[count.index].hagroup

  template_name = var.worker_vm_template
  os_type       = var.worker_os_type

  cores        = var.worker_cores
  memory       = var.worker_memory
  disk_size    = var.worker_disk_size
  storage_name = var.worker_mapping[count.index].storage_name
}
