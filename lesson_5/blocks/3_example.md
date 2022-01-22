```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
```

`map` is called on the outer array - returns a new array of the first element in each subarray - `[1, 3]`
- subarray is passed into the block and assigned to the `arr` local variable
- `Array#first` is called on the subarray - returns first element in the array - `1 and then 3`
- those integers are then passed to `puts` which prints to screen and returns `nil` for each iteration
- the last line in the block again calls `#first` method on the subarray - returning the first element at index 0
  - these values are the ones returned by the block and used by `map` to create a new array with transformed values
