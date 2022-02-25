operations = %w(+ - * / % **)
numbers = []

def prompt(msg)
  puts ">>> #{msg}"
end

def valid?(num)
  num.to_s.to_i == num && num > 0
end

prompt "Enter the first number: "
number1 = gets.chomp.to_i
numbers << number1

number2 = nil
loop do
  prompt "Enter the second number: "
  number2 = gets.chomp.to_i
  if valid?(number2)
    numbers << number2
    break
  end
  prompt "Must enter a positive number"
end

operations.each do |op|
  prompt "#{number1} #{op} #{number2} = #{numbers.reduce(op)}"
end
