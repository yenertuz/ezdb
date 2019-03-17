#!/usr/bin/ruby
load "/var/www/ezdb/db.rb"
load "/var/www/ezdb/scripts/users/user.rb"

data = Db.get_data
if User.exists?(data["username"]) == true
	print "User already exists"
	exit
end
Db["users"] = Db["users"] + data["username"] + "\n"
Db["users." + data["username"] + ".password"] = data["password"]
print "OK"