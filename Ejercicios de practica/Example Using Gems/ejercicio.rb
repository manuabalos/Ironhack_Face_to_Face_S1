require 'imdb'
require 'ascii_charts'
class ImdbRating
	
	def initialize
		@films ={}
	end


	def save_films file_array

		file_array.each do |film|

			obj_film = Imdb::Search.new(film).movies[3]
			title = obj_film.title
			rate = obj_film.rating
			
			@films[title]=rate
		end
		
	end

	def print_rate_films
		array_rates = []
		i=1
		@films.each do |film, rate|
			array_rates.push([i,rate.to_i.round])
			i = i +1
		end
			
		puts AsciiCharts::Cartesian.new(array_rates, :bar => true, :hide_zero => true).draw
		# 10.downto(1) do |i|
		# 	print "|"
		# 	array_rates.each do |rate|
				
		# 		if rate <= i
		# 			print " "
		# 		else
		# 			print "#"
		# 		end
		# 		print "|"
				
		# 	end
		# 	print("\n")
		# end

		# puts "---------------"
		# puts "|1|2|3|4|5|6|7|"
		# print "\n"
		list_films
	end

	def list_films
		@films.each_with_index do |(film,value), index|
			puts "#{index+1}. #{film}"
		end
	end

end

#i = ImdbRating.new("0095016")
#i.show_title

# serie1 = Imdb::Search.new("Ghostbusters")
# serie2 = Imdb::Search.new("Die Hard")
# serie3 = Imdb::Search.new("The Godfather")
# serie4 = Imdb::Search.new("Home alone")
# serie5 = Imdb::Search.new("Star trek, the new generation")
# serie6 = Imdb::Search.new("The night of the living dead")
# serie7 = Imdb::Search.new("Titanic")

# puts serie2.movies

file_contents = IO.read("peliculas.txt")
file_array = file_contents.split("\n")

imdb = ImdbRating.new
imdb.save_films file_array
imdb.print_rate_films

