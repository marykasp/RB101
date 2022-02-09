require 'pry'
deck = {
  spade: {suit: '♠', value: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace' ]},
  club: {suit: '♣', value: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace' ]},
  heart: {suit: '♥', value: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace' ]},
  diamond: {suit: '♦', value: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace']}
}

CARD_SUITS = {
  spade: '♠',
  club: '♣',
  heart: '♥',
  diamond: '♦'
}


def prompt(msg)
  puts ">>>> #{msg}"
end

def initialize_decks!(deck, player_deck, dealer_deck)
  2.times do
    deal_card(deck, player_deck)
    deal_card(deck, dealer_deck)
  end
end

def deal_card(deck, hand)
  face = [:spade, :club, :heart, :diamond].sample
  value = deck[face][:value].sample
  suit = deck[face][:suit]
  hand << [face.to_s, suit, value]
end

def display_hand(hand)
  string_arr = hand.map do |card|
    "A #{card[2]} of #{card[1]} #{card[0]}"
  end
  prompt(string_arr.join(", "))
end


def determine_card_value(card) # pass in array of card
  value = nil
  if ['jack', 'queen', 'king'].include?(card[2])
    value = 10
  elsif card[2] == 'ace'
    value = 11
  else
    value = card[2]
  end
  value
end

def get_values_of_hand(hand)
  values = []
  hand.each do |card|
    value = determine_card_value(card)
    values << value.to_i
  end
  values
end

def calculate_total(hand)
  values = get_values_of_hand(hand)
  sum = values.reduce(0) { |total, value| value.to_i + total }
  values.select { |value| value == 11 }.count.times do
    sum -= 10 if sum > 21
  end
  # return sum
  sum
end

def display_total(hand)
  total = calculate_total(hand)
  prompt "The total of the hand is #{total}"
end

def player_hit_or_stay
  player_turn = nil
  loop do
    prompt "hit or stay"
    player_turn = gets.chomp.downcase
    break if ['hit', 'stay'].include?(player_turn)
    prompt "Sorry, you must enter a valid choice"
  end
  player_turn
end

def busted?(hand)
  calculate_total(hand) > 21
end

def calculate_results(player, dealer, score)
  player_total = calculate_total(player)
  dealer_total = calculate_total(dealer)
  if player_total <= 21 && player_total > dealer_total
    score[:player] += 1
  else
    score[:dealer] += 1
  end
end

def display_results(score)
  prompt score[:player] > score[:dealer] ? "The player wins" : "The dealer wins"
end

def play_again?
  # system 'clear'
  answer = nil
  loop do
    prompt "Would you like a rematch? (y or n)"
    answer = gets.chomp.downcase
    break if ['yes', 'y', 'no', 'n'].include?(answer)
  end

  ['yes', 'y'].include?(answer)
end


# MAIN GAME
# ===============================================
loop do
  prompt "Welcome to Twenty-One!"

  # variables
  score = { player: 0, dealer: 0 }
  player_deck = []
  dealer_deck = []

  # initial deal of 2 cards each
  initialize_decks!(deck, player_deck, dealer_deck)

  # display the players hand
  prompt "Dealer has #{dealer_deck[0]} and ?"
  prompt "You have: #{player_deck[0]}, and #{player_deck[1]} for a total of #{calculate_total(player_deck)}"

  # player turn
  loop do
    player_turn = player_hit_or_stay

    if player_turn == 'hit'
      # deal player another card
      prompt "You chose to hit!"
      deal_card(deck, player_deck)
      display_hand(player_deck)
      display_total(player_deck)
    end

    break if player_turn == 'stay' || busted?(player_deck)
  end

  if busted?(player_deck)
    prompt "End of game! Thanks for playing"
  else
    puts "You chose to stay!"
  end

  # dealer turn
  prompt "Dealers turn..."

  # dealer hits until total is greater than 17 or busts
  loop do
    deal_card(deck, dealer_deck)
    display_hand(dealer_deck)
    display_total(dealer_deck)
    break if calculate_total(dealer_deck) >= 17 || busted?(dealer_deck)
  end

  if busted?(dealer_deck)
    prompt "The player wins! The dealer busted"
    calculate_results(player_deck, dealer_deck, score)
  else
    calculate_results(player_deck, dealer_deck, score)
    display_results(score)
  end

  break unless play_again?
end

prompt "Thanks for playing TwentyOne!"


