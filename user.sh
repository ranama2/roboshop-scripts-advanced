source common.sh
component=user

print_head Install nodejs 20
configure_and_install_nodejs &>> $log_file

print_head Configure and install component
configure_component

cp user.service /etc/systemd/system/user.service

print_head Reload daemon
reload_daemon &>> $log_file

print_head Restart user
enable_and_start_component &>> $log_file