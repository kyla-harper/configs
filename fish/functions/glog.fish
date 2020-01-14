# Defined in - @ line 1
function glog --description 'alias glog=git log --decorate --oneline --graph -n 15'
	git log --decorate --oneline --graph -n 15 $argv;
end
