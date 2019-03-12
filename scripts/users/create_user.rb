#!/usr/bin/ruby
load "/Users/yenertuz/Desktop/ruby_test/write.rb"

arg_path = ARGV[0]
body = JSON.parse(File.read(arg_path))
File.delete(arg_path)
Db.users.send(body["username"]).send("password") << body["password"]