module Amazon
  module MWS

    class RequestOrderItemsResponse < Response
      xml_name "ListOrderItemsResponse"
      result = "ListOrderItemsResult"
       xml_reader :next_token, :in => result
       xml_reader :amazon_order_id, :in=> result
       xml_reader :order_items, :as => [OrderItemsRequest], :in => "xmlns:ListOrderItemsResult/xmlns:OrderItems"
      xml_reader :request_id, :in => "ResponseMetadata"
    end

    class RequestOrderItemsByNextTokenResponse < Response
      xml_name "ListOrderItemsByNextTokenResponse"
      result = "ListOrderItemsByNextTokenResult"
       xml_reader :next_token, :in => result
       xml_reader :amazon_order_id, :in=> result
       xml_reader :order_items, :as => [OrderItemsRequest], :in => "xmlns:ListOrderItemsByNextTokenResult/xmlns:OrderItems"
      xml_reader :request_id, :in => "ResponseMetadata"
    end

  end
end
