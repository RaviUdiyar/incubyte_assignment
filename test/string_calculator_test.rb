require 'minitest/autorun'
require_relative '../lib/string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_add
    test_cases = [
      ['', 0],
      ['0', 0],
      ['1', 1],
      ['1,3', 4],
      ['1\n2,3', 6],
      ['//;\n1;2', 3],
      ['//;\n9;2', 11]
    ]
    test_cases.each do |input, expected|
      @calculator.numbers = input
      assert_equal expected, @calculator.add
    end
  end
end
