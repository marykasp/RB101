# Snake Case for files
ruby_cheatsheet.rb

# SNake Case for Methods, Variables and Symbols
first_name = "Mary"
def display_customer
  # code
end
:key1

# Screaming Snake Case for Constants
MAX_WINS = 5

# CapitalCase for Classes and Modules
class ProductManager
  # code
end

# ====== DATA TYPES ======
# string
full_name = "Mary Kasparian"
# integer
count = 10
# float
price = 20.49
# booleans
active_user? = true
# Array
fruits = ['Apple', 'Orange']
# Hash
fruit_colors = { apple: 'red', orange: 'yellow'}
# Array of hash
customers = [
  { id: 1000, name: 'Susie'},
  { id: 1001, name: "John"},
  { id: 1002, name: 'Clark'}
]

title = custome_title || 'default_title'
name = custome&.first_name # safe navigation operator (skip if nil)

# ====== PRINT STRING  ======
# print with line break
puts "This string will print on screen"

# print with no line break
print "The string will print with no line break"

# print var content (debug)
puts customer.inspect

# ====== STRING METHODS  ======
# string interpolation -  insert ruby expressions into a string
name = "Mary"
message = "Hello #{name}"

# get string number of characters
'This is a string'.length # 16

# check if the string is empty
'Hello world'.empty? # false
''.empty? # true

# convert all characters to uppercase
'hello world'.upcase # HELLO WORLD

# convert all characters to lowercase
'HELLO'.downcase # hello

# convert first characters to uppercase and rest to lowercase
'mARy'.capitalize # Mary

# remove trailing white spaces
' this is a string with white space '.strip

# remove white space from left and right side
'this is string with trailing white space '.rstrip
' left trailing white space'.lstrip

# return a string left justified and padded with character
'hello'.ljust(20, '.')

# check to see if string include character(s)
'hello World'.include?('World') # true (case sensitive)

# chaining 2 or more methods
'Hello World'.downcase.include? 'world' # true

# returns index position of substring - where it starts(starts at 0)
'Welcome to my site'.index('my') # 11

# return string characters
'This is a string'[1] # h
'This is a string'[0..3] # This
'This is a string'[-1] # g (last character)

# replace first sub string
'Hello dog where is my dog'.sub('dog', 'cat')

# replace all sub string
'Hello friends where are my friends'.gsub('friends', 'enemies')

# split a string into an array
'One Two Three'.split(' ') #['One', 'Two', 'Three']

# get console keyboard input from user - returns a string
input = gets
# remove last new line character
input = gets.chomp

# get command line arguments ex. ruby main.rb arg1 arg2
# command line arguments are in an array
puts ARGV # ['arg1', 'arg2']
ARGV.each { |value| puts value }

# ====== NUMBERS  ======
number.round(2.68) # 3
number.floor(2.68) # 2
number.ceil(2.68) # 3

4.next # 5

puts 3 / 2 # 1 (integers with integer result)
puts 3 / 2.0 # 1.5 (float with integer results in float)

2.even? # true
4.odd? # false

# random number
random_num = rand(1..100)

# ====== LOOPS  ======
loop do
  puts "This loop will continue since no break keyword"
end

loop do
  puts "this will print once to screen"
  break
end

loop do
  puts "this will print"
  next
  puts "this will be skipped"
end

while number < 100
  puts number
  number += 1
end

# Range - each method {} and do..end block
# block followed by method invocation
(1..10).each { |i| puts i }
(1..10).each do |i|
  puts i
end

5.times { puts "Hello world" }


# ====== CONDITIONALS ======
# Equality ==   AND &&   Or ||   Not !
if number == 1
  puts "number equals 1"
elsif number < 5
  puts "number is not 1 but it is less than 5"
else
  puts "number is greater than 5"
end

# Unless (negated if) - will run if the condition is false
puts "The user is not active" unless active == true

# Ternary Operator
active ? 'the user is active' : 'user is not active'

# Truthy or falsy
# false and nil are falsy values every other object is truthy

