```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
```
- top level array is a 2 element array
- middle level array - one is 4 elements, the other is 3
- inner arrays are all single element arrays

1. the first method call within the `map` block is `each`
- `each` does not care about the block's return value and always returns the calling object
- the return value of `map` will be a new array that matches the value of the calling object
