# Before running  ansible tasks

you need to create  GCE instaces with terrafom - refer to /terraform dir

# Ansible is set up to work with Dynamic-inventory via gce.py script

- pre requirements

1. pip install apache-libcloud
2. download GCP credentials.json from
https://support.google.com/cloud/answer/6158849?hl=en&ref_topic=6262490#serviceaccounts -
3. put the file into ansible/credentials/
4. downoad from https://github.com/ansible/ansible/tree/devel/contrib/inventory  gce.py and gce.ini files
3. put files into ansible/environments/prod/ and ansible/environments/stage/
4. add following parameters to gce.ini

- gce_service_account_email_address = {service account email}
- gce_service_account_pem_file_path = credentials/{your_credentians.json}
- gce_project_id = {you project_id}
- gce_zone = {your region}

# Nginx configuration role

an jdauphant.nginx role from ansible-galaxy is used
to install and configure nginx

you need to execute
ansible-galaxy install -p roles/ -r requirements.yml
to install it

# ENV specification

Repo have  2 environments stage and prod
to specisfy env variable on playbook level use -e env={env} on ansible-playbook call

ex: ansible-playbook -e env=stage site.yml

# Usage
- stage env
ansible-playbook -e env=stage site.yml
- prod env
ansible-playbook -e env=prod -i ./environments/prod/gce.py site.yml

# WARNING

group_vars not working unless you specify host name as tag_your-host-name


