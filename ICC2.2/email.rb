class Email
  def initialize(headers, body)
    @headers = headers
    @body = body
  end

  def send(to)
    puts("#{@headers[:from]}, #{to}, #{@headers[:subject]}")
    work_on_email(to)
  end

  def work_on_email(to)
    s = connect_to_mail_server()
    construct_and_send_email(s, to, @headers, @body)
    close_connection(s)
  end
end

class TestEmail < Email
  
  def work_on_email(to)
    puts("Email Sent")
  end
  
end

m = Email.new(
  {:subject => "Hey!", :from => "beej@beej.us"},
  "How's it going? Have you heard the latest gossip?"
)

t = TestEmail.new(
  {:subject => "Hey!", :from => "beej@beej.us"},
  "How's it going? Have you heard the latest gossip?"
)

t.send("chris@example.com")