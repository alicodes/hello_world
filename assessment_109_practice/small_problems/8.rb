=begin
Understand The Problem
  Input: Takes one argument, an array contaning integers, 
  Output: Returns the average of all the numbers in the array, The array will
          never be empty and the numbers will always be positive
Examples and Test Cases
  puts average([1, 5, 87, 45, 8, 8]) == 25
  puts average([9, 47, 23, 95, 16, 52]) == 40
=end

def average(arr)
sum = 0
  arr.each do |num|
    sum += num
  end
average = (sum.to_f/arr.count.to_f)
average
end

puts average([8, 8])