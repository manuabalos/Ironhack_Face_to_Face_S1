require 'colorize'
require 'ruby-progressbar'
# ===================================================================================================== #
#    ________                                       _____  __________                                	#
#   /  _____/_____    _____   ____   ______   _____/ ____\ \______   \ ____   ____   _____   ______     #
#  /   \  ___\__  \  /     \_/ __ \ /  ___/  /  _ \   __\   |       _//  _ \ /  _ \ /     \ /  ___/     #
#  \    \_\  \/ __ \|  Y Y  \  ___/ \___ \  (  <_> )  |     |    |   (  <_> |  <_> )  Y Y  \\___ \      #
#   \______  (____  /__|_|  /\___  >____  >  \____/|__|     |____|_  /\____/ \____/|__|_|  /____  >     #
#          \/     \/      \/     \/     \/                         \/                    \/     \/      #
# ===================================================================================================== #
#
# Realizado por: Manuel Ábalos Serrano
# Descripción: Juego de rol, cuyo objetivo es ir avanzando por cada una de las salas y llegar hasta final.
#
# =====================================================================================================

class Menu

	def start_game
		pid = fork{ exec 'afplay', "music/theme.mp3" } # Play for MAC
		#pid = fork{ exec 'mpg123','-q', "music/theme.mp3" } #Play for Windows
		system("clear")

		################ TITTLE #####################
		print IO.read("img/titulo.txt").blue.on_yellow
		###########################################
		progressbar = ProgressBar.create
		 
		print "#                                    ".blue.on_yellow
		print "... L O A D I N G   G A M E ...".blue.on_yellow.blink
		print "                                    #".blue.on_yellow
		puts ""
		53.times do
			progressbar.increment
			sleep 0.07
		end

		system("clear")
		print IO.read("img/titulo.txt").blue.on_yellow
		print "#                                    ".blue.on_yellow
		print " ... G A M E  L O A D E D ...  ".blue.on_yellow
		print "                                    #".blue.on_yellow


		print "\n#                                   ".blue.on_yellow
		print "[ Press ENTER key to continue ]".blue.on_yellow.blink
		print "                                     #".blue.on_yellow
		gets.chomp
		system("clear")
	end

	def menu_game
		print IO.read("img/titulo.txt").blue.on_yellow
		print IO.read("img/header.txt").blue.on_yellow
		print ("\n")

		puts "#                                                                                                       #".blue.on_yellow.swap
		puts "#                                        1. [ N E W  G A M E ]                                          #".blue.on_yellow.swap
		puts "#                                       2. [ L O A D  G A M E ]                                         #".blue.on_yellow.swap
		puts "#                                     3. [ O P T I O N S  G A M E ]                                     #".blue.on_yellow.swap
		puts "#                                       4. [ E X I T  G A M E ]                                         #".blue.on_yellow.swap
		puts "#                                                                                                       #".blue.on_yellow.swap
		puts "# ===================================================================================================== #".blue.on_yellow
		puts "#                             ©2015 Ironhack Entertainment. All rights reserved.                        #".blue.on_yellow	
		puts "# ===================================================================================================== #".blue.on_yellow

		puts "\n# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #".colorize(:color => :blue)
		print "\t\t\t\t\t Choose one option: ".blink
		option_menu = gets.chomp

			choose_option option_menu
	end

	def choose_option option_menu

		case option_menu
			when "1"
				system("clear")
				new_game	

			when "2"
				load_game
			
			when "3"
				options_game

			when "4"
			
			else
				print "\t\t   Wrong option! Please, press ENTER key and choose a new option.".colorize(:color => :blue)
				gets.chomp
				system("clear")
				menu_game

		end

	end

	def default_rooms

		room1 = Room.new(1," You are in the 1º room.",{:S => 2},["Health Potion"])
		room2 = Room.new(2," You are in the 2º room.",{:W => 3, :E => 4},["Sword","Shield"])
		room3 = Room.new(3," You are in the 3ª room.",{:S => 5, :E => 2},[])
		room4 = Room.new(4," You are in the 4ª room.",{:S => 6, :W => 2},[])
		room5 = Room.new(5," You are in the 5ª room.",{:N => 3, :S => 7},["Golden Key"])
		room6 = Room.new(6," You are in the 6ª room.",{:N => 4, :S => 9},[])
		room7 = Room.new(7," You are in the 7ª room.",{:N => 5, :E => 8},["Mana Potion"])
		room8 = Room.new(8," You are in the 8ª room.",{:W => 7, :E => 9, :S =>10},["Heavy Armor","Leather Glooves"])
		room9 = Room.new(9," You are in the 9ª room.",{:N => 6, :W => 8},["Selfie Stick"])
		room10 = Room.new(10," You are in the 10ª room.",{:N => 8},[])

		@game_of_room = Game.new(@user)
		@game_of_room.add_room room1
		@game_of_room.add_room room2
		@game_of_room.add_room room3
		@game_of_room.add_room room4
		@game_of_room.add_room room5
		@game_of_room.add_room room6
		@game_of_room.add_room room7
		@game_of_room.add_room room8
		@game_of_room.add_room room9
		@game_of_room.add_room room10

	end

	def new_game

		print IO.read("img/titulo.txt").blue.on_yellow.swap
		print IO.read("img/header.txt").blue.on_yellow.swap
		print ("\n\n  Enter your char name: ")
		user_name = gets.chomp
		@user = User.new(user_name, 1)
		puts "\n\t     -----------------------------------------------------------------------------------"
		puts "\t\tWelcome #{user_name}! You adventure begin here. Are you ready? 3, 2, 1... Let's go!"
		print "\t\t\t    Don't look behind of you.".colorize(:color => :red); print " Press ENTER key to start.".blink
		puts "\n\t     -----------------------------------------------------------------------------------"
		gets.chomp

		default_rooms
		@game_of_room.play

	end

	def load_game
		file_contents = IO.read("save.txt")
		loading_game = file_contents.split("\n")
		@user = User.new(loading_game[0], loading_game[1].to_i)
		default_rooms
		@game_of_room.play
	end

	def options_game

	end


