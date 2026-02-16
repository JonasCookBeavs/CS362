require 'socket'
require 'uri'

class TextChanger
  def initialize(word)
    @word = word
  end

  def get_case(upperorlower)
      query_string = URI.encode_www_form({ word: @word })
      socket = TCPSocket.open('localhost', 8000)
      socket.print "GET /#{upperorlower}/?#{query_string} HTTP/1.1\r\n" \
                  "Host: localhost:8000\r\n" \
                  "Connection: close\r\n\r\n"
      response = socket.read
      socket.close
      response.split("\r\n\r\n", 2)[1]
  end

  def uppercase
    begin
      self.get_case("upper")
    rescue
      @word.upcase
    end
  end

  def lowercase
    begin
      self.get_case("lower")
    rescue
      @word.downcase
    end
  end
end

if __FILE__ == $0
  tc1 = TextChanger.new("Hello!")
  pp tc1.uppercase   # "HELLO!"
  pp tc1.lowercase   # "hello!"
end
