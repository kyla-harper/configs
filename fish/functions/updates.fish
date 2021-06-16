# Defined in /var/folders/jw/xqymmnkj1mjggx3t09xl_65c0000gn/T//fish.JneZ6T/updates.fish @ line 2
function updates
	sudo --validate

	header Upgrade System Packages
  switch (uname)
    case Darwin
      brew update
      brew upgrade
    case Linux
      sudo rankmirrors --country United_States --api --protocols https
      pikaur -Syu
  end

  header Update Ruby Environment
  type -q rvm
  if [ $status -eq 0 ]
    rvm get stable
  end

  type -q rbenv
  if [ $status -eq 0 ]
    for plugin in (rbenv root)/plugins/*
      cd $plugin
      echo -n "Updating Rbenv plugin: " (basename (pwd))...
      git pull
      echo
    end
  end

  gem update neovim gem-ctags

  header NViM
  ~/.pyenv/versions/3.8.5/bin/python ~/.local/share/nvim/plugged/YouCompleteMe/install.py
  nvim +PlugClean! +PlugUpgrade +PlugUpdate +UpdateRemotePlugins +qa
  echo ...done

  header Global Yarn
  yarn global upgrade

  header Pip Upgrades
  pip install --upgrade pip
  pip install --upgrade pynvim

  if [ -d ~/.pyenv ]
    for py in ~/.pyenv/versions/*
      $py/bin/python -m pip install --upgrade pynvim
    end
  end

  cd ~
end
