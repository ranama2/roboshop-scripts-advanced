
source common.sh

print_head Install and start nginx
component=nginx
install_components
enable_and_start_component

print_head Configure nginx
rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

cp nginx.conf /etc/nginx/nginx.conf

print_head Restart nginx
restart_component
