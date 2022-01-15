# method creates own local variables that contain the reference to the object, same object_id, and points to same location in memory
def tricky_method_two(a_string_param, an_array_param)
  # shovel operator mutates the caller, NO new string object is created, instead the original string will be modified
  a_string_param << 'rutabaga'
  # reassignment operator creates a new Array object in memory that now the local variable points to - has a different object_id and pointer than the outer variable
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
# method takes in a reference to the values - pass in object_id
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" # "pumpkinsrutabaga"
puts "My array looks like this now: #{my_array}" # ["pumpkins"]
