#
# Minimal makefile so I can forget how all of this works.
#

# If I ever get tired of a minimal vim setup, we could change this to be
# something like
# VIM_FILES =	$(VIM_PLUGINS) \
#		$(VIM_CONFIG) \ ... etc

VIM_DIRS =	~/.vim \
		~/.vim/bundle \
		~/.vim/colors

VIM_FILES =	~/.vimrc \
		~/.vim/bundle/Vundle.vim \
		~/.vim/colors/molokai.vim

CP_FILES =	~/.vimrc \
		~/.gitconfig \
		${WINDOWS_TERMINAL_CONF}

CP_FILE =  @echo "copying $^" && cp $^ $@

WINDOWS_TERMINAL_CONF = $(wildcard /mnt/c/Users/${USER}/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json)

#
# meta targets
#
.PHONY: all
all: vim git zsh windows

.PHONY: vim
vim: $(VIM_DIRS) $(VIM_FILES)

.PHONY: git
git: ~/.gitconfig

.PHONY: zsh
zsh: ~/.zshrc

.PHONY: windows
windows: ${WINDOWS_TERMINAL_CONF}

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
~/.vim/bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

~/.vim/colors/molokai.vim: vim/molokai.vim
	$(CP_FILE)

~/.gitconfig: git/gitconfig
	$(CP_FILE)

~/.zshrc: zsh/zshrc
	$(CP_FILE)

${WINDOWS_TERMINAL_CONF}: windows/windows_terminal_settings.json
	$(CP_FILE)
