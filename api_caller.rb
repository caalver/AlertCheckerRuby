class APICaller

  require 'json'
  require 'net/http'
  require 'uri'
  require 'hashie'

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

  def interpretresponse

    if @response == "[]"
      puts "No history of abuse"
      interpretresponse = false
    elsif @response == "No request made"
      puts "No request made"
    else
      puts "do something"
      #get required variables from the response body
      interretresponse = true
      setvariablesfromresponsebody
      #appendvariablestohitjson(value)
    end

  end

  def setvariablesfromresponsebody

    json = JSON.parse(@response)

    if json.length > 0

      if json[0]["isWhitelisted"]
        @iswhitelisted = "whitelisted"
      else
        @iswhitelisted = "not whitelisted"
      end

      @country = json[0]["country"]
      @abuseconfidencescore = json[0]["abuseConfidenceScore"]
    else

      if json["isWhitelisted"]
        @iswhitelisted = "whitelisted"
      else
        @iswhitelisted = "not whitelisted"
      end

      @country = json["country"]
      @abuseconfidencescore = json["abuseConfidenceScore"]
    end
  end


  def appendvariablestohitjson(json)

    rb_hash = JSON.parse(json)
    rb_hash["country"] = @country
    rb_hash["iswhitelisted"] = @iswhitelisted
    rb_hash["abuseconfidencescore"] = @abuseconfidencescore
    rb_hash

  end

  def appendvariablestohithash(hash)

    hash[:country] = @country
    hash[:iswhitelisted] = @iswhitelisted
    hash[:abuseconfidencescore] = @abuseconfidencescore
    hash

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