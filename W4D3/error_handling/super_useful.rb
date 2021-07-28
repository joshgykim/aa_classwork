# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError.new("Thanks for the coffee, but this isn't a fruit!")
  else
    raise StandardError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => error
    puts error.message # prints "Thanks for the coffee, but this isn't a fruit!"
    retry
  rescue StandardError
    puts "No fruit for me... Goodbye."
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)  
    valid_arguements?(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def valid_arguements?(name, yrs_known, fav_pastime)
    if name.length == 0 
      puts "You don't have a name."
      raise NoNameError.new("You don't have a name.")
    elsif yrs_known < 5
      puts "We've only been friends for less than 5 years!"
      raise YearsKnownError.new("We've only been friends for less than 5 years!") 
    elsif fav_pastime.length == 0
      puts "No favorite pastime?"
      raise FavPastimeError.new("No favorite pastime?")
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


