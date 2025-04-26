# Terraform Homelab

# Homelab Setup with Terraform

This project is a **homelab infrastructure** setup using **Terraform** to provision virtual machines on **Google Cloud Platform (GCP)**. The goal is to automate the deployment of basic VM instances for use with **Ansible** testing.

## Prerequisites

- **Terraform** (v0.14 or later)
- **Google Cloud Platform (GCP) account** with billing enabled
- **GCP Service Account Key** in JSON format (with appropriate permissions)
- **Ansible** for configuration management (optional, for playbook execution)

## Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/gins0n/terraform-homelab.git
   cd terraform-homelab

## 2. Configure your GCP credentials

To allow Terraform to interact with your Google Cloud resources, you need to configure authentication using a service account key. 

- **Create a Service Account** in the Google Cloud Console with roles such as **Compute Admin** and **Project Owner**.
- **Download the JSON key** for this service account.
- Set the environment variable for Terraform to use the credentials:

  ```bash
  export GOOGLE_APPLICATION_CREDENTIALS="path/to/your-service-account-key.json"

## 3. Edit Terraform variables

In the `variables.tf` file, you can configure the variables for your deployment, such as the VM names, machine types, and zones. Modify the following according to your requirements:

- **VM Names**: Define the names for your VMs (e.g., `ansible-master`, `ansible-node1`, etc.).
- **Zones**: Set the zones where the VMs should be created (e.g., `us-east1-b`).
- **Machine Types**: Choose the desired machine type for each VM (e.g., `e2-micro`, `e2-medium`).
  

```hcl
variable "instances" {
  default = {
    "ansible-master" = "us-east1-b"
    "ansible-node1"  = "us-east1-b"
    "ansible-node2"  = "us-east1-b"
  }
}

variable "machine_type" {
  default = "e2-micro"
}

## 4. Initialize, plan, and apply with

```hcl
terraform init
terraform plan
terraform apply






