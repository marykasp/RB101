question = 'How many times does a particular character appear in this sentence?'

def select_letter(sentence, character)
	selected_char = ''
	counter = 0

	loop do
		break if counter == sentence.size
		current_char = sentence[counter]
		if current_char == character
      selected_char << current_char
    end
    counter += 1
	end
	selected_char
end

puts select_letter(question, 'a') # => "aaaaaaaa"
puts select_letter(question, 't') # => "ttttt"
puts select_letter(question, 'z') # => ""
