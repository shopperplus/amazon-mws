require_relative 'base'

module Amazon
  module MWS

    class ListAllFulfillmentOrdersResponse < Response
      xml_name 'ListAllFulfillmentOrdersResponse'
      result = 'ListAllFulfillmentOrdersResult'
      namespace = 'xmlns:'

      xml_reader :request_id, :in => "ResponseMetadata"
      xml_reader :fulfillment_orders, :as => [ FulfillmentOrder ], :in => 'xmlns:ListAllFulfillmentOrdersResult/xmlns:FulfillmentOrders', :from => "member"
    end 
  end 
end 
