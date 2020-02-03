#
# Minimal makefile so I can forget how all of this works.
#

# If I ever get tired of a minimal vim setup, we could change this to be
# something like
# VIM_FILES =	$(VIM_PLUGINS) \
#		$(VIM_CONFIG) \ ... etc

VIM_DIRS =	~/.vim \
		~/.vim/plugin

VIM_FILES =	~/.vimrc \
		~/.vim/bundle/neobundle.vim/plugin/neobundle.vim \
		~/.vim/plugin/cscope_maps.vim

CP_FILES =	~/.vimrc \
		~/.vim/plugin/cscope_maps.vim \
		~/.gitconfig

CP_FILE =  @echo "copying $^" && cp $^ $@

#
# meta targets
#
.PHONY: all
all: vim git

.PHONY: vim
vim: $(VIM_DIRS) $(VIM_FILES)

.PHONY: git
git: ~/.gitconfig

#
# convenience targets
#
$(VIM_DIRS):
	mkdir $@


#
# 'real' targets
#
~/.vimrc: vim/vimrc
	$(CP_FILE)

# This neobundle.vim file is something that the install process spits out. I
# don't know if there's a better file to target.
~/.vim/bundle/neobundle.vim/plugin/neobundle.vim:
	curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
	sh install.sh
	~/.vim/bundle/neobundle.vim/bin/neoinstall
	rm install.sh

~/.vim/plugin/cscope_maps.vim: vim/cscope_maps.vim
	$(CP_FILE)

~/.gitconfig: git/gitconfig
	$(CP_FILE)
