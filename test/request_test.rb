require 'test_helper'

Amazon::MWS::Base.debug = true

class RequestTest < MiniTest::Unit::TestCase
  def setup
    # TODO no mws.yml right now
    config = YAML.load_file( File.join(File.dirname(__FILE__), '../lib/amazon/mws.yml') )
    
    @marketplace = Amazon::MWS::Base.new(config['production'])
  end
  
  def test_first
    response = @marketplace.request_report(:converged_flat_file_order_report)
    response = @marketplace.get_report_request_list('MaxCount' => 100)
  end

end