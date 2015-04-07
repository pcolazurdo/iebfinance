# This vagrant creates a box for using Ruby 4.2 & Rails with RVM and postgresql
# Don't forget to edit the corresponding variables for DB Creation
# POSTGRES_DB=dbname
# POSTGRES_ROLE=rolename
# POSTGRES_PASSW=passwordtext
#
#

VAGRANTFILE_API_VERSION = "2"


$setup = <<SCRIPT
echo Provisioning vagrant box!
apt-get -qq update

su vagrant <<EOF
echo Installing rvm / ruby 2.2 / rails
cd ~
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm
rvm install 2.2 
rvm use 2.2  --default
gem install rails
echo Finished Installing rvm / ruby 2.2 / rails
EOF

echo Installing Postgres
apt-get -q -y install postgresql postgresql-client libpq-dev
echo Installing NodeJS
apt-get -q -y install nodejs

echo Setting Up Postgres Databases
POSTGRES_DB=iebflores_dev
POSTGRES_ROLE=iebflores
POSTGRES_PASSW=iebflores
sudo sudo -u postgres psql -c "CREATE ROLE $POSTGRES_ROLE PASSWORD '$POSTGRES_PASSW' INHERIT LOGIN"
sudo sudo -u postgres createdb -O $POSTGRES_ROLE $POSTGRES_DB
sudo cp /etc/postgresql/9.3/main/pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf.backup
sudo sed  -i -r "s/(^local.*)peer/\\1trust/" /etc/postgresql/9.3/main/pg_hba.conf
sudo /etc/init.d/postgresql reload

echo Setting up Rails Project
su - vagrant <<EOF
whoami
cd /vagrant
rm Gemfile.lock 
bundle install
rake db:schema:load
rake assets:precompile
echo to run just execute: cd /vagrant \&\& rails s -b 0.0.0.0
EOF

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