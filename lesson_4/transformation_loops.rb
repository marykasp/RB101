def general_produce_selection(produce_list, criteria)
  selected_produce = {}
  for key, value in produce_list
		if value == criteria
      selected_produce[key] = value
    end
	end
  selected_produce
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p general_produce_selection(produce, 'Fruit')
p general_produce_selection(produce, "Vegetable")
