## Default Arguments

```ruby
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
```

Print [4, 5, 3, 6]

- First 1 is assigned to a, then 6 is assigned to d. This leaves only the arguments with default values. Since 5 has not been assigned to a value yet, it is given to b and c uses its default value of 3.

Arguments with defaults must be grouped together. When the method defines default arguments you do not need to supply all the arguments. Ruby will fill in the missing arguments in-order, will fill in the missing arguments from left to right
