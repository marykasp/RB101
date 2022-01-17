## Mandatory Blocks

```ruby
a = [1, 4, 8, 11, 15, 19]
```

`Array#bsearch` is used to search an array, it takes a block as an argument and returns an element from the array that evaluates to true from the conditional in the block argument

### How would you search this Array to find the first element whose value exceeds 8?

```ruby
a.bsearch { |num| num > 8 } #=> 11
```
