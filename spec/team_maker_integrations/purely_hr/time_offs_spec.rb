# frozen_string_literal: true

RSpec.describe TeamMakerIntegrations::PurelyHR::TimeOffs do
  around do |example|
    ClimateControl.modify PURELY_HR_KEY: 'TOP_SECRET' do
      example.run
    end
  end

  context 'with invalid dates' do
    let(:start_date) { Date.parse('01 May 2019') }
    let(:end_date) { Date.parse('01 Jan 2019') }

    it 'raises an InvalidPeriodError' do
      expect { described_class.new(start_date, end_date) }.to raise_error(TeamMakerIntegrations::InvalidPeriodError)
    end
  end

  describe '#search' do
    context 'with valid dates' do
      let(:instance) do
        start_date = Date.parse('01 Jan 2019')
        end_date = Date.parse('01 May 2019')
        described_class.new(start_date, end_date)
      end

      it 'finds the time off requests' do
        VCR.use_cassette('times_off') do
          time_off_requests = instance.search
          expect(time_off_requests.length).to eq 191
        end
      end
    end
  end
end
