class APICaller

  require 'json'
  require 'net/http'
  require 'uri'

  def initialize

    @apikey= "ttmW5n6Zh4QITCO2U7r75FX4wxWYRS7Cf90RwDSn"
    @response = "No request made"

    #response variables
    @country = "Not set"
    @iswhitelisted = "Not set"
    @abuseconfidencescore = "Not set"
    #

  end

  def makeapicall(ip)

    #need to get this http request. "https://www.abuseipdb.com/check/" + IP + "/json?key=" + @APIKEY
    url = "https://www.abuseipdb.com/check/" + ip + "/json?key=" + @apikey
    url = URI(url)

    @response = Net::HTTP.get URI(url)

  end

  def interpretresponse()

    if @response == "[]"
      puts "it is empty"
    elsif @response == "No request made"
      puts "No request made"
    else
      puts "do something"
      #get required variables from the response body
      setvariablesfromresponsebody
    end

  end

  def setvariablesfromresponsebody

    json = JSON.parse(@response)

    @country = json[0]["country"]
    @iswhitelisted = json[0]["isWhitelisted"]
    @abuseconfidencescore = json[0]["abuseConfidenceScore"]

  end

  def getcountry

    if @country != "Not set"
      @country
    end

  end

  def getabuseconfidencescore

    if @abuseconfidencescore != "Not set"
      @abuseconfidencescore
    end

  end

  def getiswhitelisted

    if @iswhitelisted != "Not set"
      @iswhitelisted
    end

  end

end