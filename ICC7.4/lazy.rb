# If only one reference to @ac was replaced, you would still need to initialize @ac, which means that the code would still
# run slowly.

require 'minitest/autorun'

class AntelopeComputer
  attr_reader :computation_result

  def initialize
    sleep(1)
    @computation_result = 3490
  end
end

class AntelopeClassifier
  def initialize

  end

  def use_case_1
    self.getter.computation_result * 1
  end

  def use_case_2
    2
  end

  def use_case_3
    3
  end

  def use_case_4
    self.getter.computation_result * 4
  end

  def use_case_5
    5
  end

  def use_case_6
    6
  end

  def getter
    @ac ||= AntelopeComputer.new
  end

end

class AntelopeClassifierTest < Minitest::Test
  def setup
    @ac = AntelopeClassifier.new
  end

  def test_one
    assert_equal 3490, @ac.use_case_1
  end

  def test_two
    assert_equal 2, @ac.use_case_2
  end

  def test_three
    assert_equal 3, @ac.use_case_3
  end

  def test_four
    assert_equal 3490 * 4, @ac.use_case_4
  end

  def test_five
    assert_equal 5, @ac.use_case_5
  end

  def test_six
    assert_equal 6, @ac.use_case_6
  end

end