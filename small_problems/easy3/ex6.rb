#** Write a function xor that takes two arguments - returns true if exactly one argument is truthy, false otherwise

def xor?(bool1, bool2)
  return true if bool1 && !bool2
  return true if bool2 && !bool1
  false
end

p xor?(5.even?, 4.even?)
p xor?(5.odd?, 4.even?)
