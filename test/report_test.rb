require 'test_helper'

class FeedTest < MiniTest::Unit::TestCase
  def setup
    # TODO no mws.yml
    config = YAML.load_file( File.join(File.dirname(__FILE__), '../lib/amazon/mws.yml') )
    
    Amazon::MWS::Base.establish_connection!(
      config['production']
    )
    Amazon::MWS::Base.debug = true
  end
  
  def test_request
    #response = Report.request(:flat_file_orders)
    
    #result = Report.request(:flat_file_orders, :start_date => Time.now, :end_date => Time.now.iso8601)
    
    result = Report.request_list
    
    puts result.inspect
  end
  
  
end