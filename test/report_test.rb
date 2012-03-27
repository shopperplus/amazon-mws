require 'test_helper'

class FeedTest < MiniTest::Unit::TestCase
  def setup
		@config = YAML.load_file( File.join(File.dirname(__FILE__), 'test_config.yml') )['test']
		@connection = Amazon::MWS::Base.new(@config)
		Amazon::MWS::Base.debug = true
  end

  def test_request
    #TODO
    #response = Report.request(:flat_file_orders)
    #result = Report.request(:flat_file_orders, :start_date => Time.now, :end_date => Time.now.iso8601)
    #result = Report.get_report_request_list
    #puts result.inspect
  end

  def test_first
    #response = Report.request_report(:converged_flat_file_order_report)
    #response = Report.get_report_request_list('MaxCount' => 100)
  end

end
