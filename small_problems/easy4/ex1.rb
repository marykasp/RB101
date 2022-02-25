# Write a method that takes two strings as arguments, determines the longest of the two strings, and returns the result of concatenating the shorter string, the longer and the shorter string once again

# def short_long_short(string1, string2)
#   if string1.size < string2.size
#     string1 + string2 + string1
#   else
#     string2 + string1 + string2
#   end
# end

def short_long_short(string1, string2)
  string1.size < string2.size ? string1 + string2 + string1 : string2 + string1 + string2
end

p short_long_short('abc', 'defgh') # 'abcdefghabc'
p short_long_short('abcde', 'fgh')
p short_long_short('', 'xyz')


def short_long_short_new(string1, string2)
  compare = string1.size <=> string2.size

  if compare == -1
    string1 + string2 + string1
  elsif compare == 1
    string2 + string1 + string2
  else
    puts "strings are equal length"
  end
end
