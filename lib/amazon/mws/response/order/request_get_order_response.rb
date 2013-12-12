require_relative 'models/order'
module Amazon
  module MWS

    class RequestGetOrderResponse < Response
      xml_name "GetOrderResponse"
      result = "GetOrderResult"
      namespace = "xmlns:"

       xml_reader :request_id, :in => "ResponseMetadata"
       xml_reader :orders, :as => [Order], :in => namespace + result + "/" + namespace + "Orders"
    end
    
  end
end
