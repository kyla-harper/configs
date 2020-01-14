# Defined in - @ line 1
function gpocb --description 'alias gpocb=git push origin (git branch --show-current)'
	git push origin (git branch --show-current) $argv;
end
