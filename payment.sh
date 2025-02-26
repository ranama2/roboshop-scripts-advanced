source common.sh
component=payment

print_head Install python 3
dnf install python3 gcc python3-devel -y &>> $log_file

print_head Configure and Install payment service
rm -rf /app
useradd roboshop
mkdir /app
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment-v3.zip
cd /app
unzip /tmp/payment.zip
cd /app
pip3 install -r requirements.txt

print_head Configure and reload payment daemon
systemctl daemon-reload
systemctl enable payment
systemctl start payment