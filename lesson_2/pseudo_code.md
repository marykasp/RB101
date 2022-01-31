### Method that returns the sum of two integers

- take both integers as arguments to the method
- add the two integers together and return the value

START

- SET number1 = integer value or GET number from a user
- SET number2 = integer value or GET number from a user

Add numbers together inside method, return value

- SET result = return value of method call

PRINT result

### a method that takes an array of strings, and returns a string that is all those strings concatenated together

- create a result variable that is an empty screen
- iterate over the array of strings
- for each iteration concatenate the current value to the result
- return the result from the method

START

- SET result = empty string
- SET iterator = 1

WHILE iterator <= length of the string array

- Concatenate current_string to result variable

PRINT result

END

### a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance:

```ruby
everyOther([1,4,7,2,5]) # => [1,7,5]
```

Given a collection of integers

- create a new empty array
- Iterate through each element in the collection
  - if the index position of the value is even, save value in a new array
  - else skip to next iteration
    print the result

START
Given an array of integers
SET result = empty array
SET iterator = 0

WHILE iterator < length of integer array

- iterate over the array elements
- IF iterator is even
  - push the current value of the iteration to the result variable
- ELSE
  - skip the iteration

PRINT result

### a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

Given a string

- Set a count variable to keep track of the number of times a character occurs in a string
- Iterate over the string character by character
- Iterator variable to keep track of the index of the character currently on
- Check for each character if it matches with the given character if so increment the count by 1
- when count becomes 3 return the iterator variable

START
SET count = 0
SET iterator = 0
convert the string to an array to iterate over

WHILE iteration < length of the string

- SET current_character = value of the current iteration
- iterator += 1
- IF current_character == given character
  - count += 1
- IF count == 3

  - break out of loop, return iterator value

- Outside of Loop IF count < 3
  - return nil

PRINT returned index value

### a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should becoome the elements at the odd indexes. For instance:

```ruby
merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]
```

#### Given two arrays of numbers

- concatenate the arrays together to get one array
- iterate through the array, with index position
- if the index position is even reassign the value to one of the values in the first array
- when the index position is 2 set the value
