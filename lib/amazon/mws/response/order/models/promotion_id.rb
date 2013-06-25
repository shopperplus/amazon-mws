module Amazon
  module MWS

    class PromotionId < Response
      xml_name "PromotionId"
      xml_reader :promotion_id
    end
  end 
end 
