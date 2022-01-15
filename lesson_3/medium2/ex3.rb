# method creates a new local variable for each object that points to the same location in memory as the outer variable - copy of the reference (have same object_id)
def tricky_method(a_string_param, an_array_param)
  # the string is undergoing concatenation which is not a mutating method, so the original string would remain unchanged, reassigns the parameter variable to a new String object in memory
  a_string_param += "rutabaga" # reassigns variable to a new object_id
  # the shovel operator is a mutating method so the original array would be mutated
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
# ruby passes a reference of the values to the method
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # "pumpkins"
puts "My array looks like this now: #{my_array}" # ["pumpkins", "rutabaga"]
