Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |v|
    v.memory = 512
  end

  config.vm.define "tag_reddit-db-local" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.hostname = "reddit-db-local"
    db.vm.network :private_network, ip: "10.10.10.40"

    db.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/site.yml"
      ansible.extra_vars = {
        "env" => "local",
      }
      ansible.groups = {
      "db" => ["tag_reddit-db-local"],
      "db:vars" => {"mongo_bind_ip" => "0.0.0.0"}
      }
    end
  end

  config.vm.define "tag_reddit-app-local" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.hostname = "reddit-app-local"
    app.vm.network :private_network, ip: "10.10.10.50"

    app.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/site.yml"
      ansible.extra_vars = {
        "env" => "local",
        "deploy_user" => "ubuntu",
      }
      ansible.groups = {
      "app" => ["tag_reddit-app-local"],
      "app:vars" => { "db_host" => "10.10.10.40"}
      }
    end
  end

end
