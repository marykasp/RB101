# ** What do you expect to happen when the greeting variable is referenced in the last line of the code below?
if false
  greeting = "hello world"
end

# the conditional is always false so the if statement is never executed therefore greeting is never initialized and will be equal to nil
greeting

# **  Normally when you don't initialize a variable after declaring it Ruby will throw an error - undefined local variable.
# ! However, when you initialize a local variable within an if block, even if that if block doesn’t get executed, the local variable is initialized to nil
