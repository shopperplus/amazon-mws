module Amazon
  module MWS

    class FulfillmentShipmentItem < Response
      xml_name 'member'

      xml_reader :seller_sku, :from => 'SellerSKU'
      xml_reader :seller_fulfillment_order_item_id
      xml_reader :quantity
      xml_reader :package_number
    end 

  end 
end 
