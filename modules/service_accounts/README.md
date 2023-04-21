<!-- BEGIN_TF_DOCS -->
# Create Service Account module

## Overview

Create Service Account module with spacified values

## Module Name
service_account

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="sa_account_id"></a> [sa_account_id](#sa_account_id) |service account id| `string` |`""`| yes |
| <a name="sa_display_name"></a> [sa_display_name](#sa_display_name) | Display names of the created service accounts (defaults to 'Terraform-managed service account') | `string` |`Terraform-managed service account`| yes |
| <a name="sa_description"></a> [sa_description](#sa_description) |Default description of the created service accounts (defaults to no description) | `string` |`""`| yes |

## Outputs

| Name | Description |
|------|-------------|
| email| The email address of the service account|


<!-- END_TF_DOCS -->