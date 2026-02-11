require 'minitest/autorun'

class BigClass
  def initialize(x)
    raise "You can't instantiate this because the evil prof said so"
    @foo = 12
    @something = x
  end

  def self.function_to_test(x, y, z)
    (x + y) * z
  end
end

class BigClassTest < Minitest::Test
  def test_function_to_test
    result = BigClass.function_to_test(1, 2, 3)
    assert result == 9
  end
end