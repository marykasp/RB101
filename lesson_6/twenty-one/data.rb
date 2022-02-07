deck = {
  spade: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace' ],
  club: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace' ],
  heart: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace' ],
  diamond: ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace' ]
}


def prompt(msg)
  puts "=> #{msg}"
end

def initialize_decks!(deck, player_deck, dealer_deck)
  2.times do
    deal_card(deck, player_deck)
    deal_card(deck, dealer_deck)
  end
end

def deal_card(deck, hand)
  face = [:spade, :club, :heart, :diamond].sample
  value = deck[face].sample
  hand << [face.to_s, value]
end

def display_hand(hand)
  string_arr = hand.map do |card|
    "A #{card[1]} of #{card[0]}"
  end
  prompt(string_arr)
end

def determine_card_value(card) # pass in array of card
  value = nil
  if ['jack', 'queen', 'king'].include?(card[1])
    value = 10
  elsif card[1] == 'ace'
    value = 11
  else
    value = card[1]
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
    player_turn = gets.chomp
    break if ['hit', 'stay'].include?(player_turn)
    prompt "Sorry, you must enter a valid choice"
  end
  player_turn
end

def busted?(hand)
  calculate_total(hand) > 21
end

def play_again?
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
  player_deck = []
  dealer_deck = []

  # initial deal of 2 cards each
  initialize_decks!(deck, player_deck, dealer_deck)

  # display the players hand
  prompt "Dealer has #{dealer_deck[0]} and ?"
  prompt "You have: #{player_deck[0]} and #{player_deck[1]}, for a total of #{calculate_total(player_deck)}"

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
  # prompt "Dealer's turn..."

  # loop do
  #   break if
  # end

  break unless play_again?
end


