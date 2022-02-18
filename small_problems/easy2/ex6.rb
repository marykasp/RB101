# ** Print all odd numbers from 1 to 99, inclusive, to the console with each number on a separate line

# original solution using each with do/end block
(1..99).each do |num|
  puts num if num.odd?
end

value = 1

while value <= 99
  puts value
  valut += 2
end

# upto method
1.upto(99) { |num| puts num if num.odd? }

# using select
numbers = Array.new(100) { |i| i }
puts numbers.select { |num| num.odd? }

(1..99).to_a.select(&:odd?)
