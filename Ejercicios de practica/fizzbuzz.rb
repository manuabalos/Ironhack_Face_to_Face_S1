def FizzBuzz(num1, num2, reglas)
	resultado = ""

	for i in num1..num2
		esDivisible = false

		reglas.each do |key, value|
			if divisible? i,key
				resultado = resultado + value
				esDivisible = true
			end
		end

		if (esDivisible == false)
			puts i
		else
			puts resultado
		end
		resultado = ""
	end


end

def divisible? i,numero
	i%numero.to_i == 0
end

def introducirReglas()
	numero = ""
	reglas = {}
	puts "--------------------------------"
	puts "       INTRODUCIR REGLAS        "
	puts "--------------------------------"

	while numero!="0" do
	
		puts "Introduzca el numero por el que debe de ser divisible (0 para Salir): "
		numero = gets.chomp

		if(numero != "0")
			puts ("Introduzca el texto que saldra al ser divisible por ese numero: ")
			texto = gets.chomp
			reglas[numero]=texto
		end


	end

	#reglas.each do |key, value|
	#puts "#{key} ---> #{value}"
	#end

	return reglas	
end





reglas = introducirReglas()
FizzBuzz(1,100,reglas)