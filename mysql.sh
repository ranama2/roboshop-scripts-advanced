source common.sh
component=mysql


print_head Restart user
dnf install mysql-server -y &>> $log_file
systemctl enable mysqld &>> $log_file
systemctl start mysqld &>> $log_file

mysql_secure_installation --set-root-pass RoboShop@1