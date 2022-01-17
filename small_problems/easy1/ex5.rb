# ** write a method that takes one argument, returns a new string with the words in reverse order

# input: string
# output: brand new string
# test case requirments: if the input is an empty string, will return an empty string, if there is a string with spaces will strip and remove those spaces

# convert string to an array, array of words - use Array#reverse to reverse the order of the elements, then Array#join to convert the array back to a string
def reverse_sentence(string)
  string.split.reverse.join(" ")
end

sentence = 'Hello World'
puts reverse_sentence(sentence)
puts sentence

# split splits on whitespace when invoked without an argument and '' and '  ' cuase split to return an empty array
