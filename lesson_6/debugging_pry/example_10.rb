=begin
Write a method that takes as an argument an array of integers and returns a new array with the integers transformed. If the integer is divisible by 3 it should return "fizz", if divisible by 5 should be replaced by Buzz. If divisible by neither just return the number as is
=end

require 'pry'

def fizzbuzz(arr)
  arr.map do |num|
    if num % 5 == 0 && num % 3 == 0
      "FizzBuzz"
    elsif num % 5 == 0
      "Buzz"
    elsif num % 3 == 0
      "Fizz"
    else
      num
    end
end

p fizzbuzz([1, 3, 6, 9])
