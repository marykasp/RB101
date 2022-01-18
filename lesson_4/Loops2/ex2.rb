loop do
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end

# between? takes two integer arguments and returns a boolean, if the caller's value is between the two integers it will return true and the loop will be broken out of
