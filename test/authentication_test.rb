require 'test_helper'

class AuthenticationTest < MiniTest::Unit::TestCase
  def setup
    @request       			= Net::HTTP::Get.new(Amazon::MWS::DEFAULT_HOST)
    @access_key_id 			= "yyy"
    @secret_access_key 	= "xxx"
    @merchant_id 				= 0
    @marketplace_id 		= 0
  end
  
  def test_first
    puts Amazon::MWS::Authentication::QueryString.new({:request => @request, :access_key => @access_key_id, :merchant_id => @merchant_id, :marketplace_id => @marketplace_id, :secret_access_key => @secret_access_key})
  end
end