arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# use map method to return a new array where the value of each integer is incremented by 1

arr.map do |hash|
  incremented_hsh = {}
  hash.each do |key, value|
    incremented_hsh[key] = value + 1
  end
  incremented_hsh
end

# map iterates through the array, creates a new hash
# then iterates through the hash sub object for that iteration to add key:value pairs to the this new hash
# the outer block returns this incremented hash to map which uses it to transform each element in the array
