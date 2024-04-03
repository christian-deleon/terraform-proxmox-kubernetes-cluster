########################################
# General settings
########################################

variable "cluster_name" {
  type        = string
  description = "The name of the cluster."
}

variable "qemu_agent" {
  type        = bool
  default     = true
  description = "Enable the QEMU agent for the virtual machines."
}

variable "os_type" {
  type        = string
  description = "The type of the operating system. Options: ubuntu, centos, cloud-init"
}

variable "cloudinit_user" {
  type        = string
  default     = null
  description = "The cloud-init user"
}

variable "cloudinit_password" {
  type        = string
  default     = null
  description = "The cloud-init user password"
}

variable "cloudinit_sshkey" {
  type        = string
  default     = null
  description = "The cloud-init user ssh key"
}

variable "cloudinit_cdrom" {
  type        = string
  default     = null
  description = "The cloud-init cdrom storage name"
}

variable "hastate" {
  type        = string
  default     = null
  description = "The HA state of the virtual machines. Options: started, stopped, enabled, disabled, or ignored"
}

variable "scsihw" {
  type        = string
  default     = null
  description = "The SCSI controller type. Options: lsi, virtio-scsi-pci, virtio-scsi-single"
}

variable "bootdisk" {
  type        = string
  default     = "scsi0"
  description = "The boot disk"
}

variable "ipconfig0_ip" {
  type    = string
  default = null
}

variable "ipconfig0_cidr" {
  type    = string
  default = null
}

variable "ipconfig0_gw" {
  type    = string
  default = null
}

variable "nameserver" {
  type    = string
  default = null
}

variable "tags" {
  type        = list(string)
  default     = []
  description = "The tags to assign to the virtual machines."
}

########################################
# Master settings
########################################

variable "master_mapping" {
  type = list(object({
    node         = string
    storage_name = string
    hagroup      = string
    ipconfig0_ip = string
  }))
}

variable "master_vm_template" {
  type        = string
  description = "The name of the template to use for the master nodes."
}

variable "master_sockets" {
  type        = number
  default     = 1
  description = "The number of sockets to allocate to each master node."
}

variable "master_cores" {
  type        = number
  default     = 4
  description = "The number of cores to allocate to each master node."
}

variable "master_vcpus" {
  type        = string
  default     = "0"
  description = "The number of vcpus to allocate to each master node."
}

variable "master_cpu" {
  type        = string
  default     = "host"
  description = "The CPU type to allocate to each master node. Options: host, kvm64, kvm32, core2duo, pentium, phenom, qemu64, qemu32"
}

variable "master_memory" {
  type        = number
  default     = 4096
  description = "The amount of memory to allocate to each master node."
}

variable "master_disk_size" {
  type        = number
  default     = 100
  description = "The size of the root disk to allocate to each master node."
}

variable "master_description" {
  type        = string
  default     = "Master node"
  description = "The description to use for the master nodes."
}

########################################
# Worker settings
########################################

variable "worker_mapping" {
  type = list(object({
    node         = string
    storage_name = string
    hagroup      = string
    ipconfig0_ip = string
  }))
}

variable "worker_vm_template" {
  type        = string
  description = "The name of the template to use for the worker nodes."
}

variable "worker_sockets" {
  type        = number
  default     = 1
  description = "The number of sockets to allocate to each worker node."
}

variable "worker_cores" {
  type        = number
  default     = 4
  description = "The number of cores to allocate to each worker node."
}

variable "worker_vcpus" {
  type        = string
  default     = "0"
  description = "The number of vcpus to allocate to each worker node."
}

variable "worker_cpu" {
  type        = string
  default     = "host"
  description = "The CPU type to allocate to each worker node. Options: host, kvm64, kvm32, core2duo, pentium, phenom, qemu64, qemu32"
}

variable "worker_memory" {
  type        = number
  default     = 4096
  description = "The amount of memory to allocate to each worker node."
}

variable "worker_disk_size" {
  type        = number
  default     = 100
  description = "The size of the root disk to allocate to each worker node."
}

variable "worker_description" {
  type        = string
  default     = "Worker node"
  description = "The description to use for the worker nodes."
}
