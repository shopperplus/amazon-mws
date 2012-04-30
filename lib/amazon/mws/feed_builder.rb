require 'set'

module Amazon
  module MWS

    class FeedBuilder
      attr_accessor :xml

      def initialize(message_type, messages = [], params = {})
        @xml = Builder::XmlMarkup.new
        @message_type = message_type
        @messages = messages
        @params = params
        @merchant_id = params[:merchant_id]
      end

      def render
        @xml.instruct!
        @xml.AmazonEnvelope("xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance", "xsi:noNamespaceSchemaLocation"=>"amzn-envelope.xsd") do
          render_header
          
          envelope_params = { :message_type => @message_type }
          envelope_params.merge!({:purge => @params[:purge]}) if Feed::Enumerations::PRODUCT_MESSAGE_TYPES.include?(@message_type) && @params[:purge]==true
          render_envelope(envelope_params)
          
          if !@messages.nil?
            @messages.flatten.each_with_index do |message,i|
              message = {'MessageID'=>i+1}.merge(message) if message[:MessageID].nil?
              render_message(message, @params)
            end
          end
        end
      end

      def render_header
        @xml.Header do
          @xml.DocumentVersion "1.01"
          @xml.MerchantIdentifier @merchant_id
        end
      end

      def render_envelope(params = {})
        #@xml.EffectiveDate Time.now
        @xml.MessageType(params[:message_type].to_s)
        @xml.PurgeAndReplace(params[:purge] || false)
      end

      def render_message(message, params = {})
        if (message.is_a?(Hash) || message.is_a?(YAML::Omap))
          @xml.Message do |xml|
            build_xml(message, xml)
          end
        else
          raise "Unknown type for: #{message.inspect}"
        end
      end

      def build_xml(hash, xml)
        hash.each {|key, value|
          case value
            when Hash  then xml.tag!(key) {|xml| build_xml(value, xml) }
            when YAML::Omap  then xml.tag!(key) {|xml| build_xml(value, xml) }
            when Array then 
              case value.first
                when Hash then xml.tag!(key) {|xml| value.each {|v| build_xml(v, xml) } }
                else value.each { |v| xml.tag!(key, v) } # accept array of non-hashes and create a <key>value_x</key> for each
              end
            else xml.tag!(key, value)
          end
        }
      end
    end
  end
end
