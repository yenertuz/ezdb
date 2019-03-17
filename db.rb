require "securerandom"
require "json"

def reload 
	load "./db.rb"
	return Db.new("users/yener")
end

module Db
	ABSOLUTE_PATH = "/Users/yenertuz/Desktop/ezdb/db/"

	def Db.[](key)
		if key.is_a? Symbol
			key = key.to_s 
		end
		path = ABSOLUTE_PATH + key
		to_return = File.read(path)
	rescue
		to_return = ""
	ensure
		return to_return
	end

	def Db.[]=(key, value)
		if key.is_a? Symbol 
			key = key.to_s 
		end
		path = ABSOLUTE_PATH + key
		system("rm -rRf #{path}")
		if value != ""
			File.write(path, value)
		end
	end

	def Db.uuid
		uuid = SecureRandom.uuid
		while File.file? ABSOLUTE_PATH + uuid
			uuid = SecureRandom.uuid
		end
		uuid
	end

	def Db.get_data
		arg_path = ARGV[0]
		body = JSON.parse(File.read(arg_path))
		File.delete(arg_path)
		return body
	end

end