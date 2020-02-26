# Defined in - @ line 1
function ls --description 'alias ls=exa --long --git --group-directories-first --color=always'
	exa --long --git --group-directories-first --color=always $argv;
end
