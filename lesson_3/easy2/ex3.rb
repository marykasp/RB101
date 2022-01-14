ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add a hash to the end of the ages hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)

p ages # modified
p additional_ages
