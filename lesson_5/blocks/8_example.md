only want to select integers greater than 13 but strings less than 6 characters
```ruby
arr = [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]

arr.map do |sub_arr|
  sub_arr.select do |item|
    if item.to_s.to_i == item
      item > 13
    else
      item.size < 6
    end
  end
end

# => [[27], ["apple"]]
```

1. First need to access the nested arrays before we can select the value we weant.
2. `map` method is used not only to iterate over the array and access the nested arrays, but to return a new array containing the selected values
  - `each` would just return the original collection
