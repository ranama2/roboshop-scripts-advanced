source common.sh
component=mongodb-org

print_head Install and start mongodb
cp mongo.repo /etc/yum.repos.d/mongo.repo
install_component &>> $log_file
systemctl enable mongod &>> $log_file
systemctl start mongod &>> $log_file

print_head Replace local host
sed -i ‘s|127.0.0.1|0.0.0.0|’ /etc/mongod.conf

print_head restart mongodb
systemctl restart mongod &>> $log_file



