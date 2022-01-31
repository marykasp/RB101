def everyOther(integers)
  result = []

  integers.each_with_index do |num, idx|
    if idx.even?
      result.push(num)
    end
  end

  return result
end


p everyOther([1,4,7,2,5]) # => [1,7,5]

def every_even(integers)
  result = []
  counter = 0

  while counter < integers.length
    if counter.even?
      result.push(integers[counter])
    end
    counter += 1
  end
  result
end

p every_even([10, 3, 7, 45, 22])
