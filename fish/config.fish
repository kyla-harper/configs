# Set the resolution
xrandr --output VGA-1 --mode 1920x1080 --output VGA-2 --below VGA-1 --mode 1920x1080

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
