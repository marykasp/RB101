# ** write a method that takes 2 arguments, string and positive integer, and prints the string as many times as integer indicates
# Integer#times executes the code block the specified number of times, method is called on an Integer class so can use the number argument

def repeat(string, number)
  number.times do
    puts string
  end
end

repeat('Hello', 3)
