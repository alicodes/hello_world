def select_fib (arr)
fib_elements = []
  arr.each do |elem|
    if fib?(arr.index(elem))
      fib_elements << elem
    end
  end
p fib_elements
end

def fib? (num)
  fib_nums = [0, 1]
  while num > fib_nums.last do
    fib_nums << fib_nums[-1] + fib_nums[-2]
  end
  fib_nums.include?(num)
end

fib_check = ["yes", "yes", "yes", "yes", "no", "yes", "no", "yes"]
select_fib (fib_check)