# ** create a simple tip calculator. The program should prommpt for a bill amount and a tip rate

puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_rate = gets.chomp.to_f

# computer the tip
tip = ((tip_rate / 100) * bill)
total = (tip + bill)

puts "The tip is $#{format("%.2f", tip)}"
puts "The total is $#{format("%.2f", total)}"

# first obtain the amount of the bill from the user and convert the string value to a float. Then we ask the user for the tip percentage

# Next, calculate the actual tip and the total bill, then output the results
# Can round the tip and total to 2 decimal places by calling the round(2) method.

