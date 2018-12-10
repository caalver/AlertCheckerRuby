class EmailHandler

  require 'net/smtp'

  def initialize
    @IPSemailbodycontent = Array.new

    @IPSemailbodytext = Array.new

  end

  def getIPSemailbodycontent
    getIPSemailbodycontent = @IPSemailbodycontent
  end

  def addIPSemailbodycontent(content)
    @IPSemailbodycontent << content
  end

  def buildIPSEmail()

    #for each email in the emailcontentarray
    @IPSemailbodycontent.each do |value|

      emailbodytext = "At the above stated time our SIEM detected malicious traffic originating from Source IP " + value._source.src_ip + " targeting Host IP " + value._source.dst_ip + ". \n\n" \
                      "The traffic carries the signature of a " + value._source.event + ". \n\n" \
                      "The Source IP is from " + value.country + ", its whitelist status is " + value.iswhitelisted + ". It has previously been reported for various malicious activities" + ". \n\n" \
                      "Checking traffic between the Source IP and the Aldermore network reveals " + value.networkcheckresult + ". \n\n" \
                      "Bulletproof has blocked the Source IP to prevent any future instances of malicious activity."

      @IPSemailbodytext << emailbodytext

    end

  end

  def sendemailtoconsole

    #sends email

    @IPSemailbodytext.each do |value|

      puts "======================================================================= \n\n"

      puts value

      puts "======================================================================= \n\n"

    end

  end

  def sendemail

    message = ""

    @IPSemailbodytext.each do |value|

      message = message + "======================================================================= \n\n"

      message = message + value

      message = message + "======================================================================= \n\n"

    end

  end

  #this works but postfix is confifure to receive email for james.calver@serverchoice.com - it wont be sent onto outlook.
  def send_mail(to, opts={})
    opts[:server] ||= 'localhost'
    opts[:from] ||= 'jc@jc.com'
    opts[:from_alias] ||= 'jc'
    opts[:subject] ||= "You need to see this"
    opts[:body] ||= "Important stuff"

    msg = <<END_OF_MESSAGE
From: #{opts[:from_alias]} <#{opts[:from]}
To: <#{to}>
Subject: #{opts[:subject]}

#{opts[:body]}   

END_OF_MESSAGE

    Net::SMTP.start(opts[:server]) do |smtp|
      smtp.send_message msg, opts[:from], to
    end
  end

end