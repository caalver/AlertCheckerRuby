class QueryBuilder

  require 'jbuilder'
  require 'json'

  def getTimeframe
    #gets the last two hours in the correct format
    @currenttime = DateTime.now.strftime('%Y-%m-%dT%H:%M:%SZ')
    twohoursago = DateTime.now - (2/24.0)
    @twohoursago = twohoursago.strftime('%Y-%m-%dT%H:%M:%SZ')

    #puts currenttime
    #puts twohoursago
  end

  def buildQuery
    query = '{ size: 20 { "query": { "range": { "@timestamp": { "gte":""' + @twohoursago + '", "lte": ' + @currenttime + ' } } } } }'
    query = JSON.parse(query)
  end

  def testQuery
    #To specify a time frame use a range on the @timestamp field.
    query = '{ size: 20 { "query": { "range": { "@timestamp": { "gte": "2018-11-25T21:30:00Z", "lte": "2018-11-25T21:40:00Z" } } } } }'
    query = JSON.parse(query)
  end

  def networkCheck(ip)

    query = '{ "query": { queries": [ { "exists": "event_time" }, { "match": { "_all": "' + ip + '"  } } ] } }'

    query = JSON.parse(query)

  end

end