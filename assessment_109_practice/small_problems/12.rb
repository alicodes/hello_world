=begin
Understand The Problem
  Input: Length and width, meters
  Output: Displays area in square meters and sqft
Examples and Test Cases
  Enter the length of the room in meters:
  10
  Enter the width of the room in meters:
  7
  The area of the room is 70.0 square meters (753.47 square feet).
=end

puts "Enter the length of the room in meters:"
length = gets.chomp.to_i
puts "Enter the width of the room in meters:"
width = gets.chomp.to_i
sqmet = (length*width).to_f
sqft = sqmet*10.7639
puts "The area of the room is #{sqmet} square meters (#{sqft} square feet)."