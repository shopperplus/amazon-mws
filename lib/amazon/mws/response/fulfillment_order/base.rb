module Amazon
  module MWS

    class FulfillmentAddress < Response
      xml_reader :name
      xml_reader :line1
      xml_reader :line2
      xml_reader :line3
      xml_reader :district_or_county
      xml_reader :city
      xml_reader :state_or_province_code
      xml_reader :country_code
      xml_reader :postal_code
      xml_reader :phone_number
    end 

    class FulfillmentOrder < Response
      xml_name "FulfillmentOrder"

      xml_reader :seller_fulfillment_order_id
      xml_reader :displayable_order_id
      xml_reader :displayable_order_date_time, :as => DateTime
      xml_reader :displayable_order_comment
      xml_reader :shipping_speed_category
      xml_reader :destination_address, :as => FulfillmentAddress
      xml_reader :fulfillment_policy
      xml_reader :fulfillment_method
      xml_reader :received_date_time, :as => DateTime
      xml_reader :fulfillment_order_status
      xml_reader :statusupdated_date_time, :as => DateTime
      xml_reader :notification_email_list, :from => "member", :as => [], :in => "xmlns:NotificationEmailList"

    end

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

    class FulfillmentShipmentItem < Response
      xml_name 'member'

      xml_reader :seller_sku, :from => 'SellerSKU'
      xml_reader :seller_fulfillment_order_item_id
      xml_reader :quantity
      xml_reader :package_number
    end 

    class FulfillmentShipment < Response
      xml_name 'member'

      xml_reader :amazon_shipment_id
      xml_reader :fulfillment_center_id
      xml_reader :fulfillment_shipment_status
      xml_reader :shipping_date_time, :as => DateTime
      xml_reader :estimated_arrival_date_time, :as => DateTime
      xml_reader :fulfillment_shipment_items, :as => [FulfillmentShipmentItem], :in => "xmlns:FulfillmentShipmentItem", :from => "member"
      xml_reader :fulfillment_shipment_package
    end

  end 
end 
