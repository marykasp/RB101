# The PEDAC Process

## P: Understanding the Problem

- Establish the rules/ define the boundaries of the problem
  - Assess available information given
  - Restate explicit requirements
  - Identify Implicit requirements
- Spend enough time. Don't rush this crucial step.

**General Example**

_Given a string, produce a new string with every other word removed_

- Explicit requirements:

  - Input: string
  - Output: new string
  - Remove every other word from input string

- Questions:

  - what do we mean by every other word? all of the odd or even words?
  - How do we define a word in this context?
    - words are delimited by spaces (more explicit understanding )

- Algorithm:
  - method takes a string as its input value
  - create a result variable set to an empty array
  - convert the string into a list of words
  - iterate over the list of words and if the index of that word is odd, push that word to the result array (`each_with_index`)
  - convert the result array to a string
  - return the new string

## E: Examples and Test Cases

- Can confirm/ refute assumptions
- Help to answer questions about implicit requirements
- Act as assertions which help to codify the rules and boundaries

## D: Data Structures

- how to get from input to output: how to represent data in a particular structure?
- Help to reason with data more logically
- Help interact with data at an implementation level
- Thinking in terms of data structures is part of problem solving process
- Data structures are closely linked to algorithms
  - Set of steps from input to output
    - Involves structuring data in a certain way

## A: Algorithms

- A logical sequence of steps for accomplishing a task or objective
  - Closely associated with data structures
  - Series of steps to structure data to produce the required output
- Stay abstract / high-level
  - Avoid implementation detail
  - Don't worry about efficiency for now

## C: Implementing a solution in Code

- Translating solution algorithm to code
- Think about algorithm in context of programming language
  - Language features and constraints
  - Characteristics of data structures
  - Built in functions and methods
  - Syntax and coding patterns
- Create test cases
- Code with intent

## **Sum Even Number Rows**

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

**Understand Problem**

- Sequence of even integers
- Sequence begins with 2
- Integers are consecutive
- Sequence grouped into rows
- Each row length is incrementally larger than the last: 1, 2, 3, ...
- Row number equals the number of elements in the row:
  - Row 1 has 1 element, row 2 has 2 elements....
- Input: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - Sum of all the integers in the selected 'row'

Sequence:
2, 4, 6, 8, 10, 12, 14, 16, 18..

2
4, 6
8, 10, 12
14, 16, 18, 20
....

- How do we create the structure?
  - A nested array - the `rows` are the nested arrays with integers located in an overall array

**Examples**
row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 4 --> sum of integers in row: 68

2 --> 2
4, 6 --> 10
14, 16, 18, 20 --> 68

**Data Structures**
2
4, 6
8, 10, 12
14, 16, 18, 20
....

- Overall structure representing sequence as a whole
- Individual rows within overall structure
- Individual rows in a set order in context of sequence
- Individual rows contain integers
- Integers are in a set order in the context of the sequence

```ruby
[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ...
]
```

- Given the number of a particular row we can access the nested array and sum its elements

**Algorithm**

- Create the data structure - up to and including the row indicated by the input integer
- Then obtain the indicated row
- Sum the integers of the row
- Return the sum

1. Create an empty 'rows' array to contain all of the rows
2. Create a 'row' array and add it to the overall 'rows' array
3. Repeat step 2 until all the necessary rows have been created

- All rows have been created when the length of the 'rows' array is equal to the input integer

4. Sum the final row (row indicated by input)
5. Return the sum

_Problem: Create a Row_

Rules:

- Row is an array
- Array contains integers
- Integers are consecutive even numbers
- Integers in each row form part of larger overall sequence
- Rows are of different lengths
- Input: the information needed to create the output:
  - The starting integer
  - Length of the row
- Output: the row itself: `[8, 10, 12]`

Examples:
start: 2, length: 1 --> `[2]`
start: 4, length: 2 --> `[4, 6]`
start: 8, length: 3 --> `[8, 10, 12]`

Data Structures:

- An array of integers

Algorithm:

1. Create an empty 'row' array to contain the integers
2. Add the starting integer to the row
3. Increment the starting integer by 2 to get the next integer in the sequence
4. Repeat steps 2 & 3 until the array has reached the correct length (second input)
5. Return the 'row' array

## Final Thoughts

- Not a completely linear process
- Move back and forth between the steps
- Switch from implementation mode to abstract problem solving mode when necessary
- Don't try to problem solve at the code level
