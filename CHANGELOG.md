# Changelog

## [Unreleased] - 2025-04-27
### Added
- Added Terraform script to provision multiple VMs in GCP
- Injected SSH key for each VM via Terraform

### Changed
- Refined the metadata injection method to use variables for SSH keys

---

## [1.0.0] - 2025-04-28
### Added
- Initial project setup with Terraform and GCP
- Provisioned VM instances and injected SSH keys for automated access

### Lessons Learned
- **SSH Key Injection**: Initially struggled with SSH key injection in Terraform; realized that the keys need to be specified correctly using the `file()` function to load the local key.
- **Debugging Terraform**: Learned how to use Terraform's `terraform console` and `terraform plan` commands to debug issues with resource creation and configuration.

### Fixed
- Resolved SSH key injection issue to correctly copy keys into VM's authorized_keys file

## [1.1.0] - 2025-05-04
### Added
- Specific configurations for ansible-master node
- Separate resource definition for the ansible-master node

### Lessons Learned
- **remote_exec**: Useful tool for one-off configurations or for things that have to be configured before we can start with Ansible. Sometimes people just use straight Terraform but no Ansible, which seems difficult to manage. Since we're going to have to ssh into ansible-master anyway this might have been in vain but I'll roll with it for now
- **naming** Terraform only accepts underscores in resource names, be aware when referencing throughout main

### Fixed
- ansible-master now is provisioned correctly with ansible preinstalled. 
