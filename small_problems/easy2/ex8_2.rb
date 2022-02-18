def compute_sum(number)
  total = 0
  1.upto(number) { |num| total += value }
  total
end

def computer_product(number)
  total = 1
  1.upto(number) { |num| total *= num }
  total
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to computer the sum, 'p' to compute the product"
operation = gets.chomp

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}"
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integeres between 1 and #{number} is #{product}"
else
  puts "unknown operation"
end
