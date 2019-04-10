require 'date'
require 'team_maker_integrations/errors/invalid_period_error'

module TeamMakerIntegrations
  class PurelyHR
    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date

      raise InvalidPeriodError if start_date > end_date
    end

    def timeoff_requests; end
  end
end
