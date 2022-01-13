# ** Turn this into an array containing only two elements: Barney's name and Barney's number
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# assoc() searches through the hash compares the argument object with the key and returns the key-value pair in an array
p flintstones.assoc("Barney")

