=begin
Understand The Problem
  Input: One argument, A positive integer
  Output: Returns the sum of its digits
Examples and Test Cases
  puts sum(23) == 5
  puts sum(496) == 19
  puts sum(123_456_789) == 45
=end

def sum(num)
sum = 0
  num.to_s.split("").each do |digit|
    sum += digit.to_i
  end
sum
end

puts sum(496)