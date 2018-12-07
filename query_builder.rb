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

    #below is the correct syntax for a query including a date range and a search for a term over all fields.
    query = '{ "query": {
                  "bool": {
                      "must": [
                          {
                              "range": {
                                  "@timestamp": {
                                      "gte": "' + @twohoursago + '",
                                      "lte": "' + @currenttime + '"
                                  }
                              }
                          },
                          {
                              "query_string": {
                                  "query": "' + ip + '"
                              }
                          },
                          {
                              "exists": { "field" : "event_time" }
                          }
                      ]
                  }
              }
          }'

    query = JSON.parse(query)

  end

  def networkCheckTest(ip)

    #below is the correct syntax for a query including a date range and a search for a term over all fields. The
    query = '{ "query": {
                  "bool": {
                      "must": [
                          {
                              "range": {
                                  "@timestamp": {
                                      "gte": "2018-11-25T21:00:00Z",
                                      "lte": "2018-11-25T21:40:00Z"
                                  }
                              }
                          },
                          {
                              "query_string": {
                                  "query": "' + ip + '"
                              }
                          },
                          {
                              "exists": { "field" : "event_time" }
                          }
                      ]
                  }
              }
          }'

    query = JSON.parse(query)

  end

  def AldermoreIPSLookup

    #What the aldermoreIPS query will look like - filtered based on the syslog_program

    query = '{  "query": {
                  "bool": {
                    "must": [
                      {
                        "query_string":
                          {
                            "query": "123.249.13.4"
                          }
                      }
                     ],
                    "filter": [
                      { "term": { "syslog_program": "AldermoreIPS" } },
                      { "range":
                        { "@timestamp":
                           {
                             "gte": "2018-11-25T21:00:00Z",
                             "lte": "2018-11-25T21:40:00Z"
                           }
                         }
                      }
                     ]
                    }
                  }
              }'

    query = JSON.parse(query)

  end

end