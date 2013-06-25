module Amazon
  module MWS

    # Abstract super class of all Amazon::MWS exceptions
    class MWSException < StandardError
    end

    # Abstract super class for all invalid options.
    class InvalidOption < MWSException
    end

    class InvalidMessageType < MWSException
    end

    class InvalidReportType < MWSException
    end

    class InvalidSchedule < MWSException
    end

    class MissingConnectionOptions < MWSException
    end

    # Raised if an unrecognized option is passed when establishing a connection.
    class InvalidConnectionOption < InvalidOption
      def initialize(invalid_options)
        message = "The following connection options are invalid: #{invalid_options.join(', ')}. "    +
        "The valid connection options are: #{Connection::Options::VALID_OPTIONS.join(', ')}."
        super(message)
      end
    end

    # Raised if either the access key id or secret access key arguments are missing when establishing a connection.
    class MissingAccessKey < InvalidOption
      def initialize(missing_keys)
        key_list = missing_keys.map {|key| key.to_s}.join(' and the ')
        super("You did not provide both required access keys. Please provide the #{key_list}.")
      end
    end

    # Raised if a request is attempted before any connections have been established.
    class NoConnectionEstablished < MWSException
      def initialize
        super("\nPlease use Amazon::MWS::Base.establish_connection! before making API calls.")
      end
    end

    class InvalidParams < MWSException
      def initialize(params)
        super("\nInvalid Params For The Request! Please Pass Correct Params #{params.inspect} to Build The Request.")
      end
    end 

  end
end
