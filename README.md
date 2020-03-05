# Info
This repo is place for me to store all of my configs and OS related stuff. Use at your own risk!

# Setting up a new machine
Here's a sketch of how I set up a new Manjaro i3 machine. Eventually this will move into its own script.

## Getting started
* Update the mirrors: `sudo rankmirrors --country United_States --api --protocols https`
* Run updates: `sudo pacman -Syyu`
* Install pikaur
  * `sudo pacman -S --needed base-devel git`
  * `cd && git clone https://aur.archlinux.org/pikaur.git`
  * `cd pikaur`
  * `makepkg -fsri`

## Install and set up applications
* `pikaur kitty fish neovim keybase-bin keepassxc discord slack-desktop nerd-fonts-fira-code bat httpie tidy exa tmux`
* Kitty
  * Set up links to the stuff from the configs repo
  * Set it up as the default terminal
* Fish
  * Set up links to the stuff from the configs repo
  * Install oh-my-fish: `curl -L https://get.oh-my.fish | fish`
  * Set it up as the default shell
* Neovim
  * Install ViM Plug: `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
  * `pip2 install --user msgpack`
  * `pip3 install --user msgpack`
  * Make sure you have all install steps added here for ALE requirements
  * Install plugins: `nvim +PlugInstall +qa`

## Set up Ruby environment
* Install Rbenv:
  * Get the tool: `git clone https://github.com/rbenv/rbenv.git ~/.rbenv`
  * Add to path (fish shell): `set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths`
  * Set up rbenv: `~/.rbenv/bin/rbenv init`
* Add plugins:
  * `mkdir -p (rbenv root)/plugins`
  * ruby-build: `git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build`
* Install a Ruby version:
  * List versions: `rbenv install --list`
  * Install the latest stable one: `rbenv install [version]`
  * Set up Default Gems plugin: `git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems`
  * Copy default gems file over from configs repo to `(rbenv root)`
* Keybase:
  * Start the app: `run-keybase`
  * Enable the service: `systemctl enable --user keybase`
  * Start the service: `systemctl start --user keybase`

## Misc Items
* Copy global gitignore
* Copy scripts directory to home

## Post-Setup Reminders
* Install the latest Ruby version (and any other you might need):
  * List versions: `rbenv install --list`
  * Install the latest stable one: `rbenv install [version]`
* Create a new SSH key and give it a password: `ssh-keygen`
* Keybase: Log in and add new device
* KeepassXC: Run the app and get to the point of opening the password file
* Discord: Start and log in
* Log into Firefox account
