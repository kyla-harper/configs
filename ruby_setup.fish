######################################################################
# Install Ruby environment
######################################################################
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
set -Ux fish_user_paths ~/.rbenv/bin $fish_user_paths
~/.rbenv/bin/rbenv init
mkdir -p (rbenv root)/plugins
git clone https://github.com/rbenv/ruby-build.git (rbenv root)/plugins/ruby-build
git clone https://github.com/rbenv/rbenv-default-gems.git (rbenv root)/plugins/rbenv-default-gems

[ -f ~/.rbenv/default-gems ] && mv ~/.rbenv/default-gems ~/.rbenv/default-gems.bak
ln -s ~/Workspace/configs/rbenv/default-gems ~/.rbenv/default-gems
rbenv install (rbenv install -l | grep -v - | tail -1)
rbenv global (rbenv install -l | grep -v - | tail -1)
gem install rubocop rails haml-lint bundler
