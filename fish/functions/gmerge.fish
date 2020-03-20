# Defined in - @ line 1
function gmerge --wraps='git mergetool' --description 'alias gmerge=git mergetool'
  git mergetool $argv;
end
