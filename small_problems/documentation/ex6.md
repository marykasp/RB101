## Keyword Arguments

```ruby
5.step(to: 10, by: 3) { |value| puts value }

5 8
#=> returns 5
```

`step(by: step, to: limit) {|i| block } -> self`

- `#step` takes two keyword arguments `:by` and `:to`
- Invokes the given block with the sequence of numbers starting at num incremented by step on each call
- Loop finishes when the value passed to the block is greater than limit
- returns the number it was called on
