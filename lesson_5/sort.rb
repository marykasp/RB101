# !String sort
['arc', 'bat', 'cape', 'ants', 'cap'].sort

# => ['ants', 'arc', 'bat', 'cap', 'cape']
#<==> compares multiline strings character by character

# !Array sort
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort

# => [['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]
# nested arrays are compared by each individual element in the arrays

# !sort_by - takes a block as an argument

['cot', 'bed', 'mat'].sort_by do |word|
  word[1] # sorts based on 2nd character in string
end
#=> ['mat', 'bed', 'cot']

people = { Kate: 27, john: 25, Mike:  18 }

# key and value are passed into the block as arguments
people.sort_by do |_, age|
  age
end

# sort_by always return an array - so key:value pairs will be sorted into nested arrays
#=> [[:Mike, 18], [:john, 25], [:Kate, 27]]
