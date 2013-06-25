require_relative 'base'

module Amazon
  module MWS

    class GetFulfillmentOrderResponse < Response
      xml_name 'GetFulfillmentOrderResponse'
      result = 'GetFulfillmentOrderResult'
      namespace = 'xmlns:'

      xml_reader :request_id, :in => "ResponseMetadata"
      xml_reader :fulfillment_order, :as => FulfillmentOrder, :in => result
      xml_reader :fulfillment_order_items, :as => [FulFillmentOrderItem], :in => namespace + result + "/" + namespace + "FulfillmentOrderItem", :from => "member"
      xml_reader :fulfillment_shipments, :as => [FulfillmentShipment], :in => namespace + result + "/" + namespace + "FulfillmentShipment", :from => "member"
    end 
  end 
end 
