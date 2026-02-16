require 'minitest/autorun'
require_relative 'client'

class TestClient < Minitest::Test
  def test_client_upper
    tc = TextChanger.new("Hello!")
    assert tc.uppercase == "HELLO!"
    tc = TextChanger.new("hello")
    assert tc.uppercase == "HELLO"
    tc = TextChanger.new("HELLO")
    assert tc.uppercase == "HELLO"
    tc = TextChanger.new("AbCdEf")
    assert tc.uppercase == "ABCDEF"
  end

  def test_client_lower
    tc = TextChanger.new("Hello!")
    assert tc.lowercase == "hello!"
    tc = TextChanger.new("HELLO")
    assert tc.lowercase == "hello"
    tc = TextChanger.new("hello")
    assert tc.lowercase == "hello"
    tc = TextChanger.new("AbCdEf")
    assert tc.lowercase == "abcdef"
  end
end
