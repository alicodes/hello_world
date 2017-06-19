=begin
Understand The Problem
  Input: Age, retirement_age
  Output: 
Examples and Test Cases
  What is your age? 30
  At what age would you like to retire? 70
  
  It's 2016. You will retire in 2056.
  You have only 40 years of work to go!
=end

YEAR = 2017
puts "=> What is your age?"
age = gets.chomp.to_i
puts "=> At what age would you like to retire?"
retire_age = gets.chomp.to_i
difference = retire_age - age
puts "It's #{YEAR}! You will retire in #{YEAR + difference}."
puts "You have only #{difference} years of work to go!"