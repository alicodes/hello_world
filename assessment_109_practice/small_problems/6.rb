def reverse_words(sentance)
reversed_arr = []
  sentance.split(" ").each do |word|
    reversed_arr << word.reverse
  end
puts reversed_arr.join(" ")
end

reverse_words("boolin on da block sthull racecar")