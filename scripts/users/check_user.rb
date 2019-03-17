#!/usr/bin/ruby
load "/Users/yenertuz/Desktop/ezdb/db.rb"
load "/Users/yenertuz/Desktop/ezdb/scripts/users/user.rb"

data = Db.get_data
if Db["users.#{data["username"]}.password"] == data["password"]
	print "OK"
else 
	print "No match"
end