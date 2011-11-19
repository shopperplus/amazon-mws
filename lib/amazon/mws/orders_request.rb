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

      xml_reader :amount, :in => :order_total, :as => Float
      xml_reader :currency_code, :in => :order_total
            
			xml_reader :address_line_1, :in => :shipping_address
			xml_reader :address_line_2, :in => :shipping_address
			xml_reader :address_line_3, :in => :shipping_address
			xml_reader :city, :in => :shipping_address
			xml_reader :county, :in => :shipping_address
			xml_reader :district, :in => :shipping_address
			xml_reader :state_or_region, :in => :shipping_address
			xml_reader :postal_code, :in => :shipping_address
			xml_reader :country_code, :in => :shipping_address
			xml_reader :phone, :in => :shipping_address

      xml_reader :number_of_items_shipped, :as => Integer
      xml_reader :number_of_items_unshipped, :as => Integer
			xml_reader :marketplace_id
			xml_reader :buyer_name
			xml_reader :buyer_email
			xml_reader :ship_service_level_category

    end 
  end
end

