require_relative 'promotion_id'
module Amazon
  module MWS

    class OrderItem < Response

      xml_name "OrderItem"

      xml_reader :asin, :from => "ASIN"
      xml_reader :amazon_order_item_id, :from => "OrderItemId"
      xml_reader :seller_sku, :from => "SellerSKU"
      xml_reader :title
      xml_reader :quantity_ordered, :as => Integer
      xml_reader :quantity_shipped, :as => Integer

      xml_reader :item_price, :from => :amount, :in => "xmlns:ItemPrice", :as => Float
      xml_reader :item_price_currency, :from => :currency_code, :in => "xmlns:ItemPrice"

      xml_reader :shipping_price, :from => :amount, :in => "xmlns:ShippingPrice", :as => Float
      xml_reader :shipping_price_currency, :from => :currency_code, :in => "xmlns:ShippingPrice"

      xml_reader :gift_price, :from => :amount, :in => "xmlns:GiftWrapPrice", :as => Float
      xml_reader :gift_price_currency, :from => :currency_code, :in => "xmlns:GiftWrapPrice"

      xml_reader :item_tax, :from => :amount, :in => "xmlns:ItemTax", :as => Float
      xml_reader :item_tax_currency, :from => :currency_code, :in => "xmlns:ItemTax"

      xml_reader :shipping_tax, :from => :amount, :in => "xmlns:ShippingTax", :as => Float
      xml_reader :shipping_tax_currency, :from => :currency_code, :in => "xmlns:ShippingTax"

      xml_reader :gift_tax, :from => :amount, :in => "xmlns:GiftWrapTax", :as => Float
      xml_reader :gift_tax_currency, :from => :currency_code, :in => "xmlns:GiftWrapTax"

      xml_reader :shipping_discount, :from => :amount, :in => "xmlns:ShippingDiscount", :as => Float
      xml_reader :shipping_discount_currency, :from => :currency_code, :in => "xmlns:ShippingDiscount"

      xml_reader :promotion_discount, :from => :amount, :in => "xmlns:PromotionDiscount", :as => Float
      xml_reader :promotion_discount_currency, :from => :currency_code, :in => "xmlns:PromotionDiscount"

      xml_reader :gift_wrap_level
      xml_reader :gift_message_text

      xml_reader :promotion_ids, :as => [PromotionId], :in => "xmlns:PromotionIds"

    end
  end
end

