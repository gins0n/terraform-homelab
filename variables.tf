variable "instances" {
  description = "A map of instance names to zones"
  type        = map(string)
  default = {
    "ansible-master" = "us-east1-b"
    "ansible-node1"  = "us-east1-b"
    "ansible-node2"  = "us-east1-b"
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

