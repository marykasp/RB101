## Multiple Signatures

**What do each of these `puts` statements output?**

`Array#fetch` returns the element at position index, but throws an IndexError if the referenced index lies outside the array bounds

- to prevent the error can supply the method a second argument, which will act as the default value
- if given a block, the block will only be executed when an invalid index is referenced

fetch(index) → obj
fetch(index, default) → obj
fetch(index) { |index| block } → obj

```ruby
a = %w(a b c d e)
puts a.fetch(7) # => IndexError, index 7 is out of bounds
puts a.fetch(7, 'beats me') #=> 'beats me'
puts a.fetch(7) { |index| index**2 } #=> 49
```
