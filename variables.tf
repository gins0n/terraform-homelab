variable "instances" {
  description = "A map of instance names to zones"
  type        = map(string)
  default = {
    "ansible-master" = "us-east1-b"
    "node01"  = "us-east1-b"
    "node02"  = "us-east1-b"
    "controlplane" = "us-east1-b"
  }
}

variable "machine_type" {
  description = "Machine type for all instances"
  type        = string
  default     = "e2-micro"
}

variable "image" {
  description = "The image to use for the VM instances"
  type        = string
  default     = "projects/rhel-cloud/global/images/family/rhel-8"
}

variable "ssh_public_key" {
  description = "public SSH key for accessing VMs"
  type = string
}

variable "username" {
  description = "The username for SSH access"
  type = string
}
