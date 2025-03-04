source common.sh
component=cart
destination=/tmp/cart.zip
url=https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip

cp cart.service /etc/systemd/system/cart.service

print_head Install nodejs 20
configure_and_install_nodejs &>> $log_file

print_head Configure and install component
configure_component &>> $log_file



print_head Reload daemon
reload_daemon &>> $log_file

print_head Restart user
enable_and_start_component &>> $log_file