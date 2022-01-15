# ** How can we change this code to make the result easier to predict and easier for the next programmer to maintain? That is, the resulting method should not mutate either argument, but my_string should be set to 'pumpkinsrutabaga' and my_array should be set to ['pumpkins', 'rutabaga']


def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
end

my_string = "pumpkins"
my_array = ["pumpkins"]
# ** reassign the strings to the return values from calling the method
my_string, my_array = tricky_method(my_string, my_array)

# now the variables point to a new object and new location in memory due to the reassignment, the original value objects still remain in memory but are not bound to any variable
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
