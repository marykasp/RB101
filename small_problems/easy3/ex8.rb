# ! Write a method that returns true if the string passed as an argument is a palindrome (same in reverse), false otherwise
# ** Palindrome reads the same forward and backward

def palindrome?(word)
  word.reverse == word
end

puts palindrome?('madam')
puts palindrome?('Madam')
puts palindrome?("madam i'm adam")
puts palindrome?('356653')

# write a method that determines wheter an array is palindromic


