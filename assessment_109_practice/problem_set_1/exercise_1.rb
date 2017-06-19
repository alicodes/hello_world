def reverse (a)
b = []
  loop do 
    b << a.pop
    break if a.count == 0
  end
b.each do |elm|
  a << elm
end
a
end
arr = [1, 2, 3]
reverse (arr)
arr