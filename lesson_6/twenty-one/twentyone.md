# black trumps read

| Card              | Value      |
| ----------------- | ---------- |
| 2 - 10            | face value |
| jack, queen, king | 10         |
| ace               | 1 or 11    |

# Test Examples

Dealer has: Ace and unkown card
You have: 2 and 8

- would hit in this scenario cause only have 10

Dealer: 7 and unkown card
You have: 10 and 7

- would stay since chances of unknown card is not an Ace

# Implementation

1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay

- repeat until bust or stay (loop)

4. If player bust, dealer wins
5. Dealer turn: hit or stay

- repeat until total >= 17 (loop condition)

6. If dealer bust, player wins
7. Compare cards and declare winner

- whoever is closest to 21

# Data Structure of deck

`deck = [ ['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'] ]`

`deck = { S => ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king ], C => ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king ] H => ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king ] D => ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king ] }`

`player_cards = [ ['S', 'ace'], ['H', 2], ['D', 5] ]`
