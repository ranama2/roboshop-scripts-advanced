source common.sh
component=payment

print_head Install python 3
dnf install python3 gcc python3-devel -y &>> $log_file

print_head Configure and Install payment service
rm -rf /app &>> $log_file
useradd roboshop &>> $log_file
mkdir /app &>> $log_file
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment-v3.zip &>> $log_file
cd /app &>> $log_file
unzip /tmp/payment.zip &>> $log_file
cd /app &>> $log_file
pip3 install -r requirements.txt &>> $log_file

cp payment.service /etc/systemd/system/payment.service &>> $log_file

print_head Configure and reload payment daemon
reload_daemon &>> $log_file
enable_and_start_component &>> $log_file