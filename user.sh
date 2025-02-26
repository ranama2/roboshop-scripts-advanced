source common.sh
component=user
destination=/tmp/user.zip
url=https://roboshop-artifacts.s3.amazonaws.com/user-v3.zip

cp user.service /etc/systemd/system/user.service

print_head Install nodejs 20
configure_and_install_nodejs &>> $log_file

print_head Configure and install component
configure_component &>> $log_file



print_head Reload daemon
reload_daemon &>> $log_file

print_head Restart user
enable_and_start_component &>> $log_file