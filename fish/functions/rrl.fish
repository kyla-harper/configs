# Defined in - @ line 1
function rrl --description 'alias rrl=bundle exec rails routes | less'
	bundle exec rails routes | less $argv;
end
