=begin
Understand The Problem
  Input: Bill amount, Tip rate %
  Output: Tip amount, Total bill
Examples and Test Cases
  What is the bill? 200
  What is the tip percentage? 15
  The tip is $30.0
  The total is $230.0
=end

puts "=> Enter Bill Amount:"
bill_amount = gets.chomp.to_f
puts "=> Enter Tip Rate(%):"
tip_rate = gets.chomp.to_f
tip = bill_amount*(tip_rate/100.00)
total_bill = tip + bill_amount
puts"=> The tip is: $#{tip}"
puts "=> The total is: $#{total_bill} "