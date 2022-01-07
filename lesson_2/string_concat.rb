# a method that takes an array of strings, and returns a string that is all those strings concatenated together

# START
# SET result = empty string
# SET iterator = 0

# WHILE iterator <= length of the string array
# SET current_string = value within string collection at the current iteration
# Iterator += 1, increment by one
# Concatenate current_string to result variable

# PRINT result

# END

words = ["To", "be", "or", "not", "to", "be"]

def string_concatenation(arr_string)
  arr_string.join(" ")
end

def string_concat(arr_string)
  result = ""

  arr_string.each do |word|
    result += "#{word} "
  end

  return result
end

p string_concatenation(words)
p string_concat(words) # leaves a space at end of sentence
