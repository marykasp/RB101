# Case insensitive - ignore all non-alphanumeric characters

def palindrome?(word)
  # delete everything that isns't a letter or digit
  word = word.downcase.delete('^a-z0-9')
  word == word.reverse
end

p palindrome?('Madam')
p palindrome?("Madam, I'm Adam")
