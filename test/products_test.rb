require 'test_helper'

class ProductsTest < Minitest::Test

  def setup
    @config = YAML.load_file( File.join(File.dirname(__FILE__), 'test_config.yml') )['test']
    @connection = Amazon::MWS::Base.new(@config)
  end

  def test_get_matching_product
    @connection.stubs(:post).returns(xml_for('get_matching_product',200))
    response = @connection.get_matching_product(["B00828DQGM"])
    assert_kind_of GetMatchingProductResponse, response

    response = @connection.get_matching_product(["B00828DQGM"], {:raw_xml => true})
    assert_kind_of Net::HTTPOK, response		
  end

  def test_get_matching_product_for_id
    @connection.stubs(:post).returns(xml_for('get_matching_product_for_id',200))
    response = @connection.get_matching_product_for_id('ASIN',["B00828DQGM"])
    assert_kind_of GetMatchingProductForIdResponse, response

    response = @connection.get_matching_product_for_id('ASIN',["B00828DQGM"], :raw_xml => true)
    assert_kind_of Net::HTTPOK, response		
  end

end
