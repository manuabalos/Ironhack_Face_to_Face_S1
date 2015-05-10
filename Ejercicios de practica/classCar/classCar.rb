class Car

	def initialize sound
		@sound = sound
		
		IO.write("cars.txt", Car.read_file+1)
	end

	def make_noise
		puts @sound
	end

	def self.read_file
		IO.read("cars.txt").to_i
	end

	def self.show_total_cars
		puts "Total cars: #{read_file}"
	end


end


first_car = Car.new "Foommm!"
first_car.make_noise

second_car = Car.new "Soommm!"
second_car.make_noise

Car.show_total_cars
