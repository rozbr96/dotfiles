
SYMLINKS_TO_BE_CREATED := .config/hypr .gitconfig .vimrc .zprofile .zsh .zshrc.local

.ONESHELL:
.SILENT:

run: create_symlinks

create_symlinks:
	echo "Creating symlinks..."
	for fd in $(SYMLINKS_TO_BE_CREATED); do
		echo -n "Creating symlink for $$fd... "
		([[ ! -e $$HOME/$$fd ]] && ln -s $(CURDIR)/$$fd $$HOME/$$fd && echo "DONE!") || echo "SKIPPED! [already exists]"
	done

install_deps:
	echo "Installing some deps..."
	pacman -Qsq hypr | xargs yay -S --noconfirm \
    atool \
    cmake \
    cpio \
    ffmpegthumbnailer \
    highlight \
    hy3 \
    imagemagick \
    mediainfo \
    meson \
    odt2txt \
    pkg-config \
    poppler \
    python-pillow \
    python-pynvim \
    kitty \
    ranger \
    uwsm \
    vundle \
    w3m

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

