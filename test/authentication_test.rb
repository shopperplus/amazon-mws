require 'test_helper'

class AuthenticationTest < MiniTest::Unit::TestCase
  def setup
    @request = Net::HTTP::Get.new(Amazon::MWS::DEFAULT_HOST)
		@config = YAML.load_file( File.join(File.dirname(__FILE__), 'test_config.yml') )['test']
  	@connection = Amazon::MWS::Base.new(@config)
  	Amazon::MWS::Base.debug = true    
  end

  def test_first
    #TODO
    #puts Amazon::MWS::Authentication::QueryString.new({
    	#:request => @request,
    	#:merchant_id => @config['merchant_id'],
    	#:marketplace_id => @config['marketplace_id'],
    	#:access_key => @config['access_key'],
    	#:secret_access_key => @config['secret_access_key']
    #})
  end
end
