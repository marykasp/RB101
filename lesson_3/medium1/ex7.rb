munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    # indexed reassignment - the elements in the collection have been changed, the elemment location now points to a new location in memory, the pointer has been moved for the elemnts but the collection still points to the same location
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# the overall collection is still pointing to same location in memory, but its elements have been modified
# yes the original hash has been mutated
mess_with_demographics(munsters) # passes a reference of the value into the method, so the locally scoped variable points to the same hash
p munsters
