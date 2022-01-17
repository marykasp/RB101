# ** Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# input: string
# ouput: brand new string
# rules: if the word in the string is greater than 5 characters, reverse the word

# convert the string to an array of words, iterate over each word in the array, if the word is greater than 5 characters long (word.size) then reverse the word using #String.reverse, if not return just the word Then use Array#join to convert back to a string

def reverse_words(string)
  reversed_words = string.split.map do |word|
    word.size >= 5 ? word.reverse : word
  end
  reversed_words.join(" ")
end

# all in one line
def reverse(string)
  string.split.map {|word| word.size >= 5 ? word.reverse : word }.join(" ")
end

puts reverse_words('Professional')
puts reverse_words("Walk around the block")

puts reverse('Professional')

# using each to iterate over the string array
def reversed_words(string)
  words = []

  string.split.each do |word|
    # need to mutate the word with reverse! to add the modified word to the words array
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(" ")
end

puts reversed_words("Professional")
