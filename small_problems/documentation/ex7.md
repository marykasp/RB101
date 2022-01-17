## Parent Class

```ruby
s = 'abc'
puts s.public_methods.inspect
```

Every value in Ruby is an object, which means it has an associated class, and that class has a superclass, or parent. Every class that inherits from a superclass also inherits all of its methods.

The parent of the `String` class is the `Object` class - so `String` inherits methods from `Object`

`public_methods(all=true) → array`

`#public_methods` is not found in the `String` documentation but is found on the `Object` class - returns a list of all public methods accessible to the object.

If `all` argument is set to `false` only those methods in the receiver will be listed

```ruby
s = 'abc'
puts s.public_methods(false).inspect
```
