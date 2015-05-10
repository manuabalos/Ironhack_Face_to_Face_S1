class Account

	attr_accessor :user, :password, :website, :encryptacion

	def initialize(user, password, website)
		@encryptacion = false

		@user = user
		@password = encrypting(password)
		@website = website
		
		
	end

	def encrypting(password=@password)

		if @encryptacion == false
			code_encrypt = ""
			password.each_byte do |x|

				if (x+3 > 90 && x+3 < 93) || (x+3 > 122)
					x = (x+3)-25			
				else
					x = x+3
				end

				code_encrypt << x
			end
			@password = code_encrypt
			@encryptacion = true

		else
			puts "ERROR: password is already encrypted"
		end

		#puts @password
		return @password

	end

	def decrypting
		
		if @encryptacion == true
			code_desencrypt=""
			@password.each_byte do |y|

				if ((y-3 < 65) || (y-3 < 97 && y-3 > 94))
					y = (y-3)+25			
				else
					y = y-3
				end

				code_desencrypt << y
			end
			@password = code_desencrypt
			@encryptacion = false
		else
			puts "ERROR: password is already decrypted"
		end
		
		#puts @password
		return @password
	end

end

class ManagerAccount

	attr_accessor :storage

	def initialize
		@storage = []
	end

	def show_passwords

		@storage.each do |usuario|
			if usuario.encryptacion == true
				puts "--------------------------------------"
				puts "Usuario: #{usuario.user} || Password: #{usuario.password}"
				puts "--------------------------------------"	
			end		
		end

	end
end




user_manu = Account.new("Manuel", "manu", "www.ironhack.com")
user_jose = Account.new("Jose", "jose", "www.ironhack.com")
user_pedro = Account.new("Pedro", "pedro", "www.ironhack.com")

manager = ManagerAccount.new
manager.storage.push(user_manu, user_jose, user_pedro)

manager.show_passwords



