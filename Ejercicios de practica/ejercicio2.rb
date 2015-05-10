def NumberEncoding(str)

  alfabeto = ('a'..'z').to_a
  
  resultado = ""

  str.each_char do |letra|
  encontrado =false
  # alfabeto.index(letra) De esta forma se puede sustituir el while
		indice = 0
		while encontrado == false && indice < 26 do
			if(letra == alfabeto[indice])
	  			resultado = resultado + (indice+1).to_s
	  			encontrado = true
	  		end
	  		indice = indice +1
		end

	  	if(encontrado == false)
	  		resultado = resultado + letra
	  	end
  end

  puts resultado
  #return resultado 

end

NumberEncoding("hello 45")  == "85121215 45"
NumberEncoding("jaj-a")  == "10110-1"