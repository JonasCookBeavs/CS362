class Email
  
  def initialize(headers, body)
    @headers = headers
    @body = body
    @server = connect_to_mail_server()
    # New logger object
    @logger = Logger.new(@headers[:from], @headers[:subject])
  end

  def send(to)
    # Log call
    @logger.log(to)
    construct_and_send_email(@server, to, @headers, @body)
  end

end

# Created Logger class
class Logger
  
  def initialize(from, subject)
    @from = from
    @subject = subject
  end

  # Added log function
  def log(to)
    puts("#{@from}, #{to}, #{@subject}")
  end

end



m = Email.new(
  {:subject => "Hey!", :from => "beej@beej.us"},
  "How's it going? Have you heard the latest gossip?"
)

l = Logger.new("beej@beej.us", "Hey!")

# m.send("chris@example.com")
l.log("chris@example.com")