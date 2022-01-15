def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors # returns the list of factors for the number
end

# number % divisor == 0 conditional checks if the remainder is 0 if so then that number is added to the factors list
