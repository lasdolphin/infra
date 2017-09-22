# Dynamic inventory

для работы с динамическим инвентарем нужно:

1. pip install apache-libcloud
2. скачать из веб интерфейса GCP credentials.json и положить в каталог inventory
https://support.google.com/cloud/answer/6158849?hl=en&ref_topic=6262490#serviceaccounts
2. скачать по данной ссылке https://github.com/ansible/ansible/tree/devel/contrib/inventory файлы gce.py и gce.ini
3. положить файлы в ansible/inventory
4. настроить gce.ini  мледующим образом.

gce_service_account_email_address = <service account email>
gce_service_account_pem_file_path = inventory/<credentians.json>
gce_project_id = <you project_id>
gce_zone = <your region>

5. проверить работу скрипта комадой ansible all -m ping

Подробная инстукция с сайта Ansible
http://docs.ansible.com/ansible/latest/guide_gce.html
