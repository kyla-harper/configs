######################################################################
# Install Ruby environment
######################################################################

# Initialize Rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
set -Ux fish_user_paths ~/.rbenv/bin $fish_user_paths
~/.rbenv/bin/rbenv init

# Add Plugins
mkdir -p (rbenv root)/plugins
git clone https://github.com/rbenv/ruby-build.git (rbenv root)/plugins/ruby-build
git clone https://github.com/rbenv/rbenv-default-gems.git (rbenv root)/plugins/rbenv-default-gems
git clone git://github.com/tpope/rbenv-ctags.git (rbenv root)/plugins/rbenv-ctags

[ -f ~/.rbenv/default-gems ] && mv ~/.rbenv/default-gems ~/.rbenv/default-gems.bak
ln -s ~/Workspace/configs/rbenv/default-gems ~/.rbenv/default-gems

# Get the lastest Ruby
rbenv install (rbenv install --list-all | grep -v - | tail -1)
rbenv global (rbenv install --list-all | grep -v - | tail -1)
