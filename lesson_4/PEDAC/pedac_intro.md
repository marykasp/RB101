## Problem:

Given a string, write a method `palindrome_substrings` which returns all the substrings from a given string which are palindromes. Palindromes are case sensitive.

# `P` - Understanding the Problem

## Questions:

1. What is a palindrome? - word that is the same forwards and is backwards

- ex. mom, dad, noon

2. What do you mean by a **substring**? - a string that is part of a larger string

- what is the minimum length to be considered a substring?

**input**: string
**output**: array of palindrome substrings

## rules:

- Explicit requirements:
  - every palindrome substring in the string must be returned
  - palindromes are case sensitive
- Implicit requirments:
  - return value should be a list of substrings
  - empty strings should return an empty array
  - string without palindroems should return an empty array

# `E` - Test Cases/Examples

```ruby
puts palindrome_substrings("noon") - ['noon', 'oo']
```

# `A`- Algorithm

- initialize a `result` variable to an empty array
- create an array `substring_arr` that contains all the substrings of the input string
  - substrings are at least 2 characters long
  - use `substring` method that returns an array
- loop through the `substring_arr`

  - if the substring is a palindrome, append it to end of the result array
    - use another method `palindrome?` that returns a boolean value

  ### palindrome? method

  - takes a substring as an argument
  - conditional statement to check if the string value is equal to its reversed value
  - if `true` will return boolean `true`

  ### substrings method

  - takes a string as an argument
  - create an empty array called `result` that will contain all the substrings of the string argument
  - create a `starting_index` value set to `0` for the starting index of the substring
  - start a loop that iterates over the string, will be executed as long as the `starting_index` is less than the `string_length - 2` - can't use last character in string since need 2 characters for a substring
    - ### inner loop
    - create a `num_chars` variable start with a value of `2` for the length of the substring
    - inner loop that runs while `num_chars` is less than `string.length - starting_index`
      - extract a substring of length `num_chars` from the string starting at `starting_index` - use slice method
      - append the extracted substring to the `result` array
      - increment the `num_chars` by 1
    - ### end inner loop
    - increment the `starting_index` by 1
    - end the outer loop
    - return the `result` array of substrings

  ### palindrome_substring method

  - initialize a result variable to an empty array
  - create an array named `substring_arr` that contains all the substrings of the input string that are at least 2 characters long
  - loop through the substrings in the `substrings` array
    - if the word is a palindrome, append it to the result array
  - return the result
