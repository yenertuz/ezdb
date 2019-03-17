#!/usr/bin/ruby
load "/var/www/ezdb/db.rb"
load "/var/www/ezdb/scripts/users/user.rb"

data = Db.get_data
if Db["users.#{data["username"]}.password"] == data["password"]
	print "OK"
else 
	print "No match"
end