hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# output all the vowels from the strings
vowels = 'aeiou'

hsh.each_value do |arr|
  arr.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

# first iterate through the hash values to access the arrays
# iterate through the arrays to access each string
# String#chars to conver the strings to an array of characters
# iterate through the array of characters and use puts to print the characters that met the condition
