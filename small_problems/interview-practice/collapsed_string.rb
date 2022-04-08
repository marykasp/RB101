# def collapse(string)
#   collapsed_string = ""
#   index = 0

#   while index <= string.length
#     # current character compare to next character in string using index position
#     if string[index] == string[index + 1]
#       index += 1
#       next
#     else
#       collapsed_string << string[index]
#     end
#     index += 1
#   end
#   return collapsed_string
# end

def collapse(string)
  # first convert the input to a string
  string = string.to_s
  collapsed_string = ""
  index = 0

  while index <= string.length
    # if the conditional expressionn is false - the characters are different then that character will be added to the new string
    collapsed_string << string[index] unless string[index] == string[index + 1]
    index += 1
  end
  collapsed_string
end

# VALID CASES
p collapse("ww")
p collapse("aaaaa")
p collapse("wwwwooonnderful wwoorlld")

# EDGE CASES
p collapse('') # returns an empty string
p collapse(12234)

