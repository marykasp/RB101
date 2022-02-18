# Kernel.format

Kernal#format is a convenient way to format output values as strings

- round floats to a specified number of decimal places
- display a specified number of digits

`format(format_string, arguments_to_be_formatted)`

The format string is a squence of elements wrapped in quotes, beginning with a percent sign. The elements in [brackets] are optional.

"%[flags][width][.precision]type"

## Type

the last element in the format string, the **field type** is indicated with one character

- `d or i` for integer
- `f` for float
- `s` for string

## Precision

Written with a perio and an integer. It controls the number of characters displayed.
`format("%.2f", 3.14159)` => 3.14
