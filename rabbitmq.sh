source common.sh
component=rabbitmq

print_head Copy rabbitmq repo file
cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo &>> $log_file

print_head Install and start rabbitmq server
dnf install rabbitmq-server -y
systemctl enable rabbitmq-server
systemctl start rabbitmq-server

print_head Add rabbitmq user
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"


