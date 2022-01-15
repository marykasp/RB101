# local variables are created that point to the same object
def mess_with_vars(one, two, three)
  # in this method there is assignment to each other so now the variables are pointing to different objects
  puts ">> IDs inside the method:"
  one = two
  puts "One object ID: #{one.object_id}" # will be same object id as two
  two = three
  puts "Two object ID: #{two.object_id}" # will be same as three
  three = one
  puts "Three object ID: #{three.object_id}" # will be same as one
end

one = "one"
two = "two"
three = "three"
puts "OUTER VARIABLE IDS:"
puts "One: #{one.object_id}, Two: #{two.object_id}, Three: #{three.object_id}"
# reference of the value is passed in as arguments - pass in object_ids
mess_with_vars(one, two, three)

# the method doesn't return any values and assignment took place a non-mutating method so the values and object IDsof the outer variables will be unchanged
puts "one is: #{one}, ID: #{one.object_id}"
puts "two is: #{two}, ID: #{two.object_id}"
puts "three is: #{three}, ID #{three.object_id}"
