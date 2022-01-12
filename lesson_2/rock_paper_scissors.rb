# ask user to make a choice
VALID_CHOICES = ['rock', 'paper', 'scissors']
def prompt(message)
  puts "=> #{message}"
end

choice = ''
loop do
  prompt("Choose one: #{VALID_CHOICES.join(", ")}")
  choice = Kernel.gets().chomp()

  if VALID_CHOICES.include?(choice)
    break
  else
    prompt("That's not a valid choice!")
  end

end

# returns a random element from the array
computer_choice = VALID_CHOICES.sample()
