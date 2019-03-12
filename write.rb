require "securerandom"
require "json"

def reload 
	load "./write.rb"
	return Db.new("users/yener")
end

class Db
	ABSOLUTE_PATH = "/Users/yenertuz/Desktop/ruby_test/db"

	def initialize(path)
		@path = path
		@full_path = ABSOLUTE_PATH + "/" + @path
	end

	def <<(value)
		system("rm -rRf #{@full_path}")
		return if value == ""
		system("mkdir -p #{@full_path} && printf 1 > #{@full_path + "/.self"}")
		File.write(@full_path + "/.self", value)
	end

	def []
		keys = fetch_keys(@full_path)
		if keys.empty? == false
			return read_recursively(keys)
		end
		File.read(@full_path + "/.self")
	rescue
		return ""
	end

	def method_missing(*args)
		method_name = args[0]
		new_path = @path + "/" + method_name.to_s
		Db.new(new_path)
	end

	def self.method_missing(*args)
		method_name = args[0].to_s
		Db.new(method_name)
	end

	def !
		new_path = @path.split("/")[0...-1].join("/")
		Db.new(new_path)
	end

	private

	def fetch_keys(path)
		dir_contents = Dir.entries(path)
		dir_contents.reject! { |x| [".", "..", ".self"].include?(x)  }
		return dir_contents
	end

	def read_recursively(keys)
		contents = {}
		keys.each do |x|
			x = x.to_sym
			key = self.send(x)
			contents[x] = key[]
		end
		return contents
	end

end