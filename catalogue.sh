source common.sh
component=catalogue
destination=/tmp/catalogue.zip
url=https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip

cp catalogue.service /etc/systemd/system/catalogue.service
cp mongo.repo /etc/yum.repos.d/mongo.repo &>> $log_file

print_head configure and install nodejs
configure_and_install_nodejs &>> $log_file

print_head configure catalogue
configure_component &>> $log_file



print_head Reload daemon
reload_daemon &>> $log_file

print_head Restart catalogue
enable_and_start_component &>> $log_file

print_head Install mongo client

dnf install mongodb-mongosh -y &>> $log_file
mongosh --host mongodb-dev.maksuduldevsecops.online </app/db/master-data.js