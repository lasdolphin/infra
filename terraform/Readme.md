#This part consist of terraform config files  for instances creation.

before using terraform you nned to create images with packer - feref to /packer dir

# Having 2 environments in one GCE project
{env}
- terraform/stage
- terraform/prod

# Modules

/modules dir

- app module
- db module
- vpc module

# Usage

1. cd terraform/{env}
2. terrafotm init -  install provider
3. terraform get - activate modules
4. terraform plan
5. terraform apply

need to specify variables

- project             = {your gce project id}
- public_key_path     = {yout ssh public key for ssh access}
- app_disk_image      = "reddit-base-app"
- db_disk_image       = "reddit-base-db"


# Delete instances

terraform destroy

- Mongo is not accessible on DB host because of bind address 127.0.0.1
- added output for db external_ip
