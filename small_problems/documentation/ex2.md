## Optional Arguments

```ruby
require 'date'

puts Date.civil
#-4712-01-01
puts Date.civil(2016)
# 2016-01-01
puts Date.civil(2016, 5)
# 2016-05-01
puts Date.civil(2016, 5, 13)
#2016-05-13
```

**What will each of the `puts` statements print?**

Can find information about the `Date` class in **Ruby's Standard Library Documenation**

`Date.civil` is a class method called on the `Date` class that creates a date object denoting the given calendar date

- takes optional arguments `[]`- first is the year, second is months, and third is the day
- if no arguments are entered then defaults to -4712-01-01

```ruby
Date.civil([year=-4712[, month=1], day=1)
```
