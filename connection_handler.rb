class ConnectionHandler

  require 'elasticsearch'
  require 'jbuilder'
  require 'hashie'
  require 'json'
  require './query_builder'

  #define elasticsearch client
  client = Elasticsearch::Client.new url: 'http://192.168.5.223:9200', log: true
  client.transport.reload_connections!

  #get query from query_builder class
  qb = QueryBuilder.new
  query = qb.testQuery

  #this index will need adjusting based on customer
  output = client.search index: 'logstash-2018.11.25*', body: query

  ##accessing response hash
  mash = Hashie::Mash.new output
  puts mash.hits.total

  #below is the same as above - still deciding which syntax i prefer.
  outputTotal = output["hits"]["total"]
  puts outputTotal


end