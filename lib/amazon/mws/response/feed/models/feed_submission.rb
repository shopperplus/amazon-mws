module Amazon
  module MWS

    class FeedSubmission < Response
      xml_name "FeedSubmissionInfo"

      xml_reader :id, :from => "FeedSubmissionId"
      xml_reader :feed_type
      xml_reader :submitted_date, :as => Time
      xml_reader :started_processing_date, :as => Time
      xml_reader :completed_processing_date, :as => Time      
      xml_reader :feed_processing_status
    end

  end
end
