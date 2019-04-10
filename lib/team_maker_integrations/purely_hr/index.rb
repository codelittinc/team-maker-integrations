require 'date'
require 'team_maker_integrations/errors/invalid_period_error'

module TeamMakerIntegrations
  class PurelyHR
    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date

      raise InvalidPeriodError if start_date > end_date
    end

    def url
      base_url = 'https://data.purelyhr.com/xml/'
      url_with_key = "#{base_url}?ak=#{ENV['PURELY_HR_KEY']}"
      start_date = @start_date.strftime('%Y/%m/%d')
      end_date = @end_date.strftime('%Y/%m/%d')
      "#{url_with_key}&sDate=#{start_date}&eDate=#{end_date}"
    end
  end
end
