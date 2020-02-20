#!/bin/bash
# Setup Script for a basic dev setup, to get you up and running quickly. Tested on mac OS Mojave till now.
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
# 	cowsay-trust me


if [ `echo $SHELL == "/bin/zsh"` -o `echo $SHELL == "/usr/local/bin/zsh"` ];
	then
	echo "installing cowsay. Trust me"
	brew install cowsay
	read -p "Do you want to install curl ( Required for further steps ) [y/n]: "  choice
	y="y"
	n="n"
	if [ $choice == $y ]
	then
		cowsay -s installing curl
		brew install curl
	else
		break
		cowsay -t I know I know
	fi
	cowsay -t installing ohmyzsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	# curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	sh install.sh


	read -p "Do you want to install node[y/n]: "  choice
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	cowsay -w "Installing node"
	brew install node
	node -v
	else
		break
		cowsay -t "I know I know"
	fi

	read -p "Do you want to install git[y/n]: "  choice

	y="y"
	n="n"
	if [ $choice == $y ]
	then
	cowsay -y "Installing git"
	brew install git
	else
		break
		cowsay -t "I know I know"
	fi


	read -p "Do you want to install sdkman[y/n]: "  choice
	#read -p "Enter your name : " name
	#cowsay - "Hi, $name. Let us be friends!"
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	cowsay -b "Installing sdkman"
	curl -s "https://get.sdkman.io" | bash
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	sdk version
	else
		break
		cowsay -t "I know I know"
	fi

	read -p "Do you want to install visual studio code ( note: This will install cask, which is ~200mbs, but is required for further steps )[y/n]: "  choice
	#read -p "Enter your name : " name
	#cowsay - "Hi, $name. Let us be friends!"
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	cowsay -g "Installing vscode"
	brew tap caskroom/cask
	brew cask install visual-studio-code 
	brew cleanup
	else
		break
		cowsay -t "I know I know"
	fi

	read -p "Do you want to install postman[y/n]: "  choice
	#read -p "Enter your name : " name
	#cowsay - "Hi, $name. Let us be friends!"
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	cowsay -d "Installing postman"
	brew cask install postman
	else
		break
		cowsay -t "I know I know"
	fi

	read -p "Do you want to install intellij-idea-community[y/n]: "  choice
	#read -p "Enter your name : " name
	#cowsay - "Hi, $name. Let us be friends!"
	y="y"
	n="n"
	if [ $choice == $y ]
	then
	cowsay -g "Installing intellij"
	brew cask install intellij-idea-ce
	else
		break
		cowsay -t "I know I know"
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

	echo "installing cowsay. Trust me"
	brew install cowsay
	cowsay -b installing zsh
	brew install zsh
	command -v zsh | sudo tee -a /etc/shells
	sudo chsh -s "$(command -v zsh)" "${USER}"
	cowsay -d $SHELL
	cowsay -p Logout and log back in to make zsh your default shell. This step is required for further steps. Run the script again after loggin back in
fi
