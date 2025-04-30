variable "GOOGLE_APPLICATION_CREDENTIALS" {
  description = "Path to GCP credentials JSON file"
  type = string
}

variable "instances" {
  description = "A map of isntance names to their zone and image"
  type        = map(object({
    zone = string
    image = string
  }))
default = {
  "ansible-master" = {
    zone = "us-east1-b"
    image = "rhel-cloud/rhel-9"
  },
  "controlplane" = {
    zone  = "us-east1-b"
    image = "debian-cloud/debian-12"
  },
  "worker-node-1" = {
    zone  = "us-east1-b"
    image = "debian-cloud/debian-12"
  },
  "worker-node-2" = {
    zone  = "us-east1-b"
    image = "debian-cloud/debian-12"
  }
 }
}

variable "machine_type" {
  description = "Machine type for all instances"
  type        = string
  default     = "e2-micro"
}

variable "ssh_public_key" {
  description = "public SSH key for accessing VMs"
  type = string
}

variable "username" {
  description = "The username for SSH access"
  type = string
}
