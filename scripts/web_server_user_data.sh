#!/bin/bash
yum update -y
amazon-linux-extras install -y nginx1
systemctl start nginx
systemctl enable nginx
wget -O /etc/nginx/conf.d/api.conf https://raw.githubusercontent.com/isagues/terraform-demo/main/scripts/api.conf
systemctl reload nginx

  # <<-EOF
  #           #!/bin/bash
  #           echo "Hello, World im instance" > index.html
  #           nohup busybox httpd -f -p ${var.web_server_port} &
  #           EOF