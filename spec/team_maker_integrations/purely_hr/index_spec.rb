# frozen_string_literal: true

require 'climate_control'

RSpec.describe TeamMakerIntegrations::PurelyHR do
  around do |example|
    ClimateControl.modify PURELY_HR_KEY: 'TOP_SECRET' do
      example.run
    end
  end

  describe '#times_off' do
    let(:instance) do
      start_date = Date.parse('01 Jan 2019')
      end_date = Date.parse('01 May 2019')
      described_class.new(start_date, end_date)
    end

    context 'with valid dates' do
      it 'returns the xml content' do
        VCR.use_cassette('times_off') do
          content = instance.times_off
          expect(content).not_to be ''
        end
      end
    end
  end
end
