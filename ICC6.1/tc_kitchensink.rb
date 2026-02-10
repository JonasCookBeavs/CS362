require_relative "kitchensink.rb"
require "test/unit"

class KitchenSink_For_Test < KitchenSink
  attr_reader :output_string

  @output_string
  @base
  @height

  def set_base_height(base, height)
    @base = base
    @height = height
  end

  def get_base_height
    return @base, @height
  end

  def output(area)
    @output_string = gets_output_string(area)
  end

  def triangle_area
    base, height = self.get_base_height
    area = 0.5 * base * height
    self.output(area)
  end
end

class TestKitchenSink < Test::Unit::TestCase

  def test_triangle_area
    k = KitchenSink_For_Test.new
    # How on Earth do we test triangle_area?
    #
    # Refactor KitchenSink so you can test that the output is correct.
    #
    # And we still want to call this method in the test:
    k.set_base_height(123, 456)
    k.triangle_area
    assert_equal(k.output_string, "The area is 28044.0")

  end

end
