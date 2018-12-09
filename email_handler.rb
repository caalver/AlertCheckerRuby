class EmailHandler

  @IPSemailbodycontent = Array.new

  def getIPSemailbodycontent
    getIPSemailbodycontent = @IPSemailbodycontent
  end

  def addIPSemailbodycontent(content)
    @IPSemailbodycontent.Add(content)
  end

  def buildIPSEmail(emailcontentarray)



    #for each email in the emailcontentarray

    emailbodytext = "At the above stated time our SIEM detected malicious traffic originating from Source IP " + src_ip + " targeting Host IP " + dst_ip
    + "The traffic carries the signature of a " + event_type +
        "The Source IP is from " + country + ", its whitelist status is " + whitelist + ". It has previously been reported for various malicious activities" +

    if previouscommunications
        emailbodytext = emailbodytext + " Checking traffic between the Source IP and the Aldermore network reveals that there has been previous instances of communications within the last 30 days"
    end

    emailbodytext = emailbodytext + "Bulletproof has blocked the Source IP to prevent any future instances of malicious activity."

  end

  def sendemail

    #sends email

  end

end