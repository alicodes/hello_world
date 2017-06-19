VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts"=> #{message}"
end

def translate_shortcut(shortcut)
  case shortcut
  when "r" then "rock"
  when "p" then "paper"
  when "sc" then "scissors"
  when "sp" then "spock"
  when "l" then "lizard"
  end
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'rock' && second == 'lizard') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'scissors' && second == 'lizard') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'paper' && second == 'spock') ||
  (first == 'lizard' && second == 'spock') ||
  (first == 'lizard' && second == 'paper') ||
  (first == 'spock' && second == 'scissors') ||
  (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won this round')
  elsif win?(computer, player)
    prompt('You lost this round')
  else
    prompt('This round is a tie!')
  end
end

your_score = 0
computer_score = 0

loop do
  choice = ''
  loop do
      shortcut_prompt = <<-MSG
Make a choice by hitting keys:
  \"R\" for rock
  \"P\" for paper
  \"SC\" for scissors
  \"SP\" for spock
  \"L\" for lizard"
    MSG
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  prompt(shortcut_prompt)
  ask_shortcut = gets.chomp.downcase
  choice = translate_shortcut(ask_shortcut)
  
  if VALID_CHOICES.include?(choice)
    break
  else
    prompt("That's not a valid choice.")
  end
end

  computer_choice = VALID_CHOICES.sample
  puts"You chose: #{choice}; Computer chose: #{computer_choice}"

  display_results(choice, computer_choice)
  
  
  your_score += 1 if win?(choice, computer_choice)
  computer_score += 1 if win?(computer_choice, choice)

  prompt "Your score is: #{your_score} | Computer score is: #{computer_score}"

  if your_score == 5
    prompt "You won the game!"
  elsif computer_score == 5
    prompt "Computer won the game!"
  end

  next unless your_score == 5 || computer_score == 5

  prompt('Do you want to play again? (y/n)')
  ans = gets.chomp
  break unless ans.downcase == 'y'
  your_score = 0
  computer_score = 0
end

prompt('Thank you for playing!')
