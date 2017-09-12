# infra
infrastructure scripts for reddit-app

# instance creation and app deploy with startup script
gcloud compute instances create --image-family=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=startup-script.sh reddit-app

# instance creation and app deploy with startup script(packer)
gcloud compute instances create --boot-disk-size=10GB --image-family=reddit-base --image-project=otus-devops --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=startup.sh reddit-app

# open puma port in firewall
gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --source-tags=puma-server --source-ranges=0.0.0.0/0 --description="puma server port rule"

# command to launch packer-backed image
gcloud compute instances create --image-family=reddit-base --image-project=otus-devops --machine-type=g1-small  --restart-on-failure --zone=europe-west1-b reddit-app

# HW Terraform-2

1. cd /terraform
2. terrafotm init
3. terraform get
4. terraform plan 
5. terraform apply

- Mongo is not accessible on DB host because of bind address 127.0.0.1
- added output for db external_ip

