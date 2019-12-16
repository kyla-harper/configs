# Defined in /tmp/fish.S7NZEC/ls.fish @ line 2
function ls --description 'List contents of directory'
	set -l param --color=auto
  set -a param --group-directories-first
  set -a param --human-readable
  set -a param -l

  command ls $param $argv
end
