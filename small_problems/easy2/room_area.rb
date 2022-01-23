def prompt(message)
  puts "#{message}"
end

def area(length, width)
  length * width
end

def get_area
  prompt("What is the length of the room in meters?")
  length = gets.chomp.to_f

  prompt("What is the width of the room in meters?")
  width = gets.chomp.to_f

end
