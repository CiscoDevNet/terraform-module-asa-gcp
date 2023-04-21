<!-- BEGIN_TF_DOCS -->
# Create Virtual Machine module

## Overview

Create irtual Machine module with spacified values

## Module Name
vm

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="project_id"></a> [project_id](#project_id) |The project ID to host the network in| `string` |`""`| yes |
| <a name="region"></a> [region](#region) | spacified region to deploy | `string` |`""`| yes |
| <a name="vm_zones"></a> [vm_zones](#vm_zones) |spacified zones to deploy virtual machine  | `list` |`""`| yes |
| <a name="networks_list"></a> [networks_list](#networks_list) |network links in a map(network_name) | `list(object)` |`""`| yes|
| <a name="custom_route_tag"></a> [custom_route_tag](#custom_route_tag) |tag for custom route | `string` |  ''| yes |
| <a name="vm_machine_type"></a> [vm_machine_type](#vm_machine_type) | machine type for appliance | `string` |  e2-standard-4| yes |
| <a name="networks_map"></a> [networks_map](#networks_map) |network links in a map(network_name) | `map` | `""` | yes|
| <a name="mgmt_network"></a> [mgmt_network](#mgmt_network) |management network name | `string` | `""` | yes|
| <a name="vm_instance_labels"></a> [vm_instance_labels](#ivm_instance_labels) |Labels to apply to the vm instances. | `map(string)` | `{}` | yes|
| <a name="vm_instance_tags"></a> [vm_instance_tags"](#vm_instance_tags") |additional tags to apply to the instances, please note the service account is used as much as possible as best practice| `list(string)` | `[]` | yes|
| <a name="num_instances"></a> [num_instances](#num_instances) |Number of instances to create. This value is ignored if static_ips is provided | `number` | `""` | yes|
| <a name="compute_image"></a> [compute_image](#compute_image) |vm image | `string` | `""` | yes|
| <a name="startup_script"></a> [startup_script](#startup_script) |startup script | `string` | `""` | yes|
| <a name="cisco_product_version"></a> [cisco_product_version](#cisco_product_version) |cisco product version | `string` | `cisco-asav-9-16-1-28` | yes|
| <a name="admin_ssh_pub_key"></a> [admin_ssh_pub_key](#cisco_product_version) |ssh public key for admin | `string` | `""` | yes|
| <a name="enable_password"></a> [enable_password](#enable_password) |enable password for ASA zero day config | `string` | `""` | yes|
| <a name="day_0_config"></a> [day_0_config](#day_0_config) |zero day configuration | `string` | `""` | yes|
| <a name="service_account"></a> [service_account](#service_account) |The email address of the service account which will be assigned to the compute instances | `string` | `""` | yes|


## Outputs

| Name | Description |
|------|-------------|
| external_ips| external ips for VPC networks|
| instance_ids | a list of instance ids|
<!-- END_TF_DOCS -->