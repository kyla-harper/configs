#! /bin/bash

# Update system
sudo rankmirrors --country United_States --api --protocols https
sudo pacman -Syyu

# Install Pikaur
sudo pacman -S --needed base-devel git
cd && git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri
cd .. && rm -rf pikaur/
cp ~/Workspace/configs/pikaur.conf ~/.config/

# Install Applications
pikaur -S kitty fish neovim keybase-bin keepassxc discord slack-desktop nerd-fonts-fira-code bat httpie tidy exa tmux firefox tldr python3 nodejs npm yarn

# Configure i3
rm -rf ~/.i3
cp -R ~/Workspace/configs/i3 ~/.config
cp -R ~/Workspace/configs/i3status ~/.config
cp ~/Workspace/configs/i3-scrot.conf
i3 reload

# Configure Terminal Environment (Kitty + Fish)
cp -R ~/Workspace/configs/kitty ~/.config
cp -R ~/Workspace/configs/fish ~/.config
curl -L https://get.oh-my.fish | fish
chsh -s /usr/bin/fish

# Install Ruby environment
fish
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
set -Ux fish_user_paths ~/.rbenv/bin $fish_user_paths
~/.rbenv/bin/rbenv init
mkdir -p (rbenv root)/plugins
git clone https://github.com/rbenv/ruby-build.git (rbenv root)/plugins/ruby-build
git clone https://github.com/rbenv/rbenv-default-gems.git (rbenv root)/plugins/rbenv-default-gems
cp ~/Workspace/configs/rbenv/default-gems ~/.rbenv
rbenv install (rbenv install -l | grep -v - | tail -1)
rbenv global (rbenv install -l | grep -v - | tail -1)
gem install rubocop rails haml-lint bundler

# Configure Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --user msgpack neovim
pip3 install --upgrade --user msgpack
gem install neovim
yarn global add neovim

cp -R ~/Workspace/configs/nvim ~/.config
nvim +PlugInstall +qa

# Keybase
run_keybase

# Grab the rest of the config files
cp ~/Workspace/configs/gitconfig ~/.gitconfig
cp ~/Workspace/configs/gitignore ~/.gitignore
cp ~/Workspace/configs/mimeapps.list ~/.config/
