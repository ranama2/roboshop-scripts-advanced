


configure_and_install_component(){
  dnf module disable $component -y
  dnf module enable $component_version -y
  dnf install $component -y
}
install_component(){
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
  echo "##############################"
}
configure_and_install_nodejs(){
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y
}
configure_component(){
  rm -rf /app
  useradd roboshop
  mkdir /app
  curl -o $destination $url
  cd /app
  unzip /tmp/catalogue.zip
  cd /app
  npm install
}
reload_daemon(){
  systemctl daemon-reload
}