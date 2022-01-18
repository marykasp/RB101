# input: a string
# output: an array of substrings
# rules: palindrome words should be case sensitive, meaning "abBA"
#        is not a palindrome

# Algorithm:
#  substrings method
#  =================
#    - create an empty array called `result` that will contain all required substrings
#    - create a `starting_index` variable (value `0`) for the starting index of a substring
#    - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#      - create a `num_chars` variable (value `2`) for the length of a substring
#      - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#        - extract a substring of length `num_chars` from `string` starting at `starting_index`
#        - append the extracted substring to the `result` array
#        - increment the `num_chars` variable by `1`
#      - end the inner loop
#      - increment the `starting_index` variable by `1`
#    - end the outer loop
#    - return the `result` array
def substrings(string)
  result = []

  # nested loops
  starting_index = 0
  while starting_index <= string.length - 2
    num_chars = 2
    while num_chars <= (string.length - starting_index)
      substring = string[starting_index, num_chars]
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

#  is_palindrome? method
#  =====================
# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.

def is_palindrome?(substring)
  substring == substring.reverse
end

#  palindrome_substrings method
#  ============================
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array
def palindrome_substrings(string)
  result = []

  substring_arr = substrings(string)
  substring_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end

  result
end

p palindrome_substrings('professional')
p substrings('love')
p palindrome_substrings('love') # no palindromes so returns an empty array
