# ** Write a method that takes one integer argument (positive, negative, or zero). Returns true if the number's absolute value is odd

# must check whether the number modulo 2 is 1, modulo always returns a non-negative result if the number on the right is positive

def is_odd?(number)
  number % 2 == 1
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts is_odd?(0)
