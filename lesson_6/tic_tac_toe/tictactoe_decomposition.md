# Description of Game

Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and marks a square on the board. First player to reach 3 squares in a row, including diagonals, wins. If all 9 squares are marked and no player has 3 in a row, then the game is a tie.

# Sequence of Gameplay

- Two main loops - one for the game, another to ask to play again\*

1. Display the initial empty 3x3 board
2. Ask the user to mark a square
3. Computer marks a square
4. Display the updated board
5. If winner, display winner (stopping condition)
6. If board is full, display tie (stopping condition)
7. **If neither winner nor board is full, ask user to mark again (go to step #2)**
8. Play again?
9. **If yes, display empty board again (go to step #1)**
10. Goodbye Message! Exit program
