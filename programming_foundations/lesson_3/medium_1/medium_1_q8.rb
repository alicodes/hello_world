str = "titleize this"

def titleize (word)
  word.split.map {|word| word.capitalize}.join(' ')
end

puts titleize(str)