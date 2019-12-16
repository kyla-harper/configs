# Defined in /tmp/fish.oXZx86/goc.fish @ line 1
function goc --description 'Open all merge conflict files'
	git diff --name-only | uniq | xargs nvim -p
end
