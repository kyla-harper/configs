# Defined in - @ line 1
function rdbm --description 'alias rdbm=bundle exec rails db:migrate'
	bundle exec rails db:migrate $argv;
end
