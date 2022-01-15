def foo(param = "no")
  "yes" # returns "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# "yes" would be passed in to the bar() call
# "yes" == "no" which is false so "no" would be returns from bar()
puts bar(foo)
