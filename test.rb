class Test

  require 'elasticsearch'
  require 'jbuilder'
  require 'hashie'
  require 'json'
  require './threat_dictionary'
  require './api_caller'
  require './query_builder'


  #create/load threatdictionary
  threatdictionary = ThreatDictionary.new

  #create apicaller
  apicaller = APICaller.new

  #create querybuilder
  querybuilder = QueryBuilder.new

  #define elasticsearch client
  client = Elasticsearch::Client.new url: 'http://192.168.5.223:9200', log: true
  client.transport.reload_connections!
  client.cluster.health


 # output = client.search q: 'title:star&pretty'

  #The default max number of results returned in 10, to get more you must specify results size in the query
   #can use jbuilder to build the request json
  query = Jbuilder.encode do |json|
     json.size 2
       json.query do
         json.exists do
           json.field "event_time"
         end
       end
   end

    #send request to the client.
  output = client.search index: 'logstash-2018.11.25*', body: query

  #output =  client.search index: 'logstash-2018.11.25*', body: { query: { match: {event:"APACHE" } } }

  ##accessing response hash
  mash = Hashie::Mash.new output

  hits = mash.hits.total

  puts mash.hits.hits[0]._source.event

  #each result document is saved in hits.hits._source
  mash.hits.hits.each do |value|

    puts value._source.event
    #check if the event is present in the threat dictionary
    key = value._source.event
    if threatdictionary.checkKey(key)
      emailtext = threatdictionary.lookupviakey(key)

      #get the ip from the event.
      ip = value._source.src_ip

      # "do ip lookup"
      #a delay is implemented so as not to be banned by abusedb in the event of multiple events
      sleep(1)
      responsejson = apicaller.makeapicall(ip)
      apicaller.interpretresponse

      
      networkcheckquery = querybuilder.networkCheck(ip)
      networkcheckoutput = client.search index: 'logstash-2018.11.25*', body: networkcheckquery


      puts networkcheckoutput
    end

  end

  #below is the same as aobe.
  #outputTotal = output["hits"]["total"]
  #puts outputTotal

end