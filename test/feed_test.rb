require 'test_helper'

class FeedTest < MiniTest::Unit::TestCase
  def setup
		@config = YAML.load_file( File.join(File.dirname(__FILE__), 'test_config.yml') )['test']
		@connection = Amazon::MWS::Base.new(@config)
  end

  def test_submit_feed
  	@connection.stubs(:post).returns(xml_for('submit_feed',200)) 
		response = @connection.submit_feed(:product_data,'Product',{ 'sku'=>'234234234234', 'product-name'=>'name name name' })
    assert_kind_of(SubmitFeedResponse, response)
    assert_equal 2291326430, response.feed_submission.id
    assert_equal Feed::Enumerations::PROCESSING_STATUSES[:submitted], response.feed_submission.feed_processing_status
    assert_equal Feed::Enumerations::FEED_TYPES[:product_data], response.feed_submission.feed_type    
  end

  def test_get_feed_submission_list_failure
    @connection.stubs(:get).returns(xml_for('error',401))
    response = @connection.get_feed_submission_list
    assert_kind_of(ResponseError, response)
  end

  def test_get_feed_submission_list_success
    @connection.stubs(:get).returns(xml_for('get_feed_submission_list',200))
    response = @connection.get_feed_submission_list
    assert_kind_of(GetFeedSubmissionListResponse, response)
  end

=begin
  def test_get_feed_submission_list_by_next_token
    #response = Feed.submission_list_by_next_token
    #response = Feed.get_feed_submission_list_by_next_token
  end

  def test_get_feed_submission_list_by_next_token
    #response = Feed.submission_list_by_next_token
    #response = Feed.get_feed_submission_list_by_next_token
  end

  def test_get_feed_submission_count
    #response = Feed.submission_count
    #response = Feed.get_feed_submission_count
  end

  def test_cancel_feed_submissions
    #response = Feed.cancel_submissions
    #response = Feed.cancel_feed_submissions
  end

  def test_get_feed_submission_result
    #response = Feed.submission_result
    #response = Feed.get_feed_submission_result
  end
=end
end
