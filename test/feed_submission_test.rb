require 'test_helper'

class FeedSubmissionTest < MiniTest::Unit::TestCase
  def setup
    # TODO there is no mws.yml file right now
    config = YAML.load_file( File.join(File.dirname(__FILE__), '../lib/amazon/mws.yml') )
    
    Amazon::MWS::Base.establish_connection!(
      config['production']
    )
  end
  
  def test_get_feed_submission_list
    response = Amazon::MWS::API.get_report_list
    report_id = response["GetReportListResult"]["ReportInfo"]["ReportId"]   
    response = Amazon::MWS::API.get_report(report_id)    
    puts response.inspect
  end
end