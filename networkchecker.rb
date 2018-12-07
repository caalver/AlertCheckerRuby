class Networkchecker

  require 'elasticsearch'
  require 'jbuilder'
  require 'hashie'
  require 'json'
  require './threat_dictionary'
  require './api_caller'
  require './query_builder'

  def conductnetworkcheck(ip)

    #create network check query using the query builder
    networkcheckquery = $querybuilder.networkCheckTest(ip)

    networkcheckoutput = $client.search index: 'logstash-2018.11.25*', body: networkcheckquery

    interpretresponse(networkcheckoutput)

    end

  def interpretresponse(networkcheckoutput)

    if networkcheckoutput  == "[]"
      puts "No history of communication"
    elsif networkcheckoutput  == "No request made"
      puts "No request made"
    else
      puts "do something"
      #put all datefields into array
      #
      if networkcheckoutput["hits"]["total"] > 0
        
        mash = Hashie::Mash.new networkcheckoutput
        #networkcheckoutput.hits.hits.each do |value|
        #this creates a dataset of unique values based on a specified field. Need to break the Date out of the datetime field to use.
          seen = Set.new
          mash.hits.hits.inject([]) do |kept, record|

            #brokenfield = record._source.src_ip.match(/\w++ [^_]\w/)

            unless seen.include?(record._source.src_ip)
              kept << record
              seen << record._source.src_ip
            end
            kept
          end

      end

    end

  end

  def uniq(networkcheckout)
    seen = Set.new
    networkcheckout.inject([]) do |kept, record|
        unless seen.include?(record.id)
          kept << record
          seen << record.id
        end
      kept
    end
  end

  #
  #
  # query elastic search using elasticsearch client
  #
  # if results are found, put all datefields into unique array
  #
  # if array.length is greater than 1 state that there has been previous communication between the customer and the source ip.



end