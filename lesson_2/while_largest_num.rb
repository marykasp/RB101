def prompt(message)
  puts ">> #{message}"
end

def generate_array(string)
  string.split(" ").map do |value|
    value.to_i
  end
end

def largest_number(numbers)
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

large_numbers = []
keep_going = true


while keep_going == true
  prompt("Please enter a collection of numbers: 1 2 3 4")
  answer = gets.chomp

  # convert to an array of integers
  collection = generate_array(answer)
  # find largest number
  num = largest_number(collection)
  # Push largest number to the large_numbers array
  large_numbers.push(num)

  prompt("Would you like to enter another collection? (y or n)")
  response = gets.chomp
  if response.downcase.start_with?('n')
    keep_going = false
  else
    keep_going = true
  end
end

puts "The largest numbers from each collection: #{large_numbers}"
