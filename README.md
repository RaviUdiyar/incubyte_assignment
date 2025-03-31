## String Calculator
Adds numbers given in string format.

### Input/Output Format
Input: “”, Output: 0
Input: “1”, Output: 1
Input: “1,5”, Output: 6

Default delimiter as "," and newlines "\n".
To change the delimiter, the beginning of the string will contain a separate line that looks like this: "//[delimiter]\n[numbers…]". For example, "//;\n1;2" 
Skips numbers above 1000. For example 1001 + 2 = 2

### How to use

#### Install dependencies
```ruby
 bundle install
```

#### Tests
```ruby
 bundle exec ruby test/*.rb
```
