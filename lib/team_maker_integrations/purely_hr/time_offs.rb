# frozen_string_literal: true

require 'date'

module TeamMakerIntegrations
  module PurelyHR
    class TimeOffs
      def initialize(start_date, end_date)
        @urls_builder = UrlsBuilder.new(start_date, end_date)
      end

      def search
        response = Request.get(@urls_builder.timeoff_requests)
        parser = TimeOffRequestsParser.new response
        parser.time_offs
      end
    end
  end
end
