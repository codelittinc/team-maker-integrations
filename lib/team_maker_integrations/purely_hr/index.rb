# frozen_string_literal: true

require 'date'
require 'team_maker_integrations/purely_hr/urls_builder'

module TeamMakerIntegrations
  class PurelyHR
    def initialize(start_date, end_date)
      @urls_builder = PurelyHR::UrlsBuilder.new(start_date, end_date)
    end

    def times_off
      TeamMakerIntegrations::Request.get timeoff_requests_url
    end

    def timeoff_requests_url
      @urls_builder.timeoff_requests
    end
  end
end
