require 'yaml'

# CONSTANTS
MESSAGES = YAML.load_file('twentyone_messages.yml')
DEALER_STAY = 17
MAX_SCORE = 21
VALID_YES = ['yes', 'y']
VALID_STAY = ['stay', 's']
VALID_HIT = ['hit', 'hit']
COURT_CARDS = ['Jack', 'Queen', 'King']
SUITS = ['Spade', 'Hearts', 'Diamonds', 'Club']
VALUES = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']
WINNING_SCORE = 5

def prompt(msg)
  puts ">>>> #{msg}"
end

def display_welcome
  system 'clear'
  prompt(MESSAGES['welcome'])
  prompt(MESSAGES['rules'])
end

def hit_key_to_start
  puts "Hit <ENTER> to continue"
  gets
  system 'clear'
end

def initialize_deck
  deck = [] # array of hashes
  SUITS.each do |suit|
    VALUES.each do |value|
      num_value = if value == 'Ace'
                    11
                  elsif COURT_CARDS.include?(value)
                    10
                  else
                    value.to_i
                  end
    deck << { suit: suit, value: num_value, face: value }
    end
  end
  deck # return the array of hashes
end

def deal_card(deck)
  card = deck.sample # returns a hash from the deck array
  # remove the hash from the array using slice - modifies the collection
  # remove by getting the index of the card
  deck.slice!(deck.index(card))
end

# initial deal - deal 2 cards
def initial_deal(deck, hand)
  2.times { hand << deal_card(deck) }
end

def valid_choice?(choice)
  VALID_HIT.include?(choice) || VALID_STAY.include?(choice)
end

def ask_player_hit_or_stay?
  choice = nil
  loop do
    prompt "Hit or stay?"
    choice = gets.chomp.downcase
    break if valid_choice?(choice)
    prompt "Please enter hit or stay"
  end
  choice
end

def choose_hit_or_stay(data)
  id = data[:player][:id]
  display_hand(data[:player][:hand], id)
  ask_player_hit_or_stay?
end

def update_hand(hand, deck, id)
  card = deal_card(deck)
  hand << card
end

def display_hand(hand, id)
  # hand is an array of hashes
  hand_string = hand.map do |card|
    "#{card[:value]} of #{card[:suit]}"
  end
  puts "#{id} dealt: #{hand_string.join(", ")}"
end

def calc_hand(hand)
  sum = 0
  hand.each do |card|
    sum += hand[:value].to_i
  end
  puts sum
end

def update_score(data, id)
  data[id][:score] = calc_hand(data[id][:hand])
end

def busted?(data, id)
  data[id][:score] > MAX_SCORE
end

def display_busted(id, data, score)
  system 'clear'
  display_hand(data[:dealer][:hand], :dealer)
  display_hand(data[:player][:hand], :player)
  puts id == 'Player' ? 'Player busted! Dealer wins!' : "Dealer busted!"
end

def player_turn(data, deck, score)
  loop do
    system 'clear'
    if VALID_STAY.include?(choose_hit_or_stay(data))
      break
    else
      update_hand(data[:player][:hand], deck, :player)
      # display_hand(data[:player][:hand], :player)
      update_score(data, :player)
      hit_key_to_start
    end

    if busted?(data, :player)
      display_busted('Player', data)
      score[:dealer] += 1 # update dealer sscore
    end
  end
end

# MAIN GAME
display_welcome
hit_key_to_start

loop do
  score_tracker = { player: 0, dealer: 0 }

  loop do
    game_data = {
      player: { hand: [], score: 0, id: :player },
      dealer: { hand: [], score: 0, id: :dealer }
    }

    deck = initialize_deck
    winner = []

    initial_deal(deck, game_data[:player][:hand])
    initial_deal(deck, game_data[:dealer][:hand])

    player_turn(game_data, deck, score_tracker)
  end
end
