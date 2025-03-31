require 'minitest/autorun'
require_relative '../lib/string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
    @test_cases = [
      ['', 0],
      ['0', 0],
      ['1', 1],
      ['1,3', 4],
      ['11,22', 33],
      ['1\n2,3', 6],
      ['//;\n1;2', 3],
      ['//;\n9;2', 11]
    ]
    @assert_raises = [
      ['1,-2', ArgumentError, 'negative numbers not allowed', [-2]],
      ['1,2,3,-4', ArgumentError, 'negative numbers not allowed', [-4]],
      ['-1,-2,3', ArgumentError, 'negative numbers not allowed', [-1, -2]]
    ]
    @ignore_numbers = [
      ['1,1001', 1],
      ['1,1001,2', 3],
      ['1,1001,2,1001', 3]
    ]
  end

  def test_add
    @test_cases.each do |input, expected|
      @calculator.numbers = input
      assert_equal expected, @calculator.add
    end
  end

  def test_negative_numbers
    @assert_raises.each do |input, expected, message, number|
      @calculator.numbers = input
      err = assert_raises(expected) { @calculator.add }
      assert_includes err.message, message
      assert_includes err.message, number.join(',')
    end
  end

  def test_ignore_numbers
    @ignore_numbers.each do |input, expected|
      @calculator.numbers = input
      assert_equal expected, @calculator.add
    end
  end
end
