module Publishers
  class LoanBookPublisher

    attr_reader :message, :routing_key

    def initialize(message, routing_key)
      @message = message
      @routing_key = routing_key
    end

    def publish
      ::Publishers::Application.new(
        routing_key: routing_key,
        exchange_name: 'basic_app',
        message: message
      ).perform
    end
  end
end
