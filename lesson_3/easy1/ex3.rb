# **Replace the word "important" with "urgent"
advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important','urgent') # ! will modify the caller
puts advice
