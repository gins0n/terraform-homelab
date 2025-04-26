provider "google" {
  credentials = file("~/.gcp/bold-syntax-458016-q6-0d4abc3629af.json")
  project     = "bold-syntax-458016-q6"
  region      = "us-east1"
}

variable "instances" {
  default = {
    "ansible-master" = "us-east1-b"
    "ansible-node1" = "us-east1-b"
    "ansible-node2" = "us-east1-b"
  }
}

resource "google_compute_instance" "vm_instance" {
  for_each     = var.instances
  name         = each.key
  machine_type = "e2-micro"
  zone         = each.value

  boot_disk {
    initialize_params {
      image = "projects/rhel-cloud/global/images/family/rhel-8"
    }
}

  network_interface {
    network = "default"
    access_config {}
  }
}

