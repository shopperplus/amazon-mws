require 'test_helper'

class FeedTest < MiniTest::Unit::TestCase
  def setup
  end

  def test_nothing
    msgs = [
      { "Product" => "somethinglame",
        "NestedHash" => {"hash"=> 7},
        "NestedArray" => [{"NA1"=> 1}, {"NA2"=> 2}]
    } ,
      { "Product" => "lame1",
        "NestedHash" => {"hash"=> 8},
        "NestedArray" => [{"NA1"=> 1}, {"NA2"=> 2}]
    } ,
    ];
    fb = Amazon::MWS::FeedBuilder.new(:product, msgs)
    assert_instance_of FeedBuilder, fb
    xml = fb.render
    assert_instance_of String, xml
  end
  
end
