require 'test_helper'

class MockSignature
end

class QueryStringTest < MiniTest::Unit::TestCase
  def setup
		@config = YAML.load_file( File.join(File.dirname(__FILE__), 'test_config.yml') )['test']
  	@connection = Amazon::MWS::Base.new(@config)
  	Amazon::MWS::Base.debug = true    
    #TODO need a stub for Signature!
  end

  def test_expected_string
    string = Amazon::MWS::Authentication::QueryString.new({
    	:uri => URI.parse('/'),
    	:merchant_id => @config['merchant_id'],
    	:marketplace_id => @config['marketplace_id'],
    	:access_key => @config['access_key'],
    	:secret_access_key => @config['secret_access_key'],
    })
    assert_kind_of(String, string)
  end
end
