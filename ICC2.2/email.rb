class Email
  def initialize(headers, body)
    @headers = headers
    @body = body
  end

  def send(to)
    # Log the email
    puts("#{@headers[:from]}, #{to}, #{@headers[:subject]}")
    work_on_email(to)
  end

  # Added method to do annoying work
  def work_on_email(to)
    s = connect_to_mail_server()
    construct_and_send_email(s, to, @headers, @body)
    close_connection(s)
  end
end

# Added TestEmail class
class TestEmail < Email
  
  # Overrode annoying lines
  def work_on_email(to)
    puts("Email Sent")
  end

end

t = TestEmail.new(
  {:subject => "Hey!", :from => "beej@beej.us"},
  "How's it going? Have you heard the latest gossip?"
)

t.send("chris@example.com")