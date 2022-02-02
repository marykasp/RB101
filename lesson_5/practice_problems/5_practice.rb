munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# total age of just the male members of the family

total = 0
munsters.each_value do |hash|
  total += hash["age"] if hash["gender"] == "male"
end


puts total

# using reduce method
total_male_ages = munsters.values.reduce(0) do |memo, nested_object|
  nested_object["gender"] == "male" ? memo += nested_object["age"] : memo
end

p total_male_ages
