module Amazon
  module MWS

		class PromotionId < Response
			xml_name "PromotionId"
			xml_reader :promotion_id
		end
    
    class OrderItemsRequest < Response
      
      xml_name "OrderItem"
      
      xml_reader :asin, :from => "ASIN"
      xml_reader :id, :from => "OrderItemId"
      xml_reader :seller_sku, :from => "SellerSKU"
      xml_reader :title
      xml_reader :quantity_ordered, :as => Integer
      xml_reader :quantity_shipped, :as => Integer
      
      xml_reader :item_price, :from => :amount, :in => :item_price, :as => Float
      xml_reader :item_price_currency, :from => :currency_code, :in => :item_price
      
      xml_reader :shipping_price, :from => :amount, :in => :shipping_price, :as => Float
      xml_reader :shipping_price_currency, :from => :currency_code, :in => :shipping_price
            
      xml_reader :gift_price, :from => :amount, :in => :gift_wrap_price, :as => Float
      xml_reader :gift_price_currency, :from => :currency_code, :in => :gift_wrap_price
      
      xml_reader :item_tax, :from => :amount, :in => :item_tax, :as => Float
      xml_reader :item_tax_currency, :from => :currency_code, :in => :item_tax
      
      xml_reader :shipping_tax, :from => :amount, :in => :shipping_tax, :as => Float
      xml_reader :shipping_tax_currency, :from => :currency_code, :in => :shipping_tax      

      xml_reader :gift_tax, :from => :amount, :in => :gift_wrap_tax, :as => Float
      xml_reader :gift_tax_currency, :from => :currency_code, :in => :gift_wrap_tax

      xml_reader :shipping_discount, :from => :amount, :in => :shipping_discount, :as => Float
      xml_reader :shipping_discount_currency, :from => :currency_code, :in => :shipping_discount

      xml_reader :promotion_discount, :from => :amount, :in => :promotion_discount, :as => Float
      xml_reader :promotion_discount_currency, :from => :currency_code, :in => :promotion_discount
      
      xml_reader :gift_wrap_level
      xml_reader :gift_message_text
           
      xml_reader :promotion_ids, :as => [PromotionId], :in => "xmlns:OrderItem/xmlns:PromotionIds"

    end 
  end
end

