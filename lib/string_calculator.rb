# frozen string literal: true

# Input: a string of comma-separated numbers
# Output: an integer, sum of the numbers
# numbers: string input. example: "1,2,3" or "1\n2,3"
class StringCalculator
  def initialize(numbers)
    @numbers = numbers
  end

  def add
    return 0 if @numbers.empty?

    result = 0
    i = 0
    while i < @numbers.size
      char = @numbers[i]
      next if char == ','

      result += char.to_i
      i += 1
    end
    result
  end
end
