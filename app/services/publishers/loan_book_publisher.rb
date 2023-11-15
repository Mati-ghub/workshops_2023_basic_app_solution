module Publishers
  class LoanBookPublisher

    attr_reader :message

    def initialize(message)
      @message = message
    end

    def publish
      ::Publishers::Application.new(
        routing_key: 'book_loans',
        exchange_name: 'basic_app',
        message: message
      ).perform
    end
  end
end
