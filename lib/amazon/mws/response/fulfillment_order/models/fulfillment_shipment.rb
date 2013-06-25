require_relative 'fulfillment_shipment_item'
module Amazon
  module MWS

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
