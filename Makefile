
SYMLINKS_TO_BE_CREATED := .config/hypr \
													.gitconfig \
													.vimrc \
													.zprofile \
													.zsh \
													.zshrc.local

.ONESHELL:
.SILENT:

run: create_symlinks

create_symlinks:
	echo "Creating symlinks..."
	for fd in $(SYMLINKS_TO_BE_CREATED); do
		echo -n "Creating symlink for $$fd... "
		([[ ! -e $$HOME/$$fd ]] && ln -s $(CURDIR)/$$fd $$HOME/$$fd && echo "DONE!") || echo "SKIPPED! [already exists]"
	done

install: install_yay \
	install_hyprland \
	install_ranger \
	install_vim \
	install_vim_plugins

install_hyprland:
	echo "Installing hyprland..."
	pacman -Qsq hypr | xargs yay -S --noconfirm \
    cmake \
    cpio \
    hy3 \
    meson \
    pkg-config \
    kitty \
    uwsm

install_ranger:
	echo "Installing ranger..."
	yay -S --noconfirm \
    atool \
    ffmpegthumbnailer \
    highlight \
    imagemagick \
    mediainfo \
    odt2txt \
    poppler \
    python-pillow \
    ranger \
    w3m

install_vim:
	echo "Installing vim..."
	yay -S --noconfirm \
    python-pynvim \
		vim \
    vundle

install_vim_plugins:
	echo "Installing VIM plugins..."
	vim +PluginInstall +qall
	echo "DONE INSTALLING VIM PLUGINS!"

install_yay:
	echo "Installing yay..."
	sudo pacman -S --noconfirm go
	mkdir -p tmp
	cd tmp
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
	tar -zxvf yay.tar.gz
	cd yay
	yes | makepkg -sri
	cd ../..
	sudo rm -rf tmp
	echo "DONE INSTALLING YAY!"

