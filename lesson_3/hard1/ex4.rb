def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  ## return false if the input string array is more or less than 4, rest of code won't run since would be an invalid IP
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    # instead of breaking out of the while loop which would just go to the next line and always return true want to return false if the not an ip number
    return false unless is_an_ip_number?(word)
  end
  return true
end
