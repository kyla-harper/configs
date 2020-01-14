# Defined in - @ line 1
function goc --description 'alias goc=git diff --name-only | uniq | xargs nvim -p'
	git diff --name-only | uniq | xargs nvim -p $argv;
end
