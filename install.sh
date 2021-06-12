#! /bin/bash

######################################################################
# Update System
######################################################################
sudo rankmirrors --country United_States,Canada --api --protocols https
sudo pacman -Syyu --noconfirm

######################################################################
# VirtualBox Setup
######################################################################
sudo pacman -S --noconfirm --needed virtualbox-guest-utils xf86-video-vmware
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
[[ -f ~/.config/pikaur.conf ]] && mv ~/.config/pikaur.conf ~/.config/pikaur.conf.bak
ln -s ~/Workspace/configs/pikaur.conf ~/.config/

######################################################################
# Install Applications
######################################################################
pikaur -S --needed --noconfirm kitty fish neovim nerd-fonts-fira-code bat tidy \
  exa tmux firefox tldr nodejs npm yarn postgresql pavucontrol python          \
  python-pip languageclient-neovim ctags

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
# Install Ruby environment
######################################################################
fish ~/Workspace/configs/ruby_setup.fish

######################################################################
# Configure Terminal Environment (Kitty + Fish)
######################################################################
[[ -d ~/.config/kitty ]] && mv ~/.config/kitty ~/.config/kitty_bak
ln -s ~/Workspace/configs/kitty ~/.config/kitty

[[ -d ~/.config/fish ]] && mv ~/.config/fish ~/.config/fish_bak
ln -s ~/Workspace/configs/fish ~/.config/fish

chsh -s /bin/fish

######################################################################
# Postgres Setup
######################################################################
sudo systemctl enable postgresql
sudo -iu postgres
initdb -D /var/lib/postgres/data
exit

sudo systemctl start postgresql
sudo -iu postgres
createuser --createdb --createrole --superuser sansseryph
exit

######################################################################
# Configure Neovim
######################################################################
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip install --user msgpack neovim pynvim
pip install --upgrade --user msgpack pynvim
yarn global add neovim

[[ -d ~/.config/nvim ]] && mv ~/.config/nvim ~/.config/nvim_bak
ln -s ~/Workspace/configs/nvim ~/.config/nvim
nvim +PlugInstall +UpdateRemotePlugins +qa

######################################################################
# Git Configs
######################################################################
[[ -f ~/.gitconfig ]] && mv ~/.gitconfig ~/.gitconfig.bak
ln -s ~/Workspace/configs/gitconfig ~/.gitconfig

[[ -f ~/.gitignore ]] && mv ~/.gitignore ~/.gitignore.bak
ln -s  ~/Workspace/configs/gitignore ~/.gitignore

[[ -f ~/.git_template ]] && mv ~/.git_template ~/.git_template.bak
ln -s  ~/Workspace/configs/git_template ~/.git_template

######################################################################
# Grab the rest of the config files
######################################################################
[[ -f ~/.config/mimeapps.list ]] && mv ~/.config/mimeapps.list ~/.config/mimeapps.list.bak
ln -s ~/Workspace/configs/mimeapps.list ~/.config/mimeapps.list

[[ -f ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.tmux.conf.bak
ln -s ~/Workspace/configs/tmux.conf ~/.tmux.conf

######################################################################
# End of install messages
######################################################################
echo "Change your password to something more secure!"
echo "Be sure to create your ssh files: ssh-keygen"
echo "Add your ssh key file to Github: https://github.com"
echo "Run vim's :checkhealth command and fix that stuff"
