# ** write a method that takes two arguments, integer and a boolean, and calculates the bonus for a given salary. If the boolean is true the bonus should be half of the salary. If false the bonus should be 0

# input: integer, boolean
# output: integer
# use a conditional to check the boolean condition
# - if true then take the intger argument / 2 (bonus)
# - if false return 0
# user ternary operator to keep it all on one line

def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800, true)
puts calculate_bonus(1000, false)
puts calculate_bonus(50000, true)
