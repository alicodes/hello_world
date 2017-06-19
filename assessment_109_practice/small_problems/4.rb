def count_occurences(array)
occurences = {}
  array.each do |elem|
    occurences[elem] = array.count(elem)
  end
puts occurences
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 
            'motorcycle', 'car', 'truck', 2, 2, 2, 8, 8]
            
count_occurences(vehicles)
