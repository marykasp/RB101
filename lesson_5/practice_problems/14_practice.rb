hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# return a new array

new_arr = hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == "vegetable"
    value[:size].upcase
  end
end

p new_arr

# return an array where each item in the outer hash is represented by a value from within the nested hash
# since the value returned from map by the outer block depends on whether the :type is fruit or vegetbale need to use a conditional statement to perform different transformations on those values before being returned from the block
# the colors key holds an array value, so need to iterate over that array and transform each element
