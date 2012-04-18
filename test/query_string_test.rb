require 'test_helper'

class QueryStringTest < MiniTest::Unit::TestCase
  def setup
		@config = YAML.load_file( File.join(File.dirname(__FILE__), 'test_config.yml') )['test']
  end

  def test_expected_string
    string = Amazon::MWS::Authentication::QueryString.new({
    	:merchant_id => @config['merchant_id'],
    	:marketplace_id => @config['marketplace_id'],
    	:access_key => @config['access_key'],
    	:secret_access_key => @config['secret_access_key'],
    	:path => '/?AWSAccessKeyId=opensesame&Marketplace=9876&Merchant=12345&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2012-03-28T10%3A32%3A40%2B02%3A00&Version=2011-01-01&Action=SubmitFeed&FeedType=_POST_PRODUCT_DATA_&Signature=4pGYXLxB9T7Gwon1BcIIeVHIxfgr3qxS3eSIwzmsGKo%3D'
    })
    assert_kind_of(String, string)
  end
end
