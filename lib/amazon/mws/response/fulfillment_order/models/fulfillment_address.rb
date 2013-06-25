module Amazon
  module MWS

    class FulfillmentAddress < Response
      xml_reader :name
      xml_reader :line1
      xml_reader :line2
      xml_reader :line3
      xml_reader :district_or_county
      xml_reader :city
      xml_reader :state_or_province_code
      xml_reader :country_code
      xml_reader :postal_code
      xml_reader :phone_number
    end 

  end 
end 
