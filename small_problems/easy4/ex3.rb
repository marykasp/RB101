# Leap year - leap year occurs in ever year that is divisble by 4, unless the year is also divisible by 100
# if the year is evenly divisible by 100 then it is not a leap year unless the year is divisible by 400

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

# List common cases first - years divisible by 400, then check if year is divisible by 100. If the year is anything else then it is a leap year if divisible by 4

p leap_year?(2016)
p leap_year?(2015)
p leap_year?(2100)
p leap_year?(2400)
leap_year?(240000)
leap_year?(240001)
leap_year?(2000)
leap_year?(1900)
leap_year?(1752)
leap_year?(1700)
leap_year?(1)
leap_year?(100)
leap_year?(400)

