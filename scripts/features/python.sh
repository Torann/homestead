#!/usr/bin/env bash


export DEBIAN_FRONTEND=noninteractive

if [ -f /home/vagrant/.homestead-features/pythontools ]
then
    echo "pythontools already installed."
    exit 0
fi

touch /home/vagrant/.homestead-features/pythontools
chown -Rf vagrant:vagrant /home/vagrant/.homestead-features

# Install Python
apt-get update
apt-get install -y python3-pip build-essential libssl-dev libffi-dev python3-dev python3-venv python3-django
sudo -H -u vagrant bash -c 'pip3 install django'
sudo -H -u vagrant bash -c 'pip3 install numpy'
sudo -H -u vagrant bash -c 'pip3 install masonite'
