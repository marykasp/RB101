# ** Print all even numbers from 1 to 99, inclusive, to the console with each number on a separate line

(1..99).each { |num| puts num if num.even? }

even_nums = (1..99).select do |num|
  num.even?
end

puts even_nums
