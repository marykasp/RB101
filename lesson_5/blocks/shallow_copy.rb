def remove_evens!(arr)
  cloned_arr = arr.dup
  puts "#{cloned_arr}" # [1,1,2,3,4,6,8,9]
  # iterate through the cloned array
  cloned_arr.each do |num|
    # check if integer element is divisible by 2
    if num % 2 == 0
      # delete the integer from the arr collection
      puts "#{arr}"
      arr.delete(num)
    end
  end
  puts "#{cloned_arr}" # remains the same, elements were not deleted
  arr
end

p remove_evens!([1,1,2,3,4,6,8,9])
