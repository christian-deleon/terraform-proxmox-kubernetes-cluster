variable "cluster_name" {
  type        = string
  description = "The name of the cluster."
}

variable "qemu_agent" {
  type        = bool
  default     = true
  description = "Enable the QEMU agent for the virtual machines."
}

########################################
# Master
########################################

variable "master_mapping" {
  type = list(object({
    node      = string
    storage_name = string
  }))
}

variable "master_vm_template" {
  type        = string
  description = "The name of the template to use for the master nodes."
}

variable "master_os_type" {
  type        = string
  description = "The type of the operating system for master nodes. Options: ubuntu, centos, cloud-init"
}

variable "master_cores" {
  type        = number
  default     = 4
  description = "The number of cores to allocate to each master node."

  validation {
    condition     = var.master_cores >= 4 && var.master_cores <= 8
    error_message = "The number of cores must be between 4 and 8."
  }
}

variable "master_memory" {
  type        = number
  default     = 4096
  description = "The amount of memory to allocate to each master node."

  validation {
    condition     = var.master_memory >= 4096 && var.master_memory <= 16384
    error_message = "The amount of memory must be between 4096 and 16384."
  }
}

variable "master_disk_size" {
  type        = number
  default     = 100
  description = "The size of the root disk to allocate to each master node."

  validation {
    condition     = var.master_disk_size >= 100 && var.master_disk_size <= 1000
    error_message = "The size of the root disk must be between 100 and 1000."
  }
}

variable "master_description" {
  type        = string
  default     = "Master node"
  description = "The description to use for the master nodes."
}

########################################
# Worker
########################################

variable "worker_mapping" {
  type = list(object({
    host      = string
    datastore = string
  }))
}

variable "worker_vm_template" {
  type        = string
  description = "The name of the template to use for the worker nodes."
}

variable "worker_os_type" {
  type        = string
  description = "The type of the operating system for worker nodes. Options: ubuntu, centos, cloud-init"
}

variable "worker_cores" {
  type        = number
  default     = 4
  description = "The number of cores to allocate to each worker node."

  validation {
    condition     = var.worker_cores >= 4 && var.worker_cores <= 12
    error_message = "The number of cores must be between 4 and 12."
  }
}

variable "worker_memory" {
  type        = number
  default     = 4096
  description = "The amount of memory to allocate to each worker node."

  validation {
    condition     = var.worker_memory >= 4096 && var.worker_memory <= 32768
    error_message = "The amount of memory must be between 4096 and 32768."
  }
}

variable "worker_disk_size" {
  type        = number
  default     = 100
  description = "The size of the root disk to allocate to each worker node."

  validation {
    condition     = var.worker_disk_size >= 100 && var.worker_disk_size <= 10000
    error_message = "The size of the root disk must be between 100 and 10000."
  }
}

variable "worker_description" {
  type        = string
  default     = "Worker node"
  description = "The description to use for the worker nodes."
}
