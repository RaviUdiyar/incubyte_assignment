# frozen string literal: true

# Input: a string of comma-separated numbers
# Output: an integer, sum of the numbers
# numbers: string input. example: "1,2,3" or "1\n2,3"
class StringCalculator
  attr_reader :numbers

  def initialize
    @numbers = ''
  end

  def numbers=(string)
    @numbers = string_to_numbers(string)
  end

  def add
    return 0 if numbers.empty?

    result = 0
    neg_numbers = numbers.select(&:negative?)
    raise ArgumentError, "negative numbers not allowed #{neg_numbers.join(',')}" if neg_numbers.any?

    numbers.each do |number|
      # Numbers bigger than 1000 should be ignored, so adding 2 + 1001 = 2
      result += number if number <= 1000
    end

    result
  end

  def string_to_numbers(string)
    result = []
    if string.start_with?('//')
      string = string[2..]
      result = string.split(/[\\n#{string[0]}]/)
    else
      result = string.split(/[\\n,]/)
    end
    result.map(&:to_i).compact
  end
end
