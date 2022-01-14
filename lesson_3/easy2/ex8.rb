advice = "Few things in life are as important as house training your pet dinosaur."

# slice!
puts advice.slice!(0, advice.index("house"))
puts advice

# using the non destructive version would return a new string but the advice variable would be unmodified - pointing to the original full string