end

class Game
	attr_accessor :rooms
	def initialize character
		@rooms = []
		@character = character
	end

	def add_room room
		@rooms << room
	end

	def show_room id
		system("clear")
		print IO.read("img/titulo.txt").blue.on_yellow.swap
		print IO.read("img/header.txt").blue.on_yellow.swap

		room = @rooms.find{|room| id == room.id }
        	puts ("\n\n# ------------------------------------------   ROOM NUMBER #{room.id}   ---------------------------------------- #").colorize(:background => :cyan)
        	puts "\n#{room.message}"
        	puts (" Posibles direcciones: #{room.paths}")
        	

        	if(room.id == 10)
        		@playing =false
        		@let_move = true
        		puts "\n# ***************************************************************************************************** #".blue.on_yellow
        		puts "# ************************************* CONGRATULATIONS! YOU WIN! ************************************* #".blue.on_yellow
        		puts "# ***************************************************************************************************** #".blue.on_yellow
        		puts ""
        	end

	end

	def get_direction
		print "\n  What's is your action? >> ".colorize(:background => :light_cyan)
		action = gets.chomp #### CAMBIARLO A CASE
			if action == "pick object"
			 	pick_object
			elsif action == "drop object"
				drop_object
			elsif action == "save game"
				save_game
			elsif action != "N" && action != "S" && action != "W" && action !="E"
				puts "~~~ #{@character.user} look at you confused and say: WTF! Are you kidding me?"
			else
				@pick_object = false
				@drop_object = false
			end

		return action
	end

	def save_game
		puts "\n#{@character.user} feel tired... and begin to save the game."
		print "...3"
		sleep 1
		print "...2"
		sleep 1
		print "...1"
		sleep 1
		print " #{@character.user} saved the game sucessfully!\n"
		IO.write("save.txt", "#{@character.user}\n#{@character.position}\n#{@character.inventory}")
	end

	def pick_object

	 	num_room_actually = @character.position
	 	room = @rooms.find{|room| num_room_actually == room.id }
	 		
	 		if room.objects != [] # Si hay objetos en la habitación, los muestra.
	 		puts "\n# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #"
	 		puts "In this room, there are these objects:  "
	 		
		 		room.objects.each_with_index do |object, index|
		 				puts "#{index+1}) #{object}" 
		 		end

			 	puts "# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #"
		 		print "Which of these objects do you want to pick up? (Input number): "
		 		the_object = gets.chomp

		 		# Añadimos el objeto al inventario
		 		@character.inventory.push(room.objects[the_object.to_i-1])
		 		@pick_object = true
		 		puts "~~~ The object has been pick up!"
		 		# Eliminamos el obejto de la habitacion
		 		room = @rooms.find{|room| num_room_actually == room.id }
		 			room.objects.each_with_index do |object, index|
		 				if (the_object.to_i-1) == index
		 					room.objects.delete(object)
		 				end
		 			end
		 	else # En el caso de que no haya objetos en la habitación.
		 		puts "~~~ There aren't any objects in this room."
	 		end
	 		
	end

	def drop_object
		
		if @character.inventory != []
			puts "--- You have these object in your inventory."
			@character.inventory.each_with_index do |objeto, index|
				puts "#{index+1}) #{objeto}"
			end

			puts "# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #"
			print "Which of your objects do you want to drop? (Input number): "
			the_object = gets.chomp

			#Añadimos el objeto a la habitacion
			num_room_actually = @character.position
			room = @rooms.find{|room| num_room_actually == room.id }
				room.objects.push(@character.inventory[the_object.to_i-1])
				@drop_object= true
				puts "~~~ The object was drop!"
			#Eliminamos el objeto de nuestro inventario
			@character.inventory.each_with_index do |object, index|
			 	if (the_object.to_i-1) == index
					@character.inventory.delete(object)
				end
			end
		else
			puts "~~~ There aren't any object in your inventory."
		end
	end

    def execute_direction direction
		# Coger direccion indicada para querer moverse (N, S, E o W)
		# Recorre las salidas de la habitacion en la que se encuentra
		# Si coincide con la direccion indicada 
		# Cambia de habitacion @character.position --> .position es un numero

		# Cogemos el numero de habitacion donde le PJ se encuentra.
		num_room_actually = @character.position

		#Cogemos que la salida coincida con la direccion inidicada
		# y cogemos el numero de la siguiente habitacion

		let_move = false
		room = @rooms.find{|room| num_room_actually == room.id }
			room.paths.each do |coordinate, path|
				if(direction == coordinate.to_s)
					@character.position = path
					print "#{@character.user} is slowly opening the door...".blink
					sleep 4
					let_move = true
				end

			end

			if let_move == false && (@pick_object == false || @drop_object == false)
				puts "~~~ You have to search another path to continue. "

			end
		return let_move

	end

	def play

		@playing = true
		
		while @playing
			@let_move = false
			show_room @character.position
			while !@let_move
				direction = get_direction
				@let_move = execute_direction direction
			end
			#playing = false
		end
	end
end

class Room
	attr_accessor :id, :message, :paths, :objects
	def initialize(id, message, paths, objects)
		@id = id
		@message = message
		@paths = paths
		@objects = objects
	end
end

class User
	attr_accessor :user, :position, :inventory
	def initialize(user, position)
		@user=user
		@position= position #El nº de habitacion en el que se encuentra
		@inventory = []
	end
end

Menu = Menu.new
Menu.start_game
Menu.menu_game



