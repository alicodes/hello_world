def prompt (str)
  puts("=> #{str}")
end

def sum(num)
  sum = (1..(num)).reduce(:+)
  prompt("The sum of the integers between 1 and #{num} is #{sum}")
end

def product(num)
end

prompt("Please Enter an integer greater then 0:")
int = gets.chomp
  loop do
    prompt ("Enter 's' to compute the sum, 'p' to compute the product.")
    input = gets.chomp.downcase
        if input == "p"
          product(int)
          break
        elsif input == "s"
          sum(int)
          break
        else
          prompt ("Invalid input")
        end
  end

