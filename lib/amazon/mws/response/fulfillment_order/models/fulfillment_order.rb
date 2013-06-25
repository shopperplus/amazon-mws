require_relative 'fulfillment_address'

module Amazon
  module MWS

    class FulfillmentOrder < Response
      xml_name "FulfillmentOrder"

      xml_reader :seller_fulfillment_order_id
      xml_reader :displayable_order_id
      xml_reader :displayable_order_date_time, :as => DateTime
      xml_reader :displayable_order_comment
      xml_reader :shipping_speed_category
      xml_reader :destination_address, :as => FulfillmentAddress
      xml_reader :fulfillment_policy
      xml_reader :fulfillment_method
      xml_reader :received_date_time, :as => DateTime
      xml_reader :fulfillment_order_status
      xml_reader :statusupdated_date_time, :as => DateTime
      xml_reader :notification_email_list, :from => "member", :as => [], :in => "xmlns:NotificationEmailList"
    end

  end 
end 
