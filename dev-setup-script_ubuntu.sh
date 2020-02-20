#!/bin/bash
# Setup Script for a basic dev setup, to get you up and running quickly. Tested on ubuntu 16.04 till now.
# Installs:
#	z shell - Way better than the default bash. More info - 1. http://www.zsh.org/  2. https://www.howtogeek.com/362409/what-is-zsh-and-why-should-you-use-it-instead-of-bash/
#	ohmzsh - Amazing framework for managing zsh configurations. Really good features like themes and alias. More info - https://ohmyz.sh/
#	curl - Tool to fetch data from the web.
#	node - Environment to run javascript natively.
#	Git - its git.
#	sdkman - Package manager for all your sdks. Really convenient for managing different versions of sdks. More Info - https://sdkman.io/
#	visual studio code - Best code editor for frontend. More info - https://code.visualstudio.com/
#	postman - Making api calls. More info - https://www.postman.com/
#	intellij communitiy edition - IDE. More info - https://www.jetbrains.com/idea/
#	sublime-text - Awesome opensource lightweight FAST(almost vim fast) text editor for doodling. More info - https://www.sublimetext.com/




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