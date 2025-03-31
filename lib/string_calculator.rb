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
    while i < @numbers.size
      char = @numbers[i]
      result += char.to_i unless delimiters.include?(char)
      i += 1
    end
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
