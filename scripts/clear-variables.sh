#!/usr/bin/env bash

# Clear The Old Environment Variables

sed -i '/# Set Homestead Environment Variable/,+1d' /home/vagrant/.profile
sed -i '/env\[.*/,+1d' /etc/php/7.4/fpm/pool.d/www.conf
