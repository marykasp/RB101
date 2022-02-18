# ** Build a program that displays when the user will retire and how many years she has sto work till retirement

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

current_year = Time.now.year
years_to_work = retire_age - age
year_of_retirement = current_year + years_to_work

puts "It's #{current_year}. You will retire in #{year_of_retirement}"
puts "You only have #{years_to_work} years of work to go!"
