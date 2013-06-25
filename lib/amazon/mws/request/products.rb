module Amazon
  module MWS
    module Products

      def get_matching_product(asins, params={})
        query_params = { "Action" => "GetMatchingProduct" }
        query_params["MarketplaceId"] = params[:marketplace] || @connection.marketplace_id
        asins.each_with_index{|id,i| query_params.merge!({"ASINList.ASIN.#{i+1}" => id})}

        response = post(product_path, query_params)
        
        return response if params[:raw_xml]

        GetMatchingProductResponse.format(response)
      end

      def get_matching_product_for_id(id_type, ids, params={})
        query_params = { "Action" => "GetMatchingProductForId" }
        query_params["MarketplaceId"] = params[:marketplace] || @connection.marketplace_id
        query_params["IdType"] = id_type
        ids.each_with_index{|id,i| query_params.merge!({"IdList.Id.#{i+1}" => id})}

        response = post(product_path, query_params)
        
        return response if params[:raw_xml]

        GetMatchingProductForIdResponse.format(response)
      end

      private
      def product_path
        "/Products/#{Authentication::PRODUCTS_VERSION}"
      end


    end
  end
end
