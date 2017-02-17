#!/bin/sh

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$(uname -s)" == "Darwin" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" #Install homebrew
    brew update                                                                                        #
    brew install macvim --override-system-vim                                                          #install updated vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim                     #install vundle
	cp ~/.vimrc ~/.vimrc.old                                                                           #backup vimrc
	cp "$DIR/.vimrc" ~                                                                                 #Add new vimrc
	vim +PluginInstall +qall                                                                           #install vundle plugins

	brew install --without-etcdir zsh                                                                  #Install zsh
	sudo echo "/usr/local/bin/zsh" >> /usr/local/bin/zsh                                               #
	chsh -s /usr/local/bin/zsh $(whoami)                                                               #make Zsh the user's shell
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"#Install oh-my-zsh
	sed -i '' "$(grep -n ZSH_THEME ~/.zshrc |cut -f1 -d:)s/.*/ZSH_THEME=\"terminalparty-matt\"/" ~/.zshrc #Setup zsh theme
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	echo "alias gcc='g++'\nplugins=(zsh-syntax-highlighting)" >> ~/.zshrc

fi

elif [ -e /etc/debian_version ]; then
	sudo apt-get update
	sudo apt-get install vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim                     #install vundle
	cp ~/.vimrc ~/.vimrc.old                                                                           #backup vimrc
	cp "$DIR/.vimrc" ~                                                                                 #Add new vimrc
	vim +PluginInstall +qall
	
	sudo apt-get install zsh
	chsh -s /usr/local/bin/zsh $(whoami)
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	ed -i '' "$(grep -n ZSH_THEME ~/.zshrc |cut -f1 -d:)s/.*/ZSH_THEME=\"terminalparty-matt\"/" ~/.zshrc
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	echo "alias gcc='g++'\nplugins=(zsh-syntax-highlighting)" >> ~/.zshrc
fi
