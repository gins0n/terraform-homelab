provider "google" {
  credentials = file("~/.gcp/bold-syntax-458016-q6-0d4abc3629af.json")
  project     = "bold-syntax-458016-q6"
  region      = "us-central1"
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

output "ansible_master_ip" {
  value = google_compute_instance.vm_instance["ansible-master"].network_interface[0].access_config[0].nat_ip
}

