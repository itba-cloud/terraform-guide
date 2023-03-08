#!/bin/bash
yum update -y
amazon-linux-extras install -y nginx1
systemctl start nginx
systemctl enable nginx
wget -O /etc/nginx/conf.d/api.conf https://raw.githubusercontent.com/isagues/terraform-demo/main/scripts/api.conf
systemctl reload nginx