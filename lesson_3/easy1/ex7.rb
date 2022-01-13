flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones
p flintstones.flatten! # flattens the nested array into one array, modifies the caller

