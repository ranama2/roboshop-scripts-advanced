source common.sh
component=rabbitmq-server

print_head Copy rabbitmq repo file
cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo &>> $log_file

print_head Install and start rabbitmq server
install_component &>> $log_file
enable_and_start_component &>> $log_file

print_head Add rabbitmq user
rabbitmqctl add_user roboshop roboshop123 &>> $log_file
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>> $log_file


