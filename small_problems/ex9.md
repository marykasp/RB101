## Documentation

\*\*Find documentation for `YAML::load_file`

```ruby
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
```

`YAML` is a module in Ruby- when you click on the YAML documentation that is part of the Standard Library API the page that is returned is devoid of useful information. No Parent class is defined, and no methods are shown.

The last paragraph mentions for more information to look at Psych implementation.

https://ruby-doc.org/stdlib-2.6.3/libdoc/psych/rdoc/Psych.html

> For more advanced details on the implementation see Psych, and also check out yaml.org for spec details and other helpful information.

> load_file(filename, fallback: false) click to toggle source
> Load the document contained in filename. Returns the yaml contained in filename as a Ruby object, or if the file is empty, it returns the specified fallback return value, which defaults to false.
