def mess_with_vars(one, two, three)
  # the gsub! method mutates the caller, so the original string will be modified, the value will be replaced with the second argument passed into the gsub() method
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #=> "two"
puts "two is: #{two}" #=> three
puts "three is: #{three}" #=> one
