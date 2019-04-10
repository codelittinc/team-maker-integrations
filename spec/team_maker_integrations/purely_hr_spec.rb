require 'team_maker_integrations/errors/invalid_period_error'

RSpec.describe TeamMakerIntegrations::PurelyHR do
  describe '#initialize' do
    context 'when the start date is bigger than the end date' do
      it 'throws an exception' do
        start_date = Date.parse('05/05/2019')
        end_date = Date.parse('04/04/2019')

        expect do
          described_class.new(start_date, end_date)
        end.to raise_error(InvalidPeriodError)
      end
    end
  end
end
