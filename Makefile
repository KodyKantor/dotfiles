all: vim

vimrc:
	cp vim/vimrc ~/.vimrc

neobundle:
	curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
	sh install.sh
	~/.vim/bundle/neobundle.vim/bin/neoinstall
	rm install.sh

cscope-vim:
	mkdir ~/.vim/plugin
	cp vim/cscope_maps.vim ~/.vim/plugin/

vim: vimrc neobundle cscope-vim
