## Method Types

**Locate the ruby documentation for methods File::path and File#path. How are they different?**

Both methods can be found on the documentation page for the `File` class in the Core API section

`File::path` is a class method, can only be called directly on the `File` class itself - returns the string representation of the path

- takes a path as its argument

```ruby
File.path("/ls/exercises") #=> "/ls/exercises
```

`File#path` is an instance method, is called on an object of the `File` class

- returns the pathname used to create the file as a string, does not take in any arguments

```ruby
new_file = File.new("testfile")
new_file.path #=> "testfile"
```
