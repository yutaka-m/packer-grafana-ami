#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y
sudo sh -c 'echo "
server {
        listen 80 default_server;
        #listen [::]:80 default_server ipv6only=on;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Server $host;
        proxy_set_header X-Real-IP $remote_addr;

        location / {
                proxy_pass http://127.0.0.1:3000;
        }
}
" >/etc/nginx/sites-available/default
'
