#!/bin/bash

sudo sh -c 'echo "deb https://packagecloud.io/grafana/stable/debian/ wheezy main" >>/etc/apt/sources.list '
curl https://packagecloud.io/gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install grafana -y
sudo cat /etc/apt/sources.list
sudo update-rc.d grafana-server defaults 95 10
sudo sh -c 'echo "
[paths]
[server]
[database]
[session]
[analytics]
[security]
admin_user = testing
admin_password = testing
[users]
allow_sign_up = false
[auth.anonymous]
[auth.github]
[auth.google]
[auth.proxy]
[auth.basic]
[auth.ldap]
[smtp]
[emails]
[log]
[log.console]
[log.file]
[event_publisher]
[dashboards.json]
" >/etc/grafana/grafana.ini
'
