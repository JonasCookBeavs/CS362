require 'net/http'

class NetThing
  def do_thing(req)
    req.do_thing()
  end
end

class RequestWrapper

  def initialize(net)
    @net = net
  end

  def do_thing()
    if @net.to_hash.key?("x-special-header")
      return "OK"
    end
    nil
  end

end


if __FILE__ == $0
  # Run this stuff if this file is executed directly
  # but not if it is `require`d

  nt = NetThing.new

  req = Net::HTTP::Get.new('http://example.com/')
  rw = RequestWrapper.new(req)

  pp nt.do_thing(rw)   # nil

  req = Net::HTTP::Get.new('http://example.com/',
    {"x-special-header" => "Yes"})
  rw = RequestWrapper.new(req)
  pp nt.do_thing(rw)   # "OK"
end