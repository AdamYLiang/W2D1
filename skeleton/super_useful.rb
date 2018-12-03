# PHASE 2
def convert_to_int(str)
  digit_arr = %w(1 2 3 4 5 6 7 8 9 0)
  raise TypeError unless str.chars.all? { |el| digit_arr.include?(el)}
  Integer(str)
rescue 
    puts "Cannot convert to Integer."
    return nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  
   
  reaction(maybe_fruit) 
  rescue
    puts "loser"
    retry if maybe_fruit == "coffee"
    puts "GG no re"
  
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise 'yrs_known error' if yrs_known < 5
    raise 'name error empty string' if name.length < 1
    raise 'pastime error empty string' if fav_pastime.length < 1
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
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


