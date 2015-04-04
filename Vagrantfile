# This vagrant creates a box for using Ruby 4.2 & Rails with RVM and postgresql

VAGRANTFILE_API_VERSION = "2"

$setup = <<SCRIPT
apt-get -qq update

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm
rvm install 2.2 
rvm use 2.2  --default
gem install rails

apt-get -q -y install postgresql postgresql-client libpq-dev
apt-get -q -y install nodejs


sudo sudo -u postgres psql -c "CREATE ROLE iebflores PASSWORD 'iebflores' INHERIT LOGIN"
sudo sudo -u postgres createdb -O iebflores iebflores_dev
sudo sed  -i -r "s/(^local.*)peer/\1trust/" /etc/postgresql/9.3/main/pg_hba.conf
sudo /etc/init.d/postgresql reload

cd /vagrant
rm Gemfile.lock 
bundle install
rake db:schema:load
rake assets:precompile
rails s -b 0.0.0.0
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "phusion/ubuntu-14.04-amd64"  
  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
  config.ssh.forward_agent = true

  config.vm.provision :shell, inline: $setup

  # apply local customizations
  custom_file = File.expand_path("../Vagrantfile.local", __FILE__)
  eval(File.read(custom_file)) if File.exists?(custom_file)

  # ...for example, you can give your box more ram by adding this to your Vagrantfile.local:
  #config.vm.provider :virtualbox do |vb|
  #  vb.customize ["modifyvm", :id, "--memory", "2048"]
  #end
end