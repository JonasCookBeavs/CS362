class Email
  def initialize(headers, body)
    @headers = headers
    @body = body
  end

  def send(to)
    s = connect_to_mail_server()
    # Added log call
    log(s, to, @headers)
    construct_and_send_email(s, to, @headers, @body)
    close_connection(s)
  end

  # Added separate log method
  def log(to)
    puts("#{@headers[:from]}, #{to}, #{@headers[:subject]}")
  end
end

m = Email.new(
  {:subject => "Hey!", :from => "beej@beej.us"},
  "How's it going? Have you heard the latest gossip?"
)

# m.send("chris@example.com")

# Test log method
m.log("@chris@example.com")