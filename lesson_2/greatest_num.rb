# given a collection of integers (numbers) determine the largest value
# iterate through the collection one by one
# - save the first value as the starting value
# - for each iteration compare the saved value to the current value
# if the saved value is greater or the same, then go to the next iteration
# otherwise if current value is greater reassign the saved value to the current
# print the result of the saved value

# FORMAL PSEUDO CODE
# START
# SET saved_number = first value of the number collection
# SET iterator = 1

# WHILE iterator < length of the numbers
# iterate through the numbers collection
# SET current_number = the value of the current iteration
# IF current_number >= saved_number
  # saved_number = current_number
# ELSE
  # go to next iteration
# Increment iterator iterator += 1

# Print saved_number
#END

def greatest_num(numbers)
  saved_number = numbers[0]

  numbers.each do |num|
    if num >= saved_number
      saved_number = num
    else
      next
    end
  end

    return saved_number
end

numbers = [10, 56, 73, 32, 109, 22]
puts greatest_num(numbers)

def find_greatest(numbers)
  saved_number = numbers[0]
  counter = 0

  while counter < numbers.length
    current_value = numbers[counter]
    if numbers[counter] <= saved_number
      counter += 1
      next
    else
      saved_number = current_value
    end
  end

  return saved_number

end

puts find_greatest(numbers)
