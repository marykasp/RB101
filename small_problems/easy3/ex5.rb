# ** Using multiply method write a method that computes the square of its argument (square is the result of nultiplying a number by itself)

def multiply(num1, num2)
  num1 * num2
end

# implicitly returning the return value from multiply
def square(num)
  multiply(num, num)
end

puts square(5) == 25
puts square(-8) == 64

def power(num, n)
  n == 0 ? 1 : multiply(power(num, n-1), num)
end
