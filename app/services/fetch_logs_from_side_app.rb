require 'net/http'
require 'json'

class FetchLogsFromSideApp
  BASE_URI = 'http://localhost:3001/api/logs'

  def self.get_logs
    uri = URI(BASE_URI)
    response = Net::HTTP.get_response(uri)

    JSON.parse(response.body)
  end
end
