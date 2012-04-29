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
    #puts xml
  end
  
  def test_product_clothing
    
    msgs = [{
      'Product'=> {
        'SKU'=>'sku',
        'ItemPackageQuantity'=>'1',
        'NumberOfItems'=>'1',
        'StandardProductID'=>{'Type'=>'UPC', 'Value'=>'814digitstring'},
        'DescriptionData'=>{
          'Title'=>'title',
          'Brand'=>'brand',
          'Designer'=>'designer',
          'Description'=>'description', # max length 2000
          'BulletPoint'=>'bullet',
          'BulletPoint'=>'bullet2', # max 5
          'ShippingWeight'=>{'unitOfMeasure'=>'LB', 'Value'=>'1'}, #TODO value is probably not the right term
          'MSRP'=>'5.43',
          'SearchTerms' => ['asdf1','asdf2'],
          'IsGiftWrapAvailable'=>'True',
          'IsGiftMessageAvailable'=>'True'
          #'RecommendedBrowseNode'=>'60583031', # only for Europe
        },#DescriptionData
        'ProductData' => {
          'Clothing'=>{
            "VariationData"=> {
              "Parentage"=>"child", 
              "Size"=>"size", 
              "Color"=>"color", 
              "VariationTheme"=>"SizeColor"
            }, #VariationData
            'ClassificationData'=>{
              'ClothingType'=>'Accessory', 
              'Department'=>'', # max 10 
              'StyleKeywords'=>'',  # max 10
              'OccasionAndLifestyle'=>'' # max 10
            }
          }#Clothing
        }#ProductData
      }#Product
    }]
    fb = Amazon::MWS::FeedBuilder.new(:product, msgs)
    xml = fb.render
    assert_instance_of String, xml
    #puts xml
    
  end
  
  
end
