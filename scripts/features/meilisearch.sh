#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

if [ -f /home/vagrant/.homestead-features/meilisearch ]
then
    echo "meilisearch already installed."
    exit 0
fi

touch /home/vagrant/.homestead-features/meilisearch
chown -Rf vagrant:vagrant /home/vagrant/.homestead-features

# add the sources for meilisearch
echo "deb [trusted=yes] https://apt.fury.io/meilisearch/ /" > /etc/apt/sources.list.d/fury.list

# update apt and install meilisearch
apt-get update && apt-get install meilisearch-http

# Create a service file
cat > /etc/systemd/system/meilisearch.service << EOF
[Unit]
Description=MeiliSearch
After=systemd-user-sessions.service

[Service]
Type=simple
ExecStart=/usr/bin/meilisearch --http-addr '0.0.0.0:7700'

[Install]
WantedBy=default.target
EOF

# Set the service meilisearch
systemctl daemon-reload
systemctl enable meilisearch

# Start the meilisearch service
systemctl start meilisearch
