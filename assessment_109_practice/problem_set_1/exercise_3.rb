def palindrome?(string)
  if reverse(string) == string
    return true
  else 
    return false
  end
end

def reverse(string)
  string_arr = []
  split_string = string.split('')
  split_string.count.times do
    string_arr << split_string.pop
  end
  return string_arr.join
end

word = "racecar"
palindrome?(word)
