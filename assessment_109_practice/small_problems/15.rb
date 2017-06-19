puts "What is your name?"
name = gets.chomp
if name.include?("!")
  puts "HEY #{name.upcase} WATATHAHECK?"
else 
  puts "Hey #{name}, whats up?"
end