greetings = { a: 'hi' }
informal_greeting = greetings[:a] # => "hi"
informal_greeting << ' there' # "hi there"

# informal greeting = informal_greeting + " there" - non-mutating method, assignment would have had informal greeting point to a new string object in memory

puts informal_greeting  #  => "hi there"
puts greetings # => { a: 'hi there' }

# ** informal_greeting variable is a reference to the hash collection, to a specific element in the collection, when the shovel << operator was used it modified that element in the collection since its a mutating method and its poinnting to the same collection in memory

# ! collections are stored in a specific location in memory, and the elements within a collection (indexed assignment) have references to the individual objects that make up the collection elsewhere in memory
# ! if the elements in a collection are modifed the entire collection will be updated
