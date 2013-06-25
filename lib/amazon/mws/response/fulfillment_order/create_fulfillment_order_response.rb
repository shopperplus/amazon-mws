module Amazon
  module MWS

    class CreateFulfillmentOrderResponse < Response
      xml_name 'CreateFulfillmentOrderResponse'
      namespace = 'xmlns:'

      xml_reader :request_id, :in => "ResponseMetadata"
    end 
  end 
end 

