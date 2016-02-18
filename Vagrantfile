VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Configure cached packages to be shared between instances of the same base box.
  # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.provider "virtualbox" do |vb|
    vb.name = "chef-workshop-box"
    vb.memory = 2048
  end

  config.vm.network "forwarded_port", guest: 3000, host: 4000, auto_correct: true
  config.vm.synced_folder "./", "/home/vagrant/workspace"

  config.berkshelf.berksfile_path = "cookbook/Berksfile"
  config.berkshelf.enabled = true

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "cookbook"
    chef.run_list = ["chef-workshop-cookbook"]
  end
end
