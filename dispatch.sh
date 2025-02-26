source common.sh
component=dispatch

print_head Install golang
dnf install golang -y &>> $log_file

print_head Configure and install dispatch
rm -rf /app &>> $log_file
useradd roboshop &>> $log_file
mkdir /app &>> $log_file
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch-v3.zip &>> $log_file
cd /app &>> $log_file
unzip /tmp/dispatch.zip &>> $log_file
cd /app &>> $log_file
go mod init dispatch &>> $log_file
go get &>> $log_file
go build &>> $log_file

print_head Copy dispatch.service to systemd and reload daemon
cp dispatch.service /etc/systemd/system/dispatch.service &>> $log_file
systemctl daemon-reload &>> $log_file
systemctl enable dispatch &>> $log_file
systemctl start dispatch &>> $log_file