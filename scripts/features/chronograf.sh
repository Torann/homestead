#!/usr/bin/env bash


export DEBIAN_FRONTEND=noninteractive

if [ -f /home/vagrant/.homestead-features/chronograf ]
then
    echo "chronograf already installed."
    exit 0
fi

touch /home/vagrant/.homestead-features/chronograf
chown -Rf vagrant:vagrant /home/vagrant/.homestead-features

chronourl="https://dl.influxdata.com/chronograf/releases/chronograf_1.5.0.1_amd64.deb"

wget -q -O chronograf.deb $chronourl
sudo dpkg -i chronograf.deb
rm chronograf.deb

systemctl enable chronograf
systemctl daemon-reload
systemctl start chronograf
