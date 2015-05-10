
def DashInsertII(num)
 
  cadena = ""
  pos=0

  num.each_char do |numero| 
  	
  	numero=numero.to_i
  	numSiguiente = num[pos+1].to_i

  	cadena = cadena + numero.to_s

 	if(numero % 2 != 0 && numSiguiente % 2 != 0) #Es impar 		
  		if(pos!=num.length-1)
  		cadena = cadena + "-"
  		end
  	elsif(numero % 2 == 0 && numSiguiente % 2 == 0 && numero!=0) #Es par 
  		if(pos!=num.length-1)		
  		cadena = cadena + "*"
  		end
  	end



  	pos = pos +1

  end

  puts cadena 
  return cadena
end

# Check your function
DashInsertII("99946") == "9-9-94*6"
DashInsertII("56647304") == "56*6*47-304"
