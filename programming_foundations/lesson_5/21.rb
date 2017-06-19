require 'pry'
GAME_TGT = 21
DLR_STAY = 17
SUITS = ["\u2665", "\u2666", "\u2660", "\u2663"].freeze #H, D, S, C
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9',
          'T', 'J', 'Q', 'K', 'A'].freeze
SCORE_LIMIT = 5
USER = "You".freeze
COMPUTER = "Dealer".freeze
GAME_WIDTH = 51
SEPARATOR = ("-" * GAME_WIDTH)

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map {|card| card[1]}
  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
      elsif value.to_i == 0
        sum += 10
      else 
        sum += value.to_i
    end
  end
  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def busted? (cards)
  total(cards) > 21
end

def detect_result (player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)
  
  if player_total > GAME_TGT
    :player_busted
  elsif dealer_total > GAME_TGT
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(player_cards, dealer_cards, score, money, bet)
  result = detect_result(player_cards, dealer_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
    play_again?(money)
  when :dealer_busted
    prompt "Dealer busted! You win!"
    play_again?(money)
  when :player
    score[:user_score] += 1
    money[:money] += bet.to_i
    prompt "You win!"
  when :dealer
    score[:comp_score] += 1
    money[:money] -= bet.to_i
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_hand (cards, hidden = false)
  dealer_first_card = cards[0] if hidden == true
  cards[0] = [" ", " "] if hidden == true
  
  cards.count.times {print"   _________ "}
  puts ""
  cards.count.times {|num| print"  |#{cards[num][0]}        |"}
  puts ""
  cards.count.times {print"  |         |"}
  puts ""
  cards.count.times {|num| print"  |    #{cards[num][1]}    |"}
  puts ""
  cards.count.times {print"  |         |"}
  puts ""
  cards.count.times {print"  |         |"}
  puts""
  cards.count.times {|num| print"  |________#{cards[num][0]}|"}
  puts""
  
  cards[0] = dealer_first_card if hidden == true
  
end

def deal (deck, hand)
  hand << deck.pop
end

def initial_hands(deck, player_cards, dealer_cards)
  2.times { deal(deck, player_cards) }
  2.times { deal(deck, dealer_cards) }
end

def display_score_banner(score, money, bet)
  user_score  = "#{USER} : #{score[:user_score]}"
  comp_score  = "#{COMPUTER} : #{score[:comp_score]}"
  limit_msg   = "Beat The House!"
  zone_width  = (GAME_WIDTH / 3)
  puts SEPARATOR
  puts user_score.ljust(zone_width) +
       limit_msg.center(zone_width) +
       comp_score.rjust(zone_width)
  puts "Your Money: $#{money[:money]}"
  puts "Bet: $#{bet}"
  puts SEPARATOR
end
               
def display_board(player_cards, dealer_cards, totals, hidden = false, score, money, bet)
  system "clear"
  display_score_banner(score, money, bet)
  prompt("Dealer is showing: #{totals[:dealer]}")
  display_hand(dealer_cards, hidden)
  puts ""
  prompt("You are showing: #{totals[:player]}")
  display_hand(player_cards)
  puts ""
end

def player_choice
prompt ("(H)it or (S)tay?")
ans = ""
  loop do
    ans = gets.chomp.downcase
    break if ans == "h" || ans == "s"
    prompt ("That's an invalid input. Please enter 'h' or 's'")
  end
ans
end

def player_loop (deck, player_cards, dealer_cards, totals, score, money, bet)
  while totals[:player] <= GAME_TGT
    case player_choice
    when "h"
      deal(deck, player_cards)
      totals[:player] = total(player_cards)
      display_board(player_cards, dealer_cards, totals, true, score, money, bet)
    when "s"
      break
    end
  end
end

def dealer_loop(deck, player_cards, dealer_cards, totals, score, money, bet)
prompt("Dealer is flipping card...")
sleep 2
  totals[:dealer] = total(dealer_cards)
  display_board(player_cards, dealer_cards, totals, score, money, bet)
  sleep 2
  while totals[:dealer] < 17
    deal(deck, dealer_cards)
    totals[:dealer] = total(dealer_cards)
    display_board(player_cards, dealer_cards, totals, false, score, money, bet)
  sleep 2
  end
end

def play_again?(money)
prompt("Would you like to play again? (Y/N); Money: $#{money[:money]}")
ans = ''
  loop do
    ans = gets.chomp.downcase
    if ans == "y" || ans == "n"
      break
    else
      puts ("Invalid input, please enter (Y/N)")
    end
  end
  
  if ans == "n"
    true
  else
    false
  end
end

def bet_loop(money)
prompt("Enter the amount you would like to bet:")
amount = ''
  loop do
    amount = gets.chomp.to_i
    break if amount.integer?
    prompt ("Invalid input, please enter an integer amount to bet")
  end
amount
end

prompt("Welcome to 21!")
prompt("Try to get as close to 21 without going over!")
prompt("Dealer will stay at 17!")
money = {money: 0}
sleep 3

loop do
score = {user_score: 0, comp_score: 0}

  loop do
  bet_amount = bet_loop(money)
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  initial_hands(deck, player_cards, dealer_cards)
  
  totals = {player: total(player_cards),
            dealer: total(dealer_cards.values_at(1..-1))}
            
  display_board(player_cards, dealer_cards, totals, true, score, money, bet_amount)
  player_loop(deck, player_cards, dealer_cards, totals, score, money, bet_amount)
    if busted?(player_cards)
      score[:comp_score] += 1
      money[:money] -= bet_amount.to_i
      display_result(player_cards, dealer_cards, score, money, bet_amount)
      sleep 3
      next
    end
  dealer_loop(deck, player_cards, dealer_cards, totals, score, money, bet_amount)
    if busted?(dealer_cards)
      score[:user_score] += 1
      money[:money] += bet_amount.to_i
    end
    
  display_result(player_cards, dealer_cards, score, money, bet_amount)
  break if play_again?(money)
  end
end 

prompt("Thank-you for playing!")