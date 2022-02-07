require 'pry'

# ---------- CONSTANTS --------------
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize
# keys (integers) represent squares in board, values represent mark to display
# {1 => "X", 2 => 'O', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ' }

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# check which board keys have empty spaces
# - returns array of keys (inspects board)
def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

# ask the user to mark a square - modifies the board
def player_place_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{empty_squares(brd).join(', ')}: "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice"
  end

  brd[square] = PLAYER_MARKER
end

def computer_place_piece!(brd)
  square = empty_squares(brd).sample # returns an integer key
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  # no more empty squares if the select method returns an empty array
  empty_squares(brd).empty? # returns true if array returned is empty
end

def detect_winner(brd)
  # iterate through winning lines
  WINNING_LINES.each do |line|
    # returns an array of values at those keys, count returns the number
    # of times the marker occurs in that array
    # splat operator *array - passes in all element in line one by one
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end

  nil
end

# determine if there is a winner
def someone_won?(brd) # ? need to return a true boolean
  # force the return value to a boolean
  !!detect_winner(brd)
end

# ---- MAIN GAME -----
# ---------------------------------------------
loop do
  # board keeps track of state of game, so need to save in a variable
  board = initialize_board

  loop do
    display_board(board)

    player_place_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_place_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
