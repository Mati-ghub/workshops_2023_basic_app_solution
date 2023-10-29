require 'bunny'

module Publishers
  class Application
    def initialize(routing_key:, exchange_name:, message:)
      @routing_key = routing_key
      @exchange_name = exchange_name
      @message = message
    end

    def perform
      connection.start

      channel = connection.create_channel
      exchange = channel.direct(@exchange_name)
      exchange.publish(@message.to_json, routing_key: @routing_key)

      connection.close
      true
    end

    private

    def connection_options
      {
        host: "localhost",
        port: 5672,
        vhost: "/",
        username: "guest",
        password: "guest"
      }
    end

    def connection
      @connection ||= Bunny.new(connection_options)
    end
  end
end
