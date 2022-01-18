loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts "Incorrect answer. Please answer 'yes'"
end

# how a loop can retrieve and handle input - use break keyword with condition - if the condition is true then break out of loop. If not include an error message and loop will start again
