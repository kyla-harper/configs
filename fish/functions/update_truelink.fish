# Defined in /var/folders/jw/xqymmnkj1mjggx3t09xl_65c0000gn/T//fish.ljDgpT/update_truelink.fish @ line 2
function update_truelink
  header "Starting Updates"
  cd ~/Workspace/truelink
  docker compose up -d webpack-dev-server
  echo

  header "Pull In Latest Code"
  git stash -u -m "Stashed for repo updates"
  git checkout staging
  git pull --rebase
  echo

  header "Run Upgrade Tasks"
  bundle
  yarn
  rdbm
  echo

  header "Docker Tasks"
  docker compose exec truelink_jaffe bundle && yarn
  echo

  header "Clean Up"
  git checkout db/schema.rb
  docker compose down
  docker compose up -d webpack-dev-server
  echo

  echo "Be sure to check your stash!"
end
