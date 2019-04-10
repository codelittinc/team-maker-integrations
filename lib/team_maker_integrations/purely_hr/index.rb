require 'date'
require 'team_maker_integrations/purely_hr/urls_builder'

module TeamMakerIntegrations
  class PurelyHR
    def initialize(start_date, end_date)
      @urls_builder = PurelyHR::UrlsBuilder.new(start_date, end_date)
    end

    def timeoff_requests_url
      @urls_builder.timeoff_requests
    end
  end
end
