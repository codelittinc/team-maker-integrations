# frozen_string_literal: true

RSpec.describe TeamMakerIntegrations::PurelyHR::UrlsBuilder do
  describe '#initialize' do
    context 'when the start date is bigger than the end date' do
      it 'throws an exception' do
        start_date = Date.parse('05/05/2019')
        end_date = Date.parse('04/04/2019')

        expect do
          described_class.new(start_date, end_date)
        end.to raise_error(TeamMakerIntegrations::InvalidPeriodError)
      end
    end
  end

  describe '#timeoff_requests' do
    let(:instance) do
      start_date = Date.parse('01 Jan 2019')
      end_date = Date.parse('01 May 2019')
      described_class.new(start_date, end_date)
    end

    context 'when the environment variable is set' do
      it 'returns a valid url' do
        purelyhr_key = 'my_nice_key'
        url = "https://data.purelyhr.com/xml/?ak=#{purelyhr_key}&sDate=01/01/2019&eDate=05/01/2019"
        ClimateControl.modify PURELY_HR_KEY: purelyhr_key do
          expect(instance.timeoff_requests).to eql(url)
        end
      end
    end
  end
end
