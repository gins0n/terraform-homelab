provider "google" {
  credentials = file(var.GOOGLE_APPLICATION_CREDENTIALS)
  project     = "bold-syntax-458016-q6"
  region      = "us-east1"
}

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

resource "google_compute_instance" "ansible_master" {
  name         = "ansible-master"
  machine_type = var.machine_type
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "rocky-linux-cloud/rocky-linux-9" 
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.username}:${file(var.ssh_public_key)}"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Running remote-exec provisioner for ansible-master'",
      "sudo useradd -m ansible || echo 'ansible user already exists'",
      "sudo mkdir -p /home/ansible/.ssh",
      "sudo chmod 700 /home/ansible/.ssh",
      "echo '${file(var.ssh_public_key)}' | sudo tee /home/ansible/.ssh/authorized_keys",
      "sudo chown -R ansible:ansible /home/ansible/.ssh",
      "sudo usermod -aG wheel ansible",  # Giving ansible sudo privileges by adding to the wheel group
      "sudo dnf install -y epel-release", # Install epel-release
      "sudo dnf install -y ansible"  # Install Ansible on the ansible master
    ]

    connection {
      type        = "ssh"
      user        = var.username  # This is your initial username that can SSH into the VM (e.g., admin)
      private_key = file(var.ssh_private_key)
      host        = google_compute_instance.ansible_master.network_interface[0].access_config[0].nat_ip
    }
  }
}

output "ansible_master_ip" {
  value = google_compute_instance.ansible_master.network_interface[0].access_config[0].nat_ip
}


