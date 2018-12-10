class Test

  require 'elasticsearch'
  require 'jbuilder'
  require 'hashie'
  require 'json'
  require './threat_dictionary'
  require './api_caller'
  require './query_builder'
  require './networkchecker'
  require './email_handler'

  #create/load threatdictionary
  $threatdictionary = ThreatDictionary.new

  #create emailbuilder
  $emailhandler = EmailHandler.new

  #create apicaller
  $abuseDBtool = APICaller.new

  #create querybuilder
  $querybuilder = QueryBuilder.new

  #create networkchecker
  $networkchecker = Networkchecker.new

  #define elasticsearch client
  $client = Elasticsearch::Client.new url: 'http://192.168.5.223:9200', log: true
  $client.transport.reload_connections!
  $client.cluster.health


 # output = client.search q: 'title:star&pretty'

  #The default max number of results returned in 10, to get more you must specify results size in the query
   #can use jbuilder to build the request json
  #query = Jbuilder.encode do |json|
  #   json.size 2
  #     json.query do
  #       json.exists do
  #         json.field "event_time"
  #       end
  #     end
  #end

  query = $querybuilder.testQuery

  #send request to the client.
  output = $client.search index: 'logstash-2018.11.25*', body: query

  #output =  client.search index: 'logstash-2018.11.25*', body: { query: { match: {event:"APACHE" } } }

  ##accessing response hash
  mash = Hashie::Mash.new output
  hits = mash.hits.total
  #puts mash.hits.hits[0]._source.event

  #each result document is located at hits.hits._source
  mash.hits.hits.each do |value|

    puts value._source.event
    #check if the event is present in the threat dictionary
    key = value._source.event
    if $threatdictionary.checkKey(key)

      #get the ip from the event.
      ip = value._source.src_ip

      # "do ip lookup"
      #a delay is implemented so as not to be banned by abusedb in the event of multiple events
      sleep(1)
      $abuseDBtool.makeapicall(ip)
      istheipmalicious = $abuseDBtool.interpretresponse()

      if istheipmalicious
        value = $abuseDBtool.appendvariablestohithash(value)

        $networkchecker.conductnetworkcheck(ip)
        value = $networkchecker.appendnetworkcheckresultohithash(value)

        #add the email text to the hash
        $threatdictionary.setemailtext(key)
        $threatdictionary.appendemailtexttohithash(value)

        #query elasticsearch for previous IPS events involving the source IP
        #still need to write this query - add it into the network checker
        #add contents to email body output array
        $emailhandler.addIPSemailbodycontent(value)
      end

      #clear variables ready for next hit.
    else
      #Alert SOC that new IPS event has been detected, it will need to be added to the threat dictionary.

    end

  end

  #build email
  $emailhandler.buildIPSEmail()
  #send email
  $emailhandler.sendemailtoconsole

  #below is the same as aobe.
  #outputTotal = output["hits"]["total"]
  #puts outputTotal

end