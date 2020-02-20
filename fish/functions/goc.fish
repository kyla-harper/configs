# Defined in /tmp/fish.CekcCE/goc.fish @ line 2
function goc --description 'alias goc=git diff --name-only | uniq | xargs nvim'
	git diff --name-only | uniq | xargs nvim $argv;
end
