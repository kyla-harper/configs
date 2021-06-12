# Defined in /tmp/fish.sgArGS/railsProj.fish @ line 1
function railsProj
  header "Starting a new Rails / React project!"

  cd ~/Workspace
  rails new $argv
  cd $argv

  git add .
  git commit -m "Initial commit"
  git checkout -B main
  git branch -D master

  bundle add haml-rails react-rails
  bundle add --group development rubocop rubocop-performance rubocop-rails \
     rubocop-rake rubocop-rspec solargraph
  bundle add --group development,test factory_bot_rails rspec-rails
  yarn add --dev eslint eslint-plugin-react eslint-plugin-jsx-a11y \
     eslint-plugin-jest eslint-plugin-import eslint-plugin-promise \
     eslint-plugin-react-hooks jest @testing-library/react

  rails g rspec:install
  rails haml:erb2haml

  rails webpacker:install:react
  rails g react:install

  echo
  echo "Don't forget to..."
  echo "* copy the rubocop and eslintrc yaml files..."
  echo "* edit the rails_helper and gemfile"
  echo

  header "Done!"
end
