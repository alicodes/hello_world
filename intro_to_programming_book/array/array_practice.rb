arr = [1, 3, 5, 7, 9, 11]
puts arr.include?(3)

arr = [1, 2, 3, 4, 5]
new_arr = []

arr.each do |n|
  new_arr << n + 2
end

p arr
p new_arr