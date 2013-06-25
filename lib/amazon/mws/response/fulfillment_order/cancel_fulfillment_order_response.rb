module Amazon
  module MWS

    class CancelFulfillmentOrderResponse < Response
      xml_name 'CancelFulfillmentOrderResponse'
      namespace = 'xmlns:'

      xml_reader :request_id, :in => "ResponseMetadata"
    end 
  end 
end 
