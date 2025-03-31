# frozen string literal: true

# Input: a string of comma-separated numbers
# Output: an integer, sum of the numbers
# numbers: string input. example: "1,2,3" or "1\n2,3"
class StringCalculator
  def initialize
    @numbers = ''
  end

  attr_writer :numbers

  def add
    return 0 if @numbers.empty?

    result = 0
    i = 0
    while i < @numbers.size
      char = @numbers[i]
      result += char.to_i if char != ','
      i += 1
    end
    result
  end
end
