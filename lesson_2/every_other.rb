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
