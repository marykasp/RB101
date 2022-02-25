# ** Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers

counter = 1
numbers = []

def joinor(counter)
  case counter
  when 1
    "st"
  when 2
    "nd"
  when 3
    "rd"
  else
    "th"
  end
end

loop do
  puts "Please enter the #{counter}#{joinor(counter)} number: "
  num = gets.chomp.to_i
  counter += 1
  numbers << num
  break if counter == 7
end

first_five = numbers[0..4]
if first_five.include?(numbers[numbers.size - 1])
  puts "The number #{numbers[5]} appears in #{first_five}"
else
  puts "The number #{numbers[5]} does NOT appear in #{first_five}"
end


