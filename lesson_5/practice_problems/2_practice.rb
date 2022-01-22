books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# How would you order this array of hashes based on the year of publication of each book - from earliest to latest
# values are strings so will be compared character by character and all are the same length so can compare them without converting


books_sorted = books.sort_by do |hash|
  hash[:published]
end

# use sort_by and access a particular value in hash by which to sort - values are strings so can implement <=> method
p books_sorted
