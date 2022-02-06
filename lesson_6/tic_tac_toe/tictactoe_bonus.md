# Tic Tac Toe Bonus Features

1. Improved `join`
   `=> Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, 9`
   Want the message to read a little better - want to separate the last item with an "or" so that it reads:

`=> Choose a position to place a piece: 1, 2, 3, 4, 5, 6, 7, 8, or 9`

1. make a new method that takes the array returned from `empty_squares(board)` method as an argument as well as a delimiter for `join` and a `word`
2. use a `case` statment to check the size of the array passed in

- if array is empty just return an empty string
- if array has 1 value just return that value
- if array has 2 values format the string version with an 'or' between the elements
- if array has a length greater than 2 then add the word to the last element in the array and join with the delimiter provided

```ruby
def joinor(arr, delimiter=', ', word="or")
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
  # select last element and reassign
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
end
```

2. Keep Score

- Keep score of how many times the player and computer each win. Make is so the first player to 5 wins the game
