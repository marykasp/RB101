```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```

`each` method returns the original collection - its called on a multidimensional array
- each subarray is passed to the block and assigned to the `arr` variable
- `Array#first` is called on each subarray - returns the element at index 0
- that value is returned to the `puts` method which outputs a string representation of the element to the screen and returns `nil`
- `each` does not do anything with the returned value of the block, instead the original collection gets returned
