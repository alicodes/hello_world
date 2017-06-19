=begin
Understand The Problem
  Input: Takes two arguments, A positive Integer and a Boolean, 
  Output: Bonus for given salary, If boolean = true then bonus = half slaray else
          $0
Examples and Test Cases
  puts calculate_bonus(2800, true) == 1400
  puts calculate_bonus(1000, false) == 0
  puts calculate_bonus(50000, true) == 25000
=end

def calculate_bonus(salary, bonus)
bonus_sum = 0
  if bonus == true
    bonus_sum += (salary/2)
  end
bonus_sum
end

puts "$#{calculate_bonus(50000, true)}"
