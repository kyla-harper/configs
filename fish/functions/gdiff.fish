# Defined in /tmp/fish.7oo1XF/gdiff.fish @ line 1
function gdiff --description 'Alias for: git diff'
	git diff --diff-algorithm=minimal --color $argv
end
