# Defined in - @ line 1
function rdbr --description 'alias rdbr=bundle exec rails db:rollback'
	bundle exec rails db:rollback $argv;
end
