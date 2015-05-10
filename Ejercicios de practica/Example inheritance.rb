class Bird
  def initialize name
    @name = name
  end
 
  def speak
    puts 'Tweet'
  end
 
  def fly
    puts 'Up up and away...'
  end
end

class Duck < Bird
  def speak
    puts "Quack I am #{@name}"
  end

end
 
class Penguin < Bird
  def speak
    puts "Squak I am #{@name}"
  end
 
  def fly
    puts 'Nope. I swim...'
  end

end

class Chicken < Bird
  def speak
    puts "Squak I am #{@name}"
  end
 
  def fly
    puts "No :("
  end
end


class Albatros < Bird
  def speak
    puts "Squak I am #{@name}"
  end
 
  def fly
    puts "Yep, cause I'm an Albatros"
  end
end


class Zoo
  def initialize name, birds
    @name = name 
    @birds = birds 
  end

  def make_my_birds_fly
    @birds.each do |bird|
        bird.fly
    end
  end
end

animals = [Chicken.new("pollo"), Albatros.new("Pajarraco"), Penguin.new("Billy"), Duck.new("Donald"), Duck.new("Lucas")]
my_zoo = Zoo.new "Iron Zoo", animals
my_zoo.make_my_birds_fly
