def reverse_words(string)
reversed_arr = []
string.split(" ").each do |word|
  if word.count >= 5
    word.reverse
  end
  reversed_arr << word
end
puts reversed_arr.join(" ")
end

reverse_words("hellay styl")