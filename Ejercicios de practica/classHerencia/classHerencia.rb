class Car
	attr_accessor :sound
	
	def initialize sound
		@sound = sound
	end

	def make_noise
		puts @sound
	end

end

class Racing_car < Car

	def initialize
		@sound = "BROMMM"
	end

end

contenedor=[]

##### EJEMPLO CON .EACH
=begin
first_car= Car.new("broomONE")
second_car= Car.new("broomTWO")
third_car= Car.new("broomTHREE")


contenedor.push(first_car, second_car, third_car)


contenedor.each do |coche|
	
	puts "Sonido del coche: "
	coche.make_noise

end
=end


#EJEMPLO CON .MAP
=begin
sonidos = ["Broom", "Meek", "Nyan"]

contenedor_coches=sonidos.map do |sonido|
	Car.new(sonido)
end


contenedor_coches.each do |coche|
	coche.make_noise
end
=end

#EJEMPLO .REDUCE

sonidos = ["Broom", "Meek", "Nyan"]

contenedor_coches=sonidos.map do |sonido|
	Car.new(sonido)
end

contenedor_sonido=contenedor_coches.reduce('') do |a, b|
	a << b.sound
end

puts contenedor_sonido





