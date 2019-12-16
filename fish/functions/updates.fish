# Defined in /tmp/fish.8rANdL/updates.fish @ line 2
function updates
	sudo --validate

	header Upgrade System Packages
	sudo rankmirrors --country United_States,Canada --api --protocols https
	pikaur -Syu

  header Rbenv
  cd (rbenv root)
  git pull

  for plugin in (rbenv root)/plugins/*
    cd $plugin
    echo -n "Updating" (basename (pwd))...
    git pull
  end

  header NViM Plugins
  nvim +PlugClean! +PlugUpgrade +PlugUpdate +qa
  echo ...done

  cd ~
end
