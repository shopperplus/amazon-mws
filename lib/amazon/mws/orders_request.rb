module Amazon
  module MWS
    
    class OrdersRequest < Response
      
      xml_name "Order"
      
      xml_reader :amazon_order_id
      xml_reader :seller_order_id
      xml_reader :purchase_date, :as => DateTime
      xml_reader :last_update_date, :as => DateTime
			xml_reader :order_status
			xml_reader :fulfillment_channel
			xml_reader :sales_channel
			xml_reader :order_channel
			xml_reader :ship_service_level

      xml_reader :amount, :in => "xmlns:OrderTotal", :as => Float
      xml_reader :currency_code, :in => "xmlns:OrderTotal"
            
			xml_reader :address_line_1, :in => "xmlns:ShippingAddress"
			xml_reader :address_line_2, :in => "xmlns:ShippingAddress"
			xml_reader :address_line_3, :in => "xmlns:ShippingAddress"
			xml_reader :city, :in => "xmlns:ShippingAddress"
			xml_reader :county, :in => "xmlns:ShippingAddress"
			xml_reader :district, :in => "xmlns:ShippingAddress"
			xml_reader :state_or_region, :in => "xmlns:ShippingAddress"
			xml_reader :postal_code, :in => "xmlns:ShippingAddress"
			xml_reader :country_code, :in => "xmlns:ShippingAddress"
			xml_reader :phone, :in => "xmlns:ShippingAddress"

      xml_reader :number_of_items_shipped, :as => Integer
      xml_reader :number_of_items_unshipped, :as => Integer
			xml_reader :marketplace_id
			xml_reader :buyer_name
			xml_reader :buyer_email
			xml_reader :ship_service_level_category

    end 
  end
end

