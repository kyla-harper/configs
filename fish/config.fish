# Start the wireless app
nm-applet &

# Kitty
kitty + complete setup fish | source

# Environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim

# Add things to PATH
set --prepend PATH /home/kharper/.rbenv/bin
status --is-interactive; and source (rbenv init -|psub)

set --prepend PATH ~/.yarn/bin
