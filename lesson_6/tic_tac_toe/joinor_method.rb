require 'pry'
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

RULES = <<-MSG
--------
Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and marks a square on the board. First player to reach 3 squares in a row, including diagonals, wins. If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie. You #{PLAYER_MARKER} will be playing the computer #{COMPUTER_MARKER}.

The first to 5 games is the ultimate winner! Have fun playing!
--------
MSG

WINNING_LINES = [
  %w(1 2 3),
  %w(4 5 6),
  %w(7 8 9),
  %w(1 4 7),
  %w(2 5 8),
  %w(3 6 9),
  %w(1 5 9),
  %w(3 5 7)
]

DANGER_SQUARES = {
  1 => [[2, 3], [4, 7], [5, 9]], # diagonal
  2 => [[1, 3], [5, 8]],
  3 => [[1, 2], [5, 7], [6, 9]], # diagonal
  4 => [[5, 6], [1, 7]],
  5 => [[4, 6], [2, 8], [1, 9]], # diagonal
  6 => [[4, 5], [3, 9]],
  7 => [[8, 9], [1, 4], [3, 5]], # diagonal
  8 => [[7, 9], [2, 5]],
  9 => [[7, 8], [3, 6], [1, 5]] # diagonal
}

TOTAL_SQUARES = 0
SQUARES_TO_THREATEN = 2
SQUARES_TO_WIN = 3

MATCH_WIN = 5

BOARD_DESIGN = <<-MSG
Squares are numbered 1 - 9 from left to right and in descending rows

                      1 | 2 | 3
                      --+---+--
                      4 | 5 | 6
                      --+---+--
                      7 | 8 | 9
MSG


def prompt(msg)
  puts "=> #{msg}"
end

def welcome_and_rules
  system 'clear'
  puts "****** WELCOME TO TIC TAC TOE! ******"
  puts RULES
  puts BOARD_DESIGN
end

def decide_current_player
  answer = ''
  loop do
    prompt "Who would you like to go first (player, computer)"
    prompt "Press enter if you want computer to decide"
    answer = gets.chomp.downcase
    break if answer == 'player' || answer == 'computer' || answer == ''
    prompt "Please enter a valid choice"
  end

  if answer == ''
    answer = ['computer', 'player'].sample
  end
  answer
end

# use when prompting a user to mark a square
def joinor(arr, delimiter=", ", word="or")
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    # if greater than 3 elements change the last value to include the words
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# welcome_and_rules
# puts player_decides_first

# puts joinor([1, 2]) # "1 or 2"
# puts joinor([1]) # 1
# puts joinor([1, 2, 3], ', ', 'and') # "1, 2, and 3"
# puts joinor([1, 2, 3])

