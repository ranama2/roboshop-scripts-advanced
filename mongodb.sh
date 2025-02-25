source common.sh

print_head Install and start mongodb
component=mongodb-org
cp mongo.sh /etc/yum.repos.d/mongo.repo
install_component
systemctl enable mongod
systemctl start mongod

print_head Replace local host
sed -i ‘s|127.0.0.0|0.0.0.0|’ /etc/mongod.conf

print_head restart mongodb
systemctl restart mongod



