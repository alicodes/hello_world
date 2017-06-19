=begin
Understand The Problem
  Input: Takes one argument, Positive Integer
  Output: Returns a string of alternating 1's and 0's, Starting with one
Examples and Test Cases
  puts stringy(6) == '101010'
  puts stringy(9) == '101010101'
  puts stringy(4) == '1010'
  puts stringy(7) == '1010101'
=end

def stringy(num)
str = ""
count = 0
  num.times do
    count += 1
    if count.odd?
      str << "1"
    else
      str << "0"
    end
  end
str
end

puts stringy(2)