## Included Modules

```ruby
a = [5, 9, 3, 11]
puts a.min
```

**find documentation for the `#min` method and change the code to print the two smallest values in the array**

`min(n) → array`
If the n argument is given, minimum n elements are returned as an array

```ruby
a = [5, 9, 3, 11]
puts a.min(2) # => [3, 5]
```

Ruby uses **min-in modules** which provide a way for classes of different types (`Arrays`, `Hashes`, `Ranges`) to share behaviors without inheritance. `Enumerable` module provides much of the functionality needed to iterate over collections.
