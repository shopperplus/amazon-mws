require_relative 'models/product'

module Amazon
  module MWS

    class GetMatchingProductResponse < Response
      xml_name "GetMatchingProductResponse"
      namespace = "xmlns:"

      xml_reader :product, :as => [ProductRequest], :in => namespace + "GetMatchingProductResult/"
    end

    class GetMatchingProductForIdResult < Response
      xml_name "GetMatchingProductForIdResult"
      namespace = "xmlns:"

      xml_reader :products, :as => [ProductRequest], :in => namespace + "Products"

    end


    class GetMatchingProductForIdResponse < Response
      xml_name "GetMatchingProductForIdResponse"
      namespace = "xmlns:"

      xml_reader :results, :as => [GetMatchingProductForIdResult]
      xml_reader :products, :as => [ProductRequest], :in => namespace + "GetMatchingProductForIdResult/" + namespace + "Products"

    end
  end
end
