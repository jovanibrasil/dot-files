#!/bin/bash

sudo apt-get install curl

# Git configuration

ln -sf $(pwd)/git/gitconfig ~/.gitconfig
ln -sf $(pwd)/git/gitignore_global ~/.gitignore_global

# Plugins configuration

[ -d ~/.vim ] || mkdir ~/.vim

ln -sf $(pwd)/vim/vimrc ~/.vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle && \
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

if [ "$1" == "-autocomplete" ];
then

	sudo apt-get install python-dev libxml2-dev libxslt-dev
	sudo apt-get install cmake

	git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
	cd ~/.vim/bundle/YouCompleteMe
	./install.py

fi

# TODO Terminal config

