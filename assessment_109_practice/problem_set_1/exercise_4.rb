def fizzbuzz (first, last)
arr = []
  (first..last).each do |num|
    fizz_or_buzz = ''

    if num.remainder(3) == 0 && num.remainder(5) == 0
      fizz_or_buzz << "fizzbuzz"
    elsif num.remainder(3) == 0
      fizz_or_buzz << "fizz"
    elsif num.remainder(5) == 0
      fizz_or_buzz << "buzz"
    end
    fizz_or_buzz.empty? ? arr << num : arr << fizz_or_buzz
  end
p arr
end

fizzbuzz(1, 100)