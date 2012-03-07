require 'test_helper'

class MockSignature
end

class QueryStringTest < MiniTest::Unit::TestCase
  def setup
    # need a stub for Signature!
  end

  def test_expected_string
    string = Amazon::MWS::Authentication::QueryString.new(
      :access_key => 'opensesame',
      :marketplace_id => '9876',
      :merchant_id => '12345',
      :uri => URI.parse('/')
    )

    assert_kind_of(String, string)
  end
end
