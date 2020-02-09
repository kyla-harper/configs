# Defined in - @ line 1
function gdiffs --description 'alias gdiffs=git diff --staged'
	git diff --staged $argv;
end
