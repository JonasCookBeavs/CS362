require "minitest/autorun"

class DatabaseConnection
  # Pretend this is a real DB object
  def connect 
    sleep(10)
    raise "Database connection timed out"
  end

  def add_message(m)
    sleep(10)
    raise "Database insert timed out"
  end
end

class FakeDatabaseConnection
  def connect 
  end

  def add_message(m)
  end
end

class Message
  attr_accessor :text, :sent_message

  def initialize(text)
    @db = DatabaseConnection.new
    @text = text
    @sent_message = nil
  end

  def send()
    ms = MessageSender.new(self, @db)
    ms.send()
  end

end

class FakeMessage
  attr_accessor :text, :sent_message

  def initialize(text)
    @text = text
    @sent_message = nil
  end

end

class MessageSender
  def initialize(message, connection)
    @message = message
    @connection = connection
  end

  def send()
    @connection.connect
    @connection.add_message(@message.text)
    @message.sent_message = @message.text
  end
end

class TestMessage < MiniTest::Test
  def test_message
    m = FakeMessage.new("Hi there")
    db = FakeDatabaseConnection.new
    ms = MessageSender.new(m, db)
    ms.send()
    assert_equal "Hi there", m.sent_message
  end
end