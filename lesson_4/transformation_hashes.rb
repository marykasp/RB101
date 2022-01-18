produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def produce_selectionn(produce_list, criteria)
  counter = 0
  selected_produce = {}
  produce_keys = produce_list.keys

  loop do
    break if counter == produce_keys.size
    current_key = produce_keys[counter]
    current_value = produce_list[current_key]
    if current_value == criteria
      selected_produce[current_key] = current_value
    end
    counter += 1
  end
  selected_produce
end
