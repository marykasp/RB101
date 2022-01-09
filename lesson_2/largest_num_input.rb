# while user wants to keep going
# - ask the user for a collection of numbers
# - extract the largest one from that collection and save it
# - ask the user if they want to input another collection

# return saved list of numbers

def prompt(message)
  puts ">> #{message}"
end

def convert_num_array(collection)
  collection.split(" ").map do |value|
    value.to_i
  end
end

def largest_num(numbers)
  saved_number = numbers[0]
  numbers.each do |num|
    if num > saved_number
      saved_number = num
    else
      next
    end
  end

  return saved_number
end

loop do
  prompt("Please enter a collection of numbers (ex. 1 2 3 4)")
  collection = gets().chomp()

  # convert the string to an array of nummbers, reassing collection to that return value
  collection = convert_num_array(collection)
  result = largest_num(collection)
  puts "The largest number of #{collection} collection is #{result}"

  prompt("Would you like to enter another collection? (y to continue)")
  answer = gets().chomp()
  break unless answer.downcase.start_with?('y')
end





