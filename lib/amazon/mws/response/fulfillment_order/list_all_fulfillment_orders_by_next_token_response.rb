require_relative 'base'

module Amazon
  module MWS

    class ListAllFulfillmentOrdersByNextTokenResponse < Response
      xml_name 'ListAllFulfillmentOrdersByNextTokenResponse'
      result = 'ListAllFulfillmentOrdersByNextTokenResult'
      namespace = 'xmlns:'

      xml_reader :next_token
      xml_reader :request_id, :in => "ResponseMetadata"
      xml_reader :fulfillment_orders, :as => [ FulfillmentOrder ], :in => 'xmlns:ListAllFulfillmentOrdersByNextTokenResult/xmlns:FulfillmentOrders', :from => "member"
    end 
  end 
end 
