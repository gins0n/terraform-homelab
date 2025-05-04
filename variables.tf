variable "GOOGLE_APPLICATION_CREDENTIALS" {
  description = "Path to GCP credentials JSON file"
  type = string
}

variable "instances" {
  description = "A map of instance names to their zone and image"
  type        = map(object({
    zone = string
    image = string
  }))
default = {
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
  default     = "e2-small"
}

variable "ssh_public_key" {
  description = "public SSH key for accessing VMs"
  type = string
}

variable "ssh_private_key" {
  description = "The private SSH key used for authentication"
  type = string
}

variable "username" {
  description = "The username for SSH access"
  type = string
}
