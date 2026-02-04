# test_collapse.rb

require "minitest/autorun"
require_relative "collapse"

class TestCollapse < Minitest::Test
  def test_collapses_run_of_letter
    assert_equal "fo", collapse("fooooooo", "o")
  end

  def test_collapses_multiple_instances
    assert_equal "foxo", collapse("fooooxooo", "o")
  end

  def test_doesnt_collapse_when_absent
    assert_equal "fooooooo", collapse("fooooooo", "a")
  end

  def test_collapses_non_letters
    assert_equal "5412315", collapse("541123111115", "1")
  end

  def test_collapses_with_newline
    assert_equal "fo\no", collapse("fo\noo", "o")
  end

  def test_collapses_first_character
    assert_equal "foo", collapse("fffoo", "f")
  end

end