# a method that determines the index of the 3rd occurrence of a given character in a string.

word = 'axbxcdxex'
# find 3rd occurrence of 'x'

def find_index(string, given_char)
  count = 0

  index = string.split('').each_with_index do |char, idx|
    if char == given_char
      count += 1
    end
    if count == 3
      return idx
    end
  end

  if count < 3
    return nil
  end

  return index
end

puts find_index(word, 'x')
p find_index(word, 'a')

