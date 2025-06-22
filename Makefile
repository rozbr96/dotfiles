
SYMLINKS_TO_BE_CREATED := .bin \
													.ssh \
													.config/hypr \
													.config/kitty \
													.config/mako \
													.config/nvim \
													.config/nixpkgs \
													.config/eww \
													.config/wofi \
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

