<!-- BEGIN_TF_DOCS -->
# Create LoadBalancer module

## Overview

Create Internal Load Balancer  module with spacified values

## Module Name
LoadBalancer

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="project_id"></a> [project_id](#project_id) |The project ID to host the network in| `string` |`""`| yes |
| <a name="region"></a> [region](#region) | spacified region to deploy | `string` |`""`| yes |
| <a name="vm_zones"></a> [vm_zones](#vm_zones) |spacified zones to deploy virtual machine  | `list` |`""`| yes |
| <a name="service_port"></a> [service_port](#service_port) |spacify service port | `number` |`""`| yes|
| <a name="use_internal_lb"></a> [use_internal_lb](#use_internal_lb) | use internal LB or not | `bool` |  false| yes |
| <a name="allow_global_access"></a> [allow_global_access](#allow_global_access) | allow_global_access | `bool` |  false| yes |
| <a name="networks_map"></a> [networks_map](#networks_map) |network links in a map(network_name) | `map` | `""` | yes|
| <a name="mgmt_network"></a> [mgmt_network](#mgmt_network) |management network name | `string` | `""` | yes|
| <a name="inside_network"></a> [inside_network](#inside_network) |inside network name | `string` | `""` | yes|
| <a name="named_ports"></a> [named_ports"](#named_ports") |Named name and named port. https://cloud.google.com/load-balancing/docs/backend-service#named_ports | `list(object` | `[]` | yes|
| <a name="num_instances"></a> [num_instances](#num_instances) |Number of instances to create. This value is ignored if static_ips is provided | `number` | `""` | yes|
| <a name="instance_ids"></a> [instance_ids](#instance_ids) |a list of google_compute_instance id | `list(string)` | `[]` | yes|

## Outputs

| Name | Description |
|------|-------------|
| external_ip_ext_fr| The external ip address of the forwarding rule|
| internal_ip_ext_fr | The  ip address of the forwarding rule|
<!-- END_TF_DOCS -->