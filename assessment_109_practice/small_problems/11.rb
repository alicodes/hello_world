=begin
Understand The Problem
  Input: 
  Output: Teddy is 69 years old!, age must be between 20 and 200
Examples and Test Cases
  
=end

teddy_age = (20..200).to_a.sample
puts "Teddy is #{teddy_age} years old!"