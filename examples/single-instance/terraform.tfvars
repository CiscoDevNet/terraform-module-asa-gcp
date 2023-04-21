#OOB management
cisco_product_version = "cisco-asav-9-16-1-28"
project_id            = ""
region                = "us-west1"
vm_zones              = ["us-west1-a"]
vm_machine_type       = "c2-standard-4"
vm_instance_labels = {
  firewall    = "asa"
  environment = "dev"
  usecase     = "oob"
}
#vm_instance_tags  = ["allow-lb"]
day_0_config      = "oob.txt"
admin_ssh_pub_key = ""
enable_password   = "C8Npp2E61Az@6z3L"
admin_password    = "C8Npp2E61Az@6z3L"
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
