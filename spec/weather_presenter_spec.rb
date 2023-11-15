require 'rails_helper'

RSpec.describe WeatherPresenter do
  let(:data) do
    {
      'current' => {
        'condition' => {
          'text' => current_condition,
          'icon' => 'icon_url'
        },
        'temp_c' => current_temperature
      },
      'location' => {
        'name' => 'City Name'
      }
    }
  end

  before do
    allow_any_instance_of(WeatherApiConnector).to receive(:weather_data).and_return(data)
  end

  subject { described_class.new(data) }

  describe '#encourage_text' do
    context 'when the weather is good for reading outside' do
      let(:current_condition) { 'Sunny' }
      let(:current_temperature) { 20 }

      it 'suggests reading outside' do
        expect(subject.encourage_text).to eq("Get some snacks and go read a book in a park!")
      end
    end

    context 'when the weather is not good for reading outside' do
      let(:current_condition) { 'Rainy' }
      let(:current_temperature) { 10 }

      it 'suggests reading inside' do
        expect(subject.encourage_text).to eq("It's always a good weather to read a book!")
      end
    end
  end
end
