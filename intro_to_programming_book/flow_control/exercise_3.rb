puts "Enter a number between 0 and 100"
n = gets.chomp.to_i
if n<0
    puts "No negative numbers"
elsif n <= 50
    puts "#{n} is between 0 and 50"
elsif n <=100
    puts "#{n} is between 51 and 100"
else
    puts "#{n} is above 100"
end

    