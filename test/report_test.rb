require 'test_helper'

class ReportTest < MiniTest::Unit::TestCase
  def setup
		@config = YAML.load_file( File.join(File.dirname(__FILE__), 'test_config.yml') )['test']
		@connection = Amazon::MWS::Base.new(@config)
  end

  def test_request_report
    @connection.stubs(:get).returns(xml_for('request_report',200))
    
    response = @connection.request_report(:flat_file_orders)
    assert_kind_of RequestReportResponse, response
    
    response = @connection.request_report(:flat_file_orders, :start_date => Time.now.iso8601, :end_date => Time.now.iso8601)
    assert_kind_of RequestReportResponse, response
  end

	def test_get_report_request_list
    @connection.stubs(:get).returns(xml_for('get_report_request_list',200))
    response = @connection.get_report_request_list()
    assert_kind_of GetReportRequestListResponse, response
    
    response = @connection.get_report_request_list('MaxCount' => 100)
    assert_kind_of GetReportRequestListResponse, response
	end
	
	def test_get_report_request_list_by_next_token
    @connection.stubs(:post).returns(xml_for('get_report_request_list_by_next_token',200))
    response = @connection.get_report_request_list_by_next_token(:next_token=>'324532534534543543')
    assert_kind_of GetReportRequestListByNextTokenResponse, response		
	end

	def test_get_report_request_count
		@connection.stubs(:get).returns(xml_for('get_report_request_count',200))
		response = @connection.get_report_request_count
		assert_kind_of GetReportRequestCountResponse, response
	end
	
	def test_cancel_report_requests
		@connection.stubs(:get).returns(xml_for('cancel_report_requests',200))
		response = @connection.cancel_report_requests
		assert_kind_of CancelReportRequestsResponse, response
	end
	
	def test_get_report_list
		@connection.stubs(:get).returns(xml_for('get_report_list',200))
		response = @connection.get_report_list		
		assert_kind_of GetReportListResponse, response
	end
	
	def test_get_report_count
		@connection.stubs(:get).returns(xml_for('get_report_count',200))
		response = @connection.get_report_count		
		assert_kind_of GetReportCountResponse, response
	end

	def test_get_report
		@connection.stubs(:get).returns(xml_for('get_report',200))
		response = @connection.get_report('9053224163')
		assert_kind_of String, response.body
	end
	
	def test_manage_report_schedule
		@connection.stubs(:get).returns(xml_for('manage_report_schedule',200))
		response = @connection.manage_report_schedule(:flat_file_open_listings,'1 hour')		
		assert_kind_of ManageReportScheduleResponse, response
	end
	
	def test_get_report_schedule_list
		@connection.stubs(:get).returns(xml_for('get_report_schedule_list',200))
		response = @connection.get_report_schedule_list
		assert_kind_of GetReportScheduleListResponse, response		
	end
	
	def test_get_report_schedule_list_by_next_token		
		@connection.stubs(:get).returns(xml_for('get_report_schedule_list_by_next_token',200))
		response = @connection.get_report_schedule_list_by_next_token(:next_token=>'234234234324')
		assert_kind_of GetReportScheduleListByNextTokenResponse, response
	end

	def test_get_report_schedule_count
		@connection.stubs(:get).returns(xml_for('get_report_schedule_count',200))
		response = @connection.get_report_schedule_count
		assert_kind_of GetReportScheduleCountResponse, response			
	end
	
end
