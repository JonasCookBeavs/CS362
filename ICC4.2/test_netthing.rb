require 'minitest/autorun'
require_relative 'netthing'

class TestReq
  def initialize(hash = {})
    @hash = hash
  end

  def to_hash()
    @hash
  end
end

class NetThingTest < Minitest::Test
  def test_do_thing_no_param()
    nt = NetThing.new
    # DON'T WANT TO MAKE A REAL REQUEST HERE
    #req = Net::HTTP::Get.new('http://example.com/')
    req = TestReq.new()
    result = nt.do_thing(req)
    assert result == nil
  end

  def test_do_thing_with_param()
    nt = NetThing.new
    # DON'T WANT TO MAKE A REAL REQUEST HERE
    #req = Net::HTTP::Get.new('http://example.com/',
    #  {"x-special-header" => "Yes"})
    req = TestReq.new({"x-special-header" => "Yes"})
    result = nt.do_thing(req)
    assert result == "OK"
  end
end