# ** How could the following method be simplified without changing its return value?
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_value(color)
  color == "blue" || color == "green"
end
