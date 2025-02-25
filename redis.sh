source common.sh
component=redis

print_head Configure and install redis
dnf module disable redis -y &>> $log_file
dnf module enable redis:7 -y &>> $log_file
dnf install redis -y


sed -i ‘s|127.0.0.1|0.0.0.0|’ /etc/redis/redis.conf
sed -i ‘s|protected-mode|protected-mode no|’ /etc/redis/redis.conf

print_head Enable and start redis
enable_and_start_component