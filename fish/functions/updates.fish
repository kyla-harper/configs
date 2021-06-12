# Defined in /tmp/fish.zzWOEr/updates.fish @ line 2
function updates
	sudo --validate

	header Upgrade System Packages
	sudo rankmirrors --country United_States --api --protocols https
	pikaur -Syu

  header Rbenv
  cd (rbenv root)
  git pull

  for plugin in (rbenv root)/plugins/*
    cd $plugin
    echo -n "Updating" (basename (pwd))...
    git pull
    echo
  end

  header NViM
  ~/.local/share/nvim/plugged/YouCompleteMe/install.py
  nvim +PlugClean! +PlugUpgrade +PlugUpdate +UpdateRemotePlugins +qa
  echo ...done

  header Pip Upgrades
  pip install --upgrade pip

  cd ~
end
