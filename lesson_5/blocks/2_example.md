```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```

`map` method is called on a nested array
- each subarray gets passed to the block and assigned to the local variable `arr`
- inside the block `Array#first` is called on the subarray - returns the element at index 0 in that subarray
- that integer is returned to and used by the `puts` method to print a string representation to the screen
- `nil` is returned from `puts` which is then the return of the block
- `map` uses the block's return value as the transformed element to add to a new array upon each iteration
- `map` returns a new array containing a value for each element in the outer array - `[nil, nil]`

