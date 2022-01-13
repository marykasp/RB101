## Question 2

Describe the difference between `!` and `?` in Ruby
`!` added to the end of a method will cause the method to mutate the caller
`?` indicates that the method returns a boolean value

1. what is `!=` and where should you use it?

- `!=` is a comparison operator meaning not equal to, should be used in a conditional statment

2. put `!` before something, like `!user_name`

- `!` before an expression will negate that expression, so will flip the truthiness or falsiness of whatever expression follows

3. put `!` after something like `words.uniq!`

- this is a naming convention used to show that the method will mutate the caller

4. put `?` before something

- this can occur in a ternary operator, where the first operand after the `?` is the expression that will be executed if the conditional statement returns true

5. put `?` after something

- this can occur with a method, usually denotes that the output will be a boolean

6. put `!!` before something, `!!user_name`

- means `not not` and will result in the object or expression boolean equivalent, its truthiness or faslsiness
