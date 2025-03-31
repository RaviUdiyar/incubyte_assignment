require 'minitest/autorun'
require_relative '../lib/calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_add
    assert_equal 0, @calculator.add('')
    assert_equal 0, @calculator.add('0')
    assert_equal 1, @calculator.add('1')
    assert_equal 4, @calculator.add('1,3')
    assert_equal 6, @calculator.add('1\n2,3')
    assert_equal 3, @calculator.add('//;\n1;2')
    assert_equal 11, @calculator.add('//;\n9;2')
    assert_
  end
end
