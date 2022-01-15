```ruby
a_outer is 42 with an id of: 85 before calling the method.
b_outer is forty two with an id of: 2152753560 before calling the method.
c_outer is [42] with an id of: 2152753540 before calling the method.
d_outer is 42 with an id of: 85 before calling the method.
```

Inside the method defintion, variables were initalized and object_ids were printed to the screen

On next line the method calls another method and passes the variables as arguments to the method

```ruby
a_outer id was 85 before the method and is: 85 inside the method.
b_outer id was 2152753560 before the method and is: 2152753560 inside the method.
c_outer id was 2152753540 before the method and is: 2152753540 inside the method.
d_outer id was 85 before the method and is: 85 inside the method.

```

inside the first method after the method call, the variables would still point to the same object in memory so nothing changed

```ruby
a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
b_outer inside after reassignment is thirty three with an id of: 2152753560 before and: 2152752300 after.
c_outer inside after reassignment is [44] with an id of: 2152753540 before and: 2152752280 after.
d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.
```

As before with the block version of this practice problem, when we change the values of our "outers", Ruby uses new objects for these variables to deal with their new values.
