# Defined in /var/folders/jw/xqymmnkj1mjggx3t09xl_65c0000gn/T//fish.RTkNIV/rdbm.fish @ line 2
function rdbm --description 'alias rdbm=bundle exec rails db:migrate'
	bundle exec rails db:migrate $argv;
	env RAILS_ENV=test bundle exec rails db:migrate $argv;
end
