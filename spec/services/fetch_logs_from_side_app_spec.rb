require 'rails_helper'

RSpec.describe FetchLogsFromSideApp do
  describe '#get_logs' do
    it 'calls to side app API and fetches logs' do
      response = instance_double(Net::HTTPOK, body: '{"logs":["book_loaned"]}')

      expect(Net::HTTP).to receive(:get_response).with(URI('http://localhost:3001/api/logs')) { response }

      expect(FetchLogsFromSideApp.get_logs).to eq({ 'logs' => ['book_loaned'] })
    end
  end
end
