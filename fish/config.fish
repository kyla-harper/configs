# Start the wireless app
nm-applet &

# Kitty
kitty + complete setup fish | source

# Environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim

# Only for Android Studio -- might not even need it?
set -gx JAVA_HOME /usr/lib/jvm/java-8-openjdk/

# Add things to PATH
set --prepend PATH ~/.rbenv/bin
set --prepend PATH ~/.yarn/bin

# Set up rbenv
status --is-interactive; and source (rbenv init -|psub)

# tmux
set -gx TERM xterm-256color
