module Amazon
  module MWS
    module Fulfillment

      def get_fulfillment_order(fulfillment_order_id)
        params = { "Action"   => "GetFulfillmentOrder", "SellerFulfillmentOrderId" => fulfillment_order_id }
        response = post(fulfillment_path,params)
        return response if params[:raw_xml]
        GetFulfillmentOrderResponse.format(response)
      end

      def list_all_fulfillment_orders(start_date_time, fulfillment_method=nil)
        params = { "Action"   => "ListAllFulfillmentOrders", "QueryStartDateTime" => start_date_time }
        params.merge!("FulfillmentMethod" => fulfillment_method) if fulfillment_method
        response = post(fulfillment_path,params)
        return response if params[:raw_xml]
        ListAllFulfillmentOrdersResponse.format(response)
      end

      def list_all_fulfillment_orders_by_next_token(token)
        params = { "Action"   => "ListAllFulfillmentOrdersByNextToken", "NextToken" => token }
        response = post(fulfillment_path,params)
        return response if params[:raw_xml]
        ListAllFulfillmentOrdersByNextTokenResponse.format(response)
      end

      def create_fulfillment_order(order_params)
        required_params = ["SellerFulfillmentOrderId", "DisplayableOrderId",'DisplayableOrderDateTime','DisplayableOrderComment','ShippingSpeedCategory', 'DestinationAddress','Items']
        raise InvalidParams.new(required_params) unless (order_params.keys - required_params).empty?
        params = { "Action"   => "CreateFulfillmentOrder"}.merge(order_params)
        response = post(fulfillment_path,params)
        return response if params[:raw_xml]
        CreateFulfillmentOrderResponse.format(response)
      end 

      def cancel_fulfillment_order(order_id)
        params = { "Action"   => "CancelFulfillmentOrder", "SellerFulfillmentOrderId" => order_id }
        response = post(fulfillment_path,params)
        return response if params[:raw_xml]
        CancelFulfillmentOrderResponse.format(response)
      end 

      private
      def fulfillment_path
        "/FulfillmentOutboundShipment/#{Authentication::FULFILLMENT_VERSION}"
      end

    end 
  end 
end 
