# Defined in - @ line 1
function ls --description 'alias ls=ls -l --color=auto --group-directories-first --human-readable'
	command ls -l --color=auto --group-directories-first --human-readable $argv;
end
