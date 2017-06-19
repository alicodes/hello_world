def reverse_sentance(sentance)
reverse_arr = []
sentance_arr = sentance.split(" ")
  until sentance_arr.empty? do
    reverse_arr << sentance_arr.pop
  end
reversed_string = reverse_arr.join(" ")
puts reversed_string
end

reverse_sentance("Hello World")