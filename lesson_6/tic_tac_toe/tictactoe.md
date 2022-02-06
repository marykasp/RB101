# Tic Tac Toe

## Problem

*Description*

Tic Tac Toe is a 2 player gamme placed 3x3 board. Each player takes a turn and marks a square on the board. First player to reach 3 squares in a row, including diagonals, wins. If all 9 squares are marked and no player has 3 squares in na row, then the game is a tie. 

## Data Definitions

### Board is Array of Rows:

*Examples*

Empty Board: `[[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]`

During Game: `[['X ', ' ', 'O '], [' ', ' ', ' '], ['O ', 'X', 'X']]`

User Wins: `[['X', 'O', 'O'], ['O', 'X', 'O'], ['O', 'X', 'X']]`

### Row Array of three Players:

- `['X', '', 'O']`
- `[' ', ' ', ' ']`
- `['O', 'X', 'X']`

### A Player is:

- 'X'
- 'O'
- A player represents a player spot ('X'),computer spot ('O') or empty position 

### Board Square is an Integer the range [0,9]

- It represents a particular square on the board

### Position 2-Element Array of Form [row, column]

`row` and `col` are integers in the range [0,2] representing their index in the nested board array 

