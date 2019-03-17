module User
	def User.exists?(username)
		if Db["users." + username + ".password"] == ""
			return false
		end
		true
	end
end