require 'test_helper'

class ConnectionTest < MiniTest::Unit::TestCase
  def setup
		@config = YAML.load_file( File.join(File.dirname(__FILE__), 'test_config.yml') )['test']
		@connection = Amazon::MWS::Base.new(@config)
  end

  def test_connection_functions
    assert_kind_of Amazon::MWS::Connection, @connection.connection
    assert @connection.connected?
  end

end