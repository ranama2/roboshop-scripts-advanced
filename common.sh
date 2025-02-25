


install_components(){
  dnf module disable $component -y
  dnf module enable $component:$component_version -y
  dnf install $component -y
}
enable_and_start_component(){
  systemctl enable $component
  systemctl start $component
}
restart_component(){
  systemctl restart $component
}
print_head(){
  echo -e "\e[36m$*\e[0m"
  echo "##############################" &>> $log_file
  echo -e "\e[36m$*\e[0m" &>> $log_file
  echo "##############################" &>> $log_file
}