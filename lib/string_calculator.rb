# frozen string literal: true

# Input: a string of comma-separated numbers
# Output: an integer, sum of the numbers
# numbers: string input. example: "1,2,3" or "1\n2,3"
class StringCalculator
  DEFAULT_DELIMETERS = [',', '\n'].freeze

  def initialize
    @numbers = ''
  end

  attr_writer :numbers

  def add
    return 0 if @numbers.empty?

    result = 0
    i = 0
    sign = 1
    neg_numbers = []
    while i < @numbers.size
      char = @numbers[i]
      if char == '-' || sign == -1
        neg_numbers << "-#{@numbers[i + 1]}"
        i += 1
        next
      end

      result += char.to_i unless delimiters.include?(char)
      i += 1
    end
    raise ArgumentError, "negative numbers not allowed #{neg_numbers.join(',')}" if neg_numbers.any?

    result
  end

  def delimiters
    if @numbers.start_with?('//')
      @numbers = @numbers[2..]
      [@numbers[0]] + DEFAULT_DELIMETERS
    else
      DEFAULT_DELIMETERS
    end
  end
end
