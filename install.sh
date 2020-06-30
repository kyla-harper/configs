#! /bin/bash

######################################################################
# Update System
######################################################################
sudo rankmirrors --country United_States,Cananda --api --protocols https
sudo pacman -Syyu --noconfirm

######################################################################
# VirtualBox Setup
######################################################################
sudo pacman -S --noconfirm virtualbox-guest-utils xf86-video-vmware
sudo systemctl enable vboxservice
sudo systemctl start vboxservice
VBoxClient-all

######################################################################
# Prepare the Environment
######################################################################
sudo pacman -S --needed --noconfirm base-devel git
mkdir -p ~/Workspace
git clone https://github.com/SansSeryph/configs Workspace/configs

######################################################################
# Install Pikaur
######################################################################
git clone https://aur.archlinux.org/pikaur.git ~/pikaur
cd ~/pikaur
makepkg -fsri --noconfirm --needed
cd && rm -rf ~/pikaur/
[[ -f ~/.configs/pikaur.conf ]] && mv ~/.configs/pikaur.conf ~/.configs/pikaur.conf.bak
ln -s ~/Workspace/configs/pikaur.conf ~/.config/

######################################################################
# Install Applications
######################################################################
pikaur -S --noconfirm kitty fish neovim nerd-fonts-fira-code bat tidy exa tmux firefox tldr python3 nodejs npm yarn postgresql pavucontrol

######################################################################
# Configure i3
######################################################################
[[ -d ~/.config/i3 ]] && mv ~/.config/i3 ~/.config/i3_bak
ln -s ~/Workspace/configs/i3 ~/.config/i3

[[ -d ~/.config/i3status ]] && mv ~/.config/i3status ~/.config/i3status_bak
ln -s ~/Workspace/configs/i3status ~/.config/i3status

[[ -f ~/.config/i3-scrot.conf ]] && mv ~/.config/i3-scrot.conf ~/.config/i3-scrot.conf.bak
ln -s ~/Workspace/configs/i3-scrot.conf ~/.config/i3-scrot.conf
i3 reload

######################################################################
# Configure Terminal Environment (Kitty + Fish)
######################################################################
[[ -d ~/.config/kitty ]] && mv ~/.config/kitty ~/.config/kitty_bak
ln -s ~/Workspace/configs/kitty ~/.config/kitty

[[ -d ~/.config/fish ]] && mv ~/.config/fish ~/.config/fish_bak
ln -s ~/Workspace/configs/fish ~/.config/fish
curl -L https://get.oh-my.fish | fish
chsh -s /usr/bin/fish

######################################################################
# Install Ruby environment
######################################################################
fish ruby_setup.fish

######################################################################
# Postgres Setup
######################################################################
sudo systemctl enable postgresql
sudo systemctl start postgresql
sudo -iu postgres
initdb -D /var/lib/postgres/data
createuser --createdb --createrole --superuser kharper
exit # leave the psql shell

######################################################################
# Configure Neovim
######################################################################
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --user msgpack neovim
pip3 install --upgrade --user msgpack
gem install neovim
yarn global add neovim

[[ -d ~/.config/nvim ]] && mv ~/.config/nvim ~/.config/nvim_bak
ln -s ~/Workspace/configs/nvim ~/.config/nvim
nvim +PlugInstall +qa

######################################################################
# Grab the rest of the config files
######################################################################
[[ -f ~/.gitconfig ]] && mv ~/.gitconfig ~/.gitconfig.bak
ln -s ~/Workspace/configs/gitconfig ~/.gitconfig

[[ -f ~/.gitignore ]] && mv ~/.gitignore ~/.gitignore.bak
ln -s  ~/Workspace/configs/gitignore ~/.gitignore

[[ -f ~/.config/mimeapps.list ]] && mv ~/.config/mimeapps.list ~/.config/mimeapps.list.bak
ln -s ~/Workspace/configs/mimeapps.list ~/.config/mimeapps.list
