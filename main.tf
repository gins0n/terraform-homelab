provider "google" {
  credentials = file(var.GOOGLE_APPLICATION_CREDENTIALS)
  project     = "bold-syntax-458016-q6"
  region      = "us-east1"
}

# K8s VMs

resource "google_compute_instance" "vm_instance" {
  for_each     = var.instances
  name         = each.key
  machine_type = var.machine_type
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.username}:${file(var.ssh_public_key)}"
  }

}

# Ansible master
resource "google_compute_instance" "ansible_master" {
  name         = "ansible-master"
  machine_type = "e2-small"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "rocky-linux-cloud/rocky-linux-9"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.username}:${file(var.ssh_public_key)}"
  }

  connection {
    type        = "ssh"
    user        = var.username
    private_key = file("~/.ssh/gcp_key")
    host        = self.network_interface[0].access_config[0].nat_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install -y epel-release",
      "sudo dnf install -y ansible"
    ]
  }
}


output "ansible_master_ip" {
  value = google_compute_instance.ansible_master.network_interface[0].access_config[0].nat_ip
}


