# Kitty
kitty + complete setup fish | source

# Environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim

# Add things to PATH
set --prepend PATH ~/.rbenv/bin
set --prepend PATH ~/.yarn/bin

# Set up rbenv
status --is-interactive; and source (rbenv init -|psub)

# tmux
set -gx TERM xterm-256color
