module Amazon
  module MWS

    class FulFillmentOrderItem < Response
      xml_name 'member'

      xml_reader :seller_sku, :from => "SellerSKU"
      xml_reader :gift_message
      xml_reader :seller_fulfillment_order_item_id
      xml_reader :estimated_ship_date_time, :as => DateTime
      xml_reader :displayable_comment
      xml_reader :order_item_disposition
      xml_reader :unfulfillable_quantity, :as => Integer
      xml_reader :cancelled_quantity
      xml_reader :quantity,:as => Integer
      xml_reader :estimated_arrival_date_time, :as => DateTime
    end

  end 
end 
