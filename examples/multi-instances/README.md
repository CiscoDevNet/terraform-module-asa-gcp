
<!-- BEGIN_TF_DOCS -->
# This is used as building blocks to provision VMs in GCP:

## Overview

This is an example on how to create a multiple ASAv instance with the module.This is a module for Cisco ASAv in GCP.
## Prerequisites

Make sure you have the following:

- Terraform – Learn how to download and set up [here](https://learn.hashicorp.com/terraform/getting-started/install.html).
- gcloud auth application-default login [here](https://cloud.google.com/compute/docs/authentication)

## ASA version supported
* 9.x

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= v1.3.2 |
| <a name="requirement_gcp"></a> [gcp](#requirement\_gcp) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="requirement_gcp"></a> [gcp](#requirement\_gcp) | ~> 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="asa-1"></a> [asa-1](#module\_asa-1) | ./modules/asa-1 | n/a |

## Resources
This template allows you to create a google_compute_instance_template resource

## Source code files naming convention

* locals.tf: local variables
* variables.tf: input variables
* outputs.tf: output variables
* datasource.tf: define data source such as zones, compute images and template.
* network.tf: define VPC networks, custom routes.
* firewall.tf: define firewall rules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The ID of the project where VPC networks will be created | string | - | yes |
| region | The region of the VPC networks will be created | string | - | yes |
| networks | A list of VPC network related data such as name, cidr range, appliance ip, has external ip or not  | `list`| [] | no |
| mgmt_network | The name of management VPC network | string | vpc-mgmt | no |
| inside_network | The name of inside VPC network | string | vpc-inside | no |
| outside_network | The name of outside VPC network | string | vpc-mgmt | no|
| dmz1_network | The name of dmz1 VPC network | string | vpc-dmz1 | no|
| dmz2_network | The name of dmz2 VPC network | string | vpc-dmz2 | no|
| ha_enabled | suports HA with network load balancer | bool | false | no |
| num_instances | Number of instances to create | number | 1 | no |
| vm_zones | zones of vm instances | string | - | yes |
| vm_machine_type | The machine type of the instance | string | - | yes |
| vm\_instance\_labels | Labels to apply to the vm instances. | `map(string)` | `{}` | no |
| vm\_instance\_tags | Additional tags to apply to the instances.| `list(string)` | `[]` | no |
| cisco_product_version | product version of cisco appliance | string| - | no |
| day_0_config | The zero day configuration file name, under templates folder|string| - | yes |
| admin_ssh_pub_key| ssh public key for admin user | string| - | yes |
| enable_password | enable password for admin user | string| - | no |
| custom_route_tag | custom route tag for the appliance | string | false | no |
| named_ports | service port name and port for load balancer | list | [] | no |
| service_port | service  port for application workload | number | 80 | no |
| use_internal_lb | use internal load balancer | bool | false | no |
| allow_global_access | Internal LB allow global access or not | bool | false | no |
| compute_image | compute image for ASA, debug only | string | - | no |
| startup_script | startup_script for ASA, debug only | string | - | no |


### (Optional) Set up a GCS backend
```bash
cd examples/single-instance
```
Add backend.tf accordingly,

```hcl
terraform {
  backend "gcs" {
    bucket = "<a-unique-bucket-for-terraform-states>"
    prefix = "asa/single-instance"
  }
}
```

### Generate a ssh key pair with 2048 bits key as 2048 bits is supported by ASAv.


```bash
# Generate a ssh key pair with 2048 bits key as 2048 bits is supported by ASA
ssh-keygen -t rsa -b 2048 -f admin-ssh-key
```
### Execute Terraform for creating the appliances.

```bash
cd examples/single-instance
# modify the  terraform.tfvars to make sure all the values fit the use case 
# such as admin_ssh_pub_key
terraform init 
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
terraform destroy -var-file=terraform.tfvars
```

## Usage/Examples

```javascript
module "asa-1" {
  source                   = "../.."
   num_instances           = 2
  cisco_product_version    = "cisco-asav-9-16-1-28"
project_id                 =  "terraform-demo-370415"
region                     = "us-west1"
vm_zones                   = ["us-west1-a"]
vm_machine_type            = "c2-standard-4"
vm_instance_labels = {
  firewall    = "asa"
  environment = "dev"
  usecase     = "oob"
}
#vm_instance_tags        = ["allow-lb"]
day_0_config             = "oob.txt"
admin_ssh_pub_key = ""
enable_password   = ""
# nic0 needs to be the management interface
networks = [
  {
    name         = "vpc-mgmt"
    cidr         = "10.10.10.0/24"
    appliance_ip = ["10.10.10.10"]
    external_ip  = true
  },
  {
    name         = "vpc-outside"
    cidr         = "10.10.11.0/24"
    appliance_ip = ["10.10.11.10"]
    external_ip  = true
  },
  {
    name         = "vpc-inside"
    cidr         = "10.10.12.0/24"
    appliance_ip = ["10.10.12.10"]
    external_ip  = false
  },

  {
    name         = "vpc-dmz1"
    cidr         = "10.10.13.0/24"
    appliance_ip = ["10.10.13.10"]
    external_ip  = false
  }
]
mgmt_network    = "vpc-mgmt"
inside_network  = "vpc-inside"
outside_network = "vpc-outside"
dmz1_network    = "vpc-dmz1"
}
```
## Outputs

| Name | Description |
|------|-------------|
| networks\_map| The internal networks data structure used|
| vm_external\_ips | The external IPs of the vm instances|

<!-- END_TF_DOCS -->