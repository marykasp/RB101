require 'pry'
SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts ">>>> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def determine_card_value(card) # pass in array of card
  if ['J', 'Q', 'K'].include?(card[1])
    return 10
  elsif card[1] == 'A'
    return 11
  else
    return card[1]
  end
end

def get_values_of_hand(deck)
  values = []
  deck.each do |card|
    value = determine_card_value(card)
    values << value.to_i
  end
  values
end

def calculate_total(deck)
  values = get_values_of_hand(deck)

  sum = values.reduce(0) { |total, value| total + value}

  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(deck)
  calculate_total(deck) > 21
end

def detect_result(player_deck, dealer_deck)
  player_total = calculate_total(player_deck)
  dealer_total = calculate_total(dealer_deck)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(player_deck, dealer_deck)
  result = detect_result(player_deck, dealer_deck)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  answer = nil
  loop do
    prompt "Do you want to play again? (y or n)"
    answer = gets.chomp.downcase
    break if ['y', 'n'].include?(answer)
    prompt "Please enter y or n"
  end
  answer.start_with?('y')
end
# MAIN GAME
loop do
  prompt "****** Welcome to Twenty One ******"
  deck = initialize_deck
  player_deck = []
  dealer_deck = []

  # deal two cards to the dealer and player
  2.times do
    player_deck << deck.pop
    dealer_deck << deck.pop
  end

  prompt "Dealer has #{dealer_deck[0]} and ?"
  prompt "You have: #{player_deck[0]} and #{player_deck[1]}, for a total of #{calculate_total(player_deck)}"

  loop do
    answer = nil
    loop do
      prompt "Would you like to hit or stay?"
      answer = gets.chomp.downcase
      break if ['hit', 'stay'].include?(answer)
      prompt "Sorry must enter hit or stay"
    end

    if answer == 'hit'
      player_deck << deck.pop # deal another card
      prompt "You chose to hit!"
      prompt "Your cards are now #{player_deck}"
      prompt "The player total is now #{calculate_total(player_deck)}"
    end

    break if answer == 'stay' || busted?(player_deck)
  end

  if busted?(player_deck)
    display_result(player_deck, dealer_deck)
    play_again? ? next : break
  else
    prompt "You stayed at a #{calculate_total(player_deck)}"
  end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if calculate_total(dealer_deck) >= 17

    prompt "Dealer hits!"
    dealer_deck << deck.pop
    prompt "Dealer cards are now #{dealer_deck}"
  end

  if busted?(dealer_deck)
    prompt "Dealer total is now: #{calculate_total(dealer_deck)}"
    display_result(player_deck, dealer_deck)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{calculate_total(dealer_deck)}"
  end

  # if both dealer and player stay - compare cards
  puts "============"
  prompt "Dealer has #{dealer_deck}, for a total of #{calculate_total(dealer_deck)}"
  prompt "Player has #{player_deck}, for a total of #{calculate_total(player_deck)}"
  puts "============"

  display_result(player_deck, dealer_deck)

  break unless play_again?
end

prompt "Thanks for playing!"
