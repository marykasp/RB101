```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# 18
# 7
# 12
# => [[18, 7], [3, 12]]
```

- first there is a variable assignment `my_arr` which would be assigned to the return value of calling `each` on the outer array - returns original collection - `[[18, 7], [3, 12]]`
  - what is returned from the block is not considered by `each` method
- `each` is called on the outer array (calling object), return value is used by the variable assignment
- the subarrays are passed into the block and saved to the local variable `arr`
- inside the outer block the `each` method is called on the subarrays
- each element in the subarray is passed into the block and saved in the local variable `num`
- inside the inner block `if` conditional statment is used
- `num > 5` returns a boolean value that is then used by the `if` statement - if true then the next line will be executed
  - if the number passed in is greater than 5 then that number will be passed to `puts`, printed to the screen and returns `nil` - `nil` is the returned value of the `if` statment
- the inner `each` statement just returns the original collection - so each subarray would be returned
- the outer `each` statement returns the original collection it is called on
