# Defined in - @ line 1
function gst --description 'alias gst=git status --branch --show-stash --ignored=matching'
	git status --branch --show-stash $argv;
end
