require 'test_helper'

class FulfillmentOrderTest < MiniTest::Unit::TestCase

  def setup
    @config = YAML.load_file( File.join(File.dirname(__FILE__), 'test_config.yml') )['test']
    @connection = Amazon::MWS::Base.new(@config)
  end

  def test_get_fulfillmet_order
    @connection.stubs(:post).returns(xml_for('get_fulfillment_order',200))
    response = @connection.get_fulfillment_order('test')
    assert_kind_of GetFulfillmentOrderResponse, response
    assert response.fulfillment_order
    assert !response.fulfillment_order_items.blank?
    assert 2, response.fulfillment_order_items.size
    assert 2, response.fulfillment_shipments.size
    assert response.fulfillment_shipments.first
  end

  def test_list_all_fulfillmet_orders
    @connection.stubs(:post).returns(xml_for('list_all_fulfillment_orders',200))
    response = @connection.list_all_fulfillment_orders(DateTime.now.iso8601)
    assert_kind_of ListAllFulfillmentOrdersResponse, response
    assert 2, response.fulfillment_orders.size
  end

  def test_list_all_fulfillmet_orders_by_next_token
    @connection.stubs(:post).returns(xml_for('list_all_fulfillment_orders_by_next_token',200))
    response = @connection.list_all_fulfillment_orders_by_next_token('token')
    assert_kind_of ListAllFulfillmentOrdersByNextTokenResponse, response
    assert 2, response.fulfillment_orders.size
  end

  def test_create_fulfillment_order
    @connection.stubs(:post).returns(xml_for('create_fulfillment_order',200))
    response = @connection.create_fulfillment_order({})
    assert_kind_of CreateFulfillmentOrderResponse, response
    assert !response.request_id.blank?
  end

  def test_cancel_fulfillment_order
    @connection.stubs(:post).returns(xml_for('cancel_fulfillment_order',200))
    response = @connection.cancel_fulfillment_order("test")
    assert_kind_of CancelFulfillmentOrderResponse, response
    assert !response.request_id.blank?
  end

end
