```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
```
1. each of the inner arrays is compared with the other inner arrays
2. the way those arrays are compared is by comparing the elements within them

- the elements in the inner arrays are `strings` to sort by numerical value need to perform some transformation on the inner arrays prior to comparing them

```ruby
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
```

1. the transformed elements returned from `map` are what is used to perform the comparison
- returns a new array with intergers and leaves the original subarray unmodified
2. `sort` orders the outer array by comparing the transformed integers in the arrays
3. returns the original array as sorted - so will be `string` values
