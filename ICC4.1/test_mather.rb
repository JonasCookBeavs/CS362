require_relative "mather.rb"
require "minitest/autorun"

class TestMather < Minitest::Test

  def test_sum
    m = Mather.new(1, 2)
    assert_equal 3, m.sum
  end

  def test_difference
    m = Mather.new(1, 2)
    assert_equal(-1, m.difference)
  end

  def test_quotient
    m = Mather.new(4, 2)
    assert_equal(2, m.quotient)
  end

  def test_quotient_float
    m = Mather.new(1.0, 2.0)
    assert_equal(0.5, m.quotient)
  end

  def test_quotient_non_float
    m = Mather.new(1, 2)
    assert_equal(0, m.quotient)
  end

  def test_divide_by_zero
    m = Mather.new(1, 0)
    assert_raises(ZeroDivisionError) do
      m.quotient
    end
  end

end
