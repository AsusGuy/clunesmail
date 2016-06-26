#!/bin/bash

f_main(){
	clear
	echo -e "\e[1;34mWelcome to the Clunes Mail Installer!\e[0m"
	echo -e "\e[1;31m[!] During the install you will be asked to setup Postfix."
	echo ""
	echo "Please Wait..."
	sleep 5
	clear
	rm -rf /usr/share/clunesmail
	echo -e "\e[1;33mStarting Install...\e[0m"
	sleep 3
	clear
	echo -e "\e[1;33mBefore installing APT will be updated...\e[0m"
	sleep 3
	clear
	apt-get update
	sleep 3
	clear
	echo -e "\e[1;33mInstalling required dependencies...\e[0m"
	sleep 3
	clear
	apt-get --force-yes install postfix mailutils git
	sleep 3
	clear
	echo -e "\e[1;33mCloning clunesmail.sh...\e[0m"
	sleep 3
	mkdir /usr/share/clunesmail
	git clone --recursive git://github.com/asusguy/clunesmail.git /usr/share/clunesmail
	sleep 3
	clear
	echo -e "\e[1;33mInstalling command...\e[0m"
	sleep 3
	clear
	echo "alias cmail='sudo bash /usr/share/clunesmail/clunesmail.sh'" >> ~/.bashrc
	sleep 5
	clear
	echo -e "\e[1;34mInstallion Complete! \e[0m"
	echo -e "\e[1;33mPlease ensure you correctly configure Postfix.\e[0m"
	echo ""
	echo -e "\e[1;33mTo use Clunes Mail type: 'cmail' into terminal.\e[0m"
	sleep 5
	clear
	read -p "Thank You for installing Clunes Mail. Please restart terminal. Please Enter to quit..."
	clear
	exit
}

##Check if script is runnning as root/su.
if [ "$(id -u)" != "0" ]; then
        echo -e "\e[1;31m[!] This script must be run as root\e[0m" 1>&2
        exit 1
else
        f_main
fi


