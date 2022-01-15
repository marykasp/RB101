# this method adds a new element to the end of the array, mutates the caller, so the original array passed in will be modified and returned
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# this method using an assignment (concatenation), so the buffer variable returned will be pointing to a new object in memory, the original input_array will remain unchanged
def rolling_buffer2(input_array, max_buffer_size, new_element)
  input_array = input_array + [new_element]
  input_array.shift if input_array.size > max_buffer_size
  input_array
end

arr = [1, 2, 3]
p rolling_buffer2(arr, 4, 10)
p arr

arr_two = [10, 9, 8]
p rolling_buffer1(arr_two, 5, 12)
p arr_two
