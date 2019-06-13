Vagrant.configure(2) do |config|
  config.vm.provision "shell", inline: <<-SHELL
     pkg install -y bash
  SHELL
end
