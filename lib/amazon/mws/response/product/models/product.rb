module Amazon
  module MWS

    class ProductRequest < Response

      xml_name "Product"

      xml_namespaces \
        :xmlns => "http://mws.amazonservices.com/schema/Products/2011-10-01",
        "xmlns2:ns2"   => "http://mws.amazonservices.com/schema/Products/2011-10-01/default.xsd"

      xml_reader :asin, :in => "xmlns:Identifiers/xmlns:MarketplaceASIN", :from => "ASIN"
      xml_reader :binding, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :title, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :studio, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :brand, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :color, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :features, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2", :as => [], :from => "Feature"
      xml_reader :label, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :manufacturer, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :package_quantity, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :product_group, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :product_type_name, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :publisher, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :size, :in => "xmlns:AttributeSets/ns2:ItemAttributes", :namespace => "ns2"
      xml_reader :small_img_uri, :in => "xmlns:AttributeSets/ns2:ItemAttributes/ns2:SmallImage", :namespace => "ns2", :from => "URL"

      xml_reader :list_price, :in => "xmlns:AttributesSets/ns2:ItemAttributes/ns2:ListPrice", :namespace => "ns2", :from => "Amount"
      xml_reader :list_price_currency_code, :in => "xmlns:AttributesSets/ns2:ItemAttributes/ns2:ListPrice", :namespace => "ns2", :from => "CurrencyCode"

    end
  end
end

