# Environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim

# Paaaaaaaths
# fish_add_path --append ~/.local/bin

# Add things to PATH
set --prepend PATH ~/.rbenv/bin
set --prepend PATH ~/.yarn/bin

# Set up rbenv
status --is-interactive; and source (rbenv init -|psub)
