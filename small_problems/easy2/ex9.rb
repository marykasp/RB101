name = "Bob"
save_name = name
name = "Alice"

puts name, save_name # => "Alice", "Bob"

name = "Bob"
save_name = name # points to same object as name
name.upcase! # destructive method that modifies the string object referenced in the name variable

puts name, save_name
# BOB
# BOB

# assignment just assigns a reference to a variable - both name and save_name reference the same string object in memory. When you apply name.upcase! it mutates its caller - so it modifies the string object that the name variable references. So the string object that save_name references also changes since it points to the same object as name