# case when else
case number
when 0
  "Too low"
when 1..50
  "getting close"
when 51..70
  "Much better!"
when 71..99
  "Great"
when 100
  "Perfect"
else
  "Score error"

# ====== ARRAY ELEMENT REFERENCE ======
fruits = ['apples', 'oranges', 'pears']
fruits = %w(apple orange banana)

fruits.length # 3
fruits.size # 3

fruits.first # Apple
fruits.last # Banana

fruits[0] # Apple
fruits[-2] # Orange
fruits[3] # nil
fruits[1..2] # ['Orange', 'Banana']

# iteration
fruits.each do |fruit|
  puts fruit
end

fruits.each do { |fruit| puts fruit }

# iteration with index
fruits.each_with_index do |fruit, index|
  puts "#{index}: #{fruit}"
end

# ====== ARRAY METHODS ======
fruits.include? 'Orange' # true
[1, 10, 3, 7, 2].sort #[1, 2, 3, 7, 10]
[1, 2, 3].reverse # [3, 2, 1]

# mutate the array - destructive methods
fruits.push "Strawberry" # append at end of array
fruits << "Pear" # append at end
fruits.unshift "Cranberry" # append at beginning

fruits.pop # remove last item
fruits.delete_at(0) # remove element at specified index
fruits.shift # remove the first element

# turns an array into a string with specified delimiter
fruits.join ', ' #  # apple, orange, banana

# Add in a new array
array1 = %w(hamster gerbil pig)
array2 = %w(dog cat)
array3 = array1 + array2 #['hamster', 'gerbil', 'pig', 'dog', 'cat']

# concat in the same array
array1.concat array2 # modifies array1
puts array1 #['hamster', 'gerbil', 'pig', 'dog', 'cat']

# construct arrays with a splat operator
puts ['dog', *array1, 'cat'] # ['dog', 'hamster', 'gerbil', 'pig', 'dog', 'cat']

# ====== TYPE CONVERSION ======
# number to string
22.to_s # '22'

# string to integer
'10'.to_i # 10
# string to float
'10'.to_f # 10.0

# convert to array
(1..10).to_a #[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
('a'..'e').to_a # ['a', 'b', 'c', 'd', 'e', 'f', 'g']

# convert array to hash
array1 = [[:foo, :bar], [1, 2]]
array1.to_h { foo: :bar, 1: 2}

# ====== HASH ======
product = {}
product['title'] = "FFXIV"
product[:price] = 80.99
product = { 'title' => 'FFXIV', 'price' => 80.99 }
product = { title: 'FFXIV', price: 80.99 }
puts product.fetch(:cost, 0) # fetches value at that key, if no key then returns default value of second argument

# returns an array of the hash keys
product.keys #[:title, :price]
product.values ['FFXIV', 80.99]
product.value?('FFXIV') # true

product.each do |key, value|
  puts "#{key} #{value}"
end

# Creates a new hash, inverting keys and values from hash; that is, in the new hash, the keys from hash become values and values become keys.
product.invert # { "FFXIV" => :title, 80.99 => 'price'}

# returns a new hash containing the contents of both hashes merged - overwriting pairs in hash with duplicate keys with those from the other hash
hash.merge(other_hash)

scores = { 'player' => 22, 'opponent' => 14 }
# creates a new hash for every pair the block evaluates to false
scores.reject do |key, value|
  value > 10
end # {"opponent" => 14}

scores.select { |key, value| value > 20 } # {"player" => 22}

scores.sort # converts hash to a 2-D array then sorts the array
# [["opponent", 14], ["player", 22]]

scores.to_s # converts hash to an array, then array to string
# ====== ERRORS/EXCEPTIONS HANDLING ======
raise "This is an exception"

# debug variable value
raise products.inspect

# Exception handling
begin
  # any exceptions here
  0 / 1
rescue
  # will make this code run
  puts "Exception"
  do_something()
end

# Exception object
begin
  0/1
rescue ZeroDivisionError => exception
  puts exception.class.name
  puts excpetion.message
end
