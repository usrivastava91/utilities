#!/bin/bash
# Setup Script for dev setup. Tested on ubuntu 16.04 till now



if [ $(echo $SHELL == "/usr/bin/zsh") ]
	then

	read -p "Do you want to install curl ( Required for further steps ) [y/n]: "  choice
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	echo "Installing curl"
	sudo apt update
	sudo apt install curl
	else
		break
		echo "I know I know"
	fi

	echo "installing ohmyzsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	sh install.sh

	read -p "Do you want to install node[y/n]: "  choice
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	echo "Installing node"
	sudo apt-get install nodejs
	nodejs -v
	else
		break
		echo "I know I know"
	fi


	read -p "Do you want to install git[y/n]: "  choice

	y="y"
	n="n"
	if [ $choice == $y ]
	then
	echo "Installing git"
	sudo apt install git-all
	else
		break
		echo "I know I know"
	fi


	read -p "Do you want to install sdkman[y/n]: "  choice
	#read -p "Enter your name : " name
	#echo "Hi, $name. Let us be friends!"
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	echo "Installing sdkman"
	curl -s "https://get.sdkman.io" | bash
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	sdk version
	else
		break
		echo "I know I know"
	fi

	read -p "Do you want to install visual studio code[y/n]: "  choice
	#read -p "Enter your name : " name
	#echo "Hi, $name. Let us be friends!"
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	echo "Installing vscode"
	sudo snap install code --classic
	else
		break
		echo "I know I know"
	fi

	read -p "Do you want to install postman[y/n]: "  choice
	#read -p "Enter your name : " name
	#echo "Hi, $name. Let us be friends!"
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	echo "Installing postman"
	sudo snap install postman
	else
		break
		echo "I know I know"
	fi

	read -p "Do you want to install intellij-idea-community[y/n]: "  choice
	#read -p "Enter your name : " name
	#echo "Hi, $name. Let us be friends!"
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	echo "Installing intellij"
	sudo snap install intellij-idea-community --classic
	else
		break
		echo "I know I know"
	fi
	

else
	#read -p "Do you want to install ohmzsh (HIGHLY RECOMMENDED ! )( note: Requires installing and setting up zsh as default shell ) [y/n]: "  choice
	#if [ $choice == $y ]
	#then
		echo "Installing zsh"
		sudo apt install zsh
		#[[ "$zshVer" == *([0-9]|[a-zA-Z])* ]] && echo "$zshVer is alpha-numeric" && exit 0
		command -v zsh | sudo tee -a /etc/shells
		sudo chsh -s "$(command -v zsh)" "${USER}"
		echo $SHELL
		echo "Logout and log back in to make zsh your default shell. This step is required for further steps. Run the script again after loggin back in"
fi