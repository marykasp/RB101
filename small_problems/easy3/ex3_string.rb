def prompt(msg)
  puts ">>>> #{msg}"
end

prompt "Please write a word or multiple words "
input = gets.chomp
# delete the spaces and return a new word with all spaces removed
number_characters = input.delete(' ').size

puts "There are #{number_characters} characters in #{word}"
