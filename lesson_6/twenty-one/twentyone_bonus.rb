require 'pry'
FACE_VALUES = ['2', '3', '4', '5', '6', '7', '9', '10', '11', 'A', 'J', 'Q', 'K']
DECK = {
  spade: {suit: 'unicode', values: FACE_VALUES},
  club: {suit: 'unicode', values: FACE_VALUES},
  heart: {suit: 'unicode', values: FACE_VALUES},
  diamond: {suit: 'unicode', values: FACE_VALUES}
}

# need to initialize and create a deck that can be modified

def initialize_deck(deck)
  suit = deck.keys # array of keys
  suit.product(FACE_VALUES).shuffle # returns nested array
end

def prompt(msg)
  puts ">>> #{msg}"
end

def deal_card(deck, hand)
  hand << deck.pop
end

def play_again?
  answer = nil
  loop do
    prompt "Do you want a rematch? (y or n)"
    answer = gets.chomp.downcase
    break if ['yes', 'no', 'y', 'n'].include?(answer)
    prompt "Sorry not a valid choice, please enter (y or n)"
  end

  ['yes', 'y'].include?(answer)
end

# main loop
loop do
  # initialize deck
  player_deck = []
  dealer_deck = []
  score = { player_total: 0, dealer_total: 0 }
  game_deck = initialize_deck(DECK)

  2.times do
    deal_card(game_deck, player_deck)
    deal_card(game_deck, dealer_deck)
  end

  binding.pry
  break unless play_again? # if true start loop again
end
