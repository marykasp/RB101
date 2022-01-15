answer = 42

def mess_with_it(some_number)
  # reassignment so has variable point to a new object in memory - 42 + 8 = 50
  some_number += 8
end

new_answer = mess_with_it(answer)

# answer still points to the integer object 42, 42 - 8 = 34
p answer - 8 # => 34
