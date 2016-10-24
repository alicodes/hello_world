a = [1, 2, 3]

def mutate(array)
    array.pop
end

p "Before mutate method: #{a}"
p mutate (a)
p "After mutate method: #{a}"

def add_three(number)
   return number + 3
   number + 4
end

returned_value = add_three(4)
puts returned_value

def just_assignment(number)
 foo = number + 3
 end