def NumberEncoding(str)

resultado = ""

	str.each_char do |current_element|

		check_letter = is_in_alphabet? current_element, resultado


		if check_letter == false
			resultado << current_element
		end

	end

	puts resultado;

end

def is_in_alphabet? current_element, resultado

	alphabet = ('a'..'z').to_a
	
	found_letter = false

	indice = 0

	while found_letter == false && indice < 26  do
		if current_element == alphabet[indice]
			resultado << (indice+1).to_s
			found_letter = true;
		end
		indice = indice + 1
	end

	return found_letter;	
end

NumberEncoding("hello 45")
NumberEncoding("jaj-a")
