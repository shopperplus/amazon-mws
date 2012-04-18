require 'test_helper'

class FeedTest < MiniTest::Unit::TestCase
  def setup
		@config = YAML.load_file( File.join(File.dirname(__FILE__), 'test_config.yml') )['test']
		@connection = Amazon::MWS::Base.new(@config)
  end

  def test_submit_feed_non_stubbed
		response = @connection.submit_feed(:product_data,'Product',[{ 'sku'=>'234234234234', 'product-name'=>'name name name' }])
    assert_kind_of ResponseError, response    
  end

  def test_submit_feed
  	@connection.stubs(:post).returns(xml_for('submit_feed',200)) 
		response = @connection.submit_feed(:product_data,'Product',[{ 'sku'=>'234234234234', 'product-name'=>'name name name' }])
    assert_kind_of SubmitFeedResponse, response
    assert_equal 2291326430, response.feed_submission.id
    assert_equal Feed::Enumerations::PROCESSING_STATUSES[:submitted], response.feed_submission.feed_processing_status
    assert_equal Feed::Enumerations::FEED_TYPES[:product_data], response.feed_submission.feed_type    
  end

  def test_get_feed_submission_list_failure
    # Without stubbing, to test request code
    response = @connection.get_feed_submission_list
    assert_kind_of ResponseError, response  

    # With stubbing
    @connection.stubs(:get).returns(xml_for('error',401))
    response = @connection.get_feed_submission_list
    assert_kind_of ResponseError, response
  end

  def test_get_feed_submission_list_success
    @connection.stubs(:get).returns(xml_for('get_feed_submission_list',200))
    response = @connection.get_feed_submission_list
    assert_kind_of GetFeedSubmissionListResponse, response
  end

  def test_get_feed_submission_list_by_next_token
    @connection.stubs(:get).returns(xml_for('get_feed_submission_list_by_next_token',200))    
    response = @connection.get_feed_submission_list_by_next_token('234234234234234234')
    assert_kind_of GetFeedSubmissionListByNextTokenResponse, response
  end

  def test_get_feed_submission_count
    @connection.stubs(:get).returns(xml_for('get_feed_submission_count',200))    
    response = @connection.get_feed_submission_count
    assert_kind_of GetFeedSubmissionCountResponse, response
  end

  def test_cancel_feed_submissions
    @connection.stubs(:get).returns(xml_for('cancel_feed_submissions',200))    
    response = @connection.cancel_feed_submissions
    assert_kind_of CancelFeedSubmissionsResponse, response
  end

  def test_get_feed_submission_result
    @connection.stubs(:get).returns(xml_for('get_feed_submission_result',200))
    response = @connection.get_feed_submission_result('2342342342342342')
    assert_kind_of GetFeedSubmissionResultResponse, response    
  end
  
  def test_submit_flat_file_feed
    @connection.stubs(:get).returns(xml_for('get_feed_submission_result',200))
  end

end
