#!/bin/bash
# Setup Script for dev setup. Tested on ubuntu 16.04 till now


if [ `echo $SHELL == "/bin/zsh"` ];
	then
	read -p "Do you want to install curl ( Required for further steps ) [y/n]: "  choice
	y="y"
	n="n"
	if [ $choice == $y ]
	then
		echo "installing curl"
		brew install curl
	else
		break
		echo "I know I know"
	fi
	echo "installing ohmyzsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	# curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	sh install.sh


	read -p "Do you want to install node[y/n]: "  choice
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	echo "Installing node"
	brew install node
	node -v
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
	brew install git
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

	read -p "Do you want to install visual studio code ( note: This will install cask, which is ~200mbs, but is required for further steps )[y/n]: "  choice
	#read -p "Enter your name : " name
	#echo "Hi, $name. Let us be friends!"
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	echo "Installing vscode"
	brew tap caskroom/cask
	brew cask install visual-studio-code 
	brew cleanup
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
	brew cask install postman
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
	brew cask install intellij-idea-ce
	else
		break
		echo "I know I know"
	fi
	


else

	read -p "This script requires homebrew to run. Do you have homebrew installed? [y/n]: "  choice
	y="y"
	n="n"

	if [ $choice == $y ]
		then
		break
	else
		exit
	fi

	echo "installing zsh"
	brew install zsh
	command -v zsh | sudo tee -a /etc/shells
	sudo chsh -s "$(command -v zsh)" "${USER}"
	echo $SHELL
	echo "Logout and log back in to make zsh your default shell. This step is required for further steps. Run the script again after loggin back in"
fi
