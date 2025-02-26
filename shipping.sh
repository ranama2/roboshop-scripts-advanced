source common.sh
component=shipping
destination=/tmp/shipping.zip
url=https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip

cp shipping.service /etc/systemd/system/shipping.service &>> $log_file

print_head Install maven
dnf install maven -y &>> $log_file

print_head Configure and install shipping
rm -rf /app &>> $log_file
useradd roboshop &>> $log_file
mkdir /app &>> $log_file
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip &>> $log_file
cd /app &>> $log_file
unzip /tmp/shipping.zip &>> $log_file
cd /app &>> $log_file
mvn clean package &>> $log_file
mv target/shipping-1.0.jar shipping.jar &>> $log_file

print_head Copy shipping.service to systemd and reloading daemon

systemctl daemon-reload &>> $log_file
systemctl enable shipping &>> $log_file
systemctl start shipping &>> $log_file

print_head Install mysql load schema
dnf install mysql -y
mysql -h mysql-dev.online -uroot -pRoboShop@1 < /app/db/schema.sql
mysql -h mysql-dev.online -uroot -pRoboShop@1 < /app/db/master-data.sql

print_head Restart shipping
systemctl restart shipping