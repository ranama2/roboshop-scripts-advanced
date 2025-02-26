source common.sh
component=redis
component_version=redis:7

print_head Configure and install redis
configure_and_install_component &>> $log_file

sed -i ‘s|127.0.0.1|0.0.0.0|’ /etc/redis/redis.conf
sed -i ‘s|protected-mode|protected-mode no|’ /etc/redis/redis.conf

print_head Enable and start redis
enable_and_start_component