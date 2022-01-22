```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2, 4], [6, 8 ]]
```

- `map` is called on the outer array
- subarray is passed into the `map` block and saved to the `arr variable`
- inside the block `map` is called on the subarrays
- the objects inside the subarrays are passed into the inner block and saved to the `num` variable
- the inner block `num * 2` returns a new transformed value
- the inner `map` uses that returned value and creates a new subarray
- those new subarrays are used by the outer `map` method to create a new array of transformed elements
