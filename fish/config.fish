# Environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim

# Add things to PATH
type -q rbenv && set --prepend PATH ~/.rbenv/bin
set --prepend PATH ~/.yarn/bin

# Configure Environment
status --is-interactive
if [ $status -eq 0 ]
  type -q rvm && rvm default
  type -q rbenv && source (rbenv init -|psub)

  kitty + complete setup fish | source
end
