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

