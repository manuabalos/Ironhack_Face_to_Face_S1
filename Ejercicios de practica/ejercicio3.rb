def PalindromeTwo(str)
  
  str.downcase!

  primerResultado = filtrarCadena? str
  segundoResultado = primerResultado.reverse

puts primerResultado
puts segundoResultado

  if(primerResultado == segundoResultado)
  	return true
  else
  	return false
  end

end

def filtrarCadena? str
	alfabeto = ('a'..'z').to_a
	resultado = ""

	str.each_char do |letra|
		indice = 0
		encontrado = false

		while encontrado == false && indice < 26 do
			if(letra == alfabeto[indice])
	  			resultado = resultado + letra
	  			encontrado = true
	  		end
	  		indice = indice +1
		end
	end

	return resultado
end

puts PalindromeTwo("Noel - sees Leon")  == true
puts PalindromeTwo("A war at Tarawa!")  == true