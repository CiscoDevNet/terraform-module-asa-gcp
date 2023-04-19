<!-- BEGIN_TF_DOCS -->
# Create Networking module

## Overview

Create Networking module with spacified values

## Module Name
Networking

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="project_id"></a> [project_id](#project_id) |The project ID to host the network in| `string` |`""`| yes |
| <a name="region"></a> [region](#region) | spacified region to deploy | `string` |`""`| yes |
| <a name="networks"></a> [networks](#networks) |a list of VPC | `list(object)` |`[]`| yes |
| <a name="mgmt_network"></a> [mgmt_network](#mgmt_network) |management network name | `string` | `""` | yes|
| <a name="inside_network"></a> [inside_network](#inside_network) |inside network name | `string` | `""` | yes|
| <a name="outside_network"></a> [outside_network](#outside_network) |outside network name | `string` | `""` | yes|
| <a name="dmz1_network"></a> [dmz1_network](#dmz1_network) |dmz1 network name | `string` | `""` | yes|
| <a name="dmz2_network"></a> [dmz2_network](#dmz2_network) |dmz2 network name | `string` | `""` | yes|
| <a name="service_account"></a> [service_account"](#service_account") |The email address of the service account which will be assigned to the compute instances| `string` | `""` | yes|
| <a name="service_port"></a> [service_port](#service_port) |service port | `number` | `""` | yes|
| <a name="ha_enabled"></a> [iha_enabled](#ha_enabled) |HA enabled | `bool` | `false` | yes|
| <a name="custom_route_tag"></a> [custom_route_tag](#custom_route_tag) |tag for custom route | `string` | `""` | yes|

## Outputs

| Name | Description |
|------|-------------|
| networks\_map| A map of network related info such as name, links,subnet links, cir, internal IP, has external IP or not etc|
| networks_list\_ips | A list of network related info such as name, links,subnet links, cir, internal IP, has external IP or not etc|


<!-- END_TF_DOCS -->