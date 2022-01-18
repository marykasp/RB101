names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.size == 0
end

p names

# print from last to first
loop do
  puts names.pop
  break if names.empty?
end
