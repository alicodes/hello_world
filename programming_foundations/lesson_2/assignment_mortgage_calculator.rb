def prompt(message)
  puts "=> #{message}"
end

prompt 'Hi, welcome to the mortgage/car loan calculator'

prompt('Please enter the loan amount')
p = gets.chomp.to_f

prompt('Please enter the annual percentage rate (APR)')
apr = gets.chomp.to_f
j = apr / 12.0

prompt('Please enter the loan duration (months)')
n = gets.chomp.to_f

m = p * (j / (1 - (1 + j)**-n))

prompt("Your monthly payment is: #{m}")
