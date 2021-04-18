# Setting up a new machine
This repo sets up a new Manjaro i3 machine. To start the install:
`wget -O - https://raw.githubusercontent.com/SansSeryph/configs/master/install.sh | bash`

# To Dos
  * Logging
  * Postgres setup - grab username before creating role
  * ruby_setup.fish
    * fix reference to latest ruby version
    * remove the gem install line since default-gems will handle it
  * install.sh
    * add flags to set vm, i3, and others
    * move pavucontrol install from app install to i3 sub-header
  * other
    * fix fish prompt
      * icons
      * results
      * powerline?

# Post-Setup Reminders
  * Create a new SSH key and give it a password: `ssh-keygen`
    * Add this key to Github
