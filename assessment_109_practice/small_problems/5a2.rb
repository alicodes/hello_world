def reverse (string)
arr = string.split(" ")
reverse_arr = []
 until arr.empty? do
   reverse_arr << arr.pop
 end
reverse_arr.join(" ")
end

puts reverse("string ting")