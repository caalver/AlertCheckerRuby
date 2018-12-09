class API_caller_test

  require './api_caller.rb'
  require 'json'

  #malicious - ip = '193.112.12.35'
  # not malicious ip ='94.126.41.33'

  #test ip
  ip ='193.112.12.35'

  apicaller = APICaller.new

  responsejson = apicaller.makeapicall(ip)

  #print response
  puts responsejson

  apicaller.interpretresponse

  amendedjson = apicaller.appendvariablestohitjson(responsejson)

  #print variables
  puts apicaller.getabuseconfidencescore
  puts apicaller.getcountry
  puts apicaller.getiswhitelisted


  puts amendedjson


end