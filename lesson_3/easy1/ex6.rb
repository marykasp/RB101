# ** show two different ways to put the expected "Four score and" in front

famous_words = "seven years ago..."
puts "Four score and " + famous_words
puts "Four score and #{famous_words}"

puts "Four score and " << famous_words
puts famous_words.prepend("Four score and ")
