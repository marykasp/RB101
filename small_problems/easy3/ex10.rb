# Write a method that returns true if its integer argument is palindromic

# first convert integer to a string
def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

p palindromic_number?(34543) # true
p palindromic_number?(123210) # false
p palindromic_number?(22) # true
p palindromic_number?(5) # true
p palindromic_number?(0022)

# Ruby will remove the 0s if a number is lead by any number of 0s - leaving you with just a final digit
