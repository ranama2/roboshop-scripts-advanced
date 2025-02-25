
source common.sh

print_head Install and start nginx
component=nginx
configure_and_install_component &>> $log_file
enable_and_start_component &>> $log_file

print_head Configure nginx
rm -rf /usr/share/nginx/html/* &>> $log_file

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>> $log_file

cd /usr/share/nginx/html
unzip /tmp/frontend.zip

cp nginx.conf /etc/nginx/nginx.conf

print_head Restart nginx
restart_component &>> $log_file
