def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    "Adding"
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
      'Dividing'
  end
end

prompt("Welcome to the calculator! Enter your name:")

name = ""
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}")

loop do
  a = ''
  loop do
    prompt("Enter first number")
    a = Kernel.gets().chomp()
    if valid_number?(a)
      break
    else
      prompt("Hmm... that doesnt look like a valid number")
    end
  end
  
  b = ''
  loop do
    prompt("Enter second number")
    b = Kernel.gets().chomp()
    if valid_number?(b)
      break
    else
      prompt("Hmm... that doesnt look like a valid number")
    end
  end
  
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
    MSG
  
  prompt(operator_prompt)
  
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
  if %w(1 2 3 4).include?(operator)
    break
  else
    prompt("Must choose 1, 2, 3, or 4")
  end
end

  prompt("#{operation_to_message(operator)} the two numbers...")
  
  result= case operator
          when '1'
            a.to_i + b.to_i
            when '2'
              a.to_i - b.to_i
              when '3'
                a.to_i * b.to_i
                when "4"
                  a.to_i / b.to_i
  end
  
  prompt ("#{result} Is the result")
  

  prompt ("would you like to make another calculation? (Y to calculate again)")
  ans = Kernel.gets().chomp()
  break unless ans.downcase().start_with?("y")
end 

prompt ("Thank-you, good-bye!")