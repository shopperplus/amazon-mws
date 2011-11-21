module Amazon
  module MWS
    
    class RequestOrdersResponse < Response
      xml_name "ListOrdersResponse"
      result = "ListOrdersResult"
      namespace = "xmlns:"

		 	xml_reader :next_token, :in => result
		 	xml_reader :last_updated_before, :in => result, :as => DateTime
      xml_reader :request_id, :in => "ResponseMetadata"
		 	xml_reader :orders, :as => [OrdersRequest], :in => namespace + result + "/" + namespace + "Orders"
    end
    
    class RequestOrdersByNextTokenResponse < Response
      xml_name "ListOrdersByNextTokenResponse"
      result = "ListOrdersByNextTokenResult"
      namespace = "xmlns:"

		 	xml_reader :next_token, :in => result		 	
		 	xml_reader :last_updated_before, :in => result, :as => DateTime
      xml_reader :request_id, :in => "ResponseMetadata"
		 	xml_reader :orders, :as => [OrdersRequest], :in => namespace + result + "/" + namespace + "Orders"
    end
    
  end
end
