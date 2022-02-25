# ** Write a program that will ask the user for an input of a word or multiple words and give back the number of characters.
# Spaces counted as characters

def prompt(msg)
  puts ">>> #{msg}"
end

prompt "Please write a word or multiple words: "
word = gets.chomp.downcase

if word.split.size > 1
  count = word.gsub(/\s+/, "").size
  puts "There are #{count} characters in \"#{word}\""
else
  puts "There are #{word.size} characters in \"#{word}\""
end


# Test Cases
# Input: Please write word or multiple words: walk
# OUTPUT: There are 4 characters in walk

# INPUT: Please write word or multiple words: walk, don't run
