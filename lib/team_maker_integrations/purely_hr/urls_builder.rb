# frozen_string_literal: true

require 'date'

module TeamMakerIntegrations
  module PurelyHR
    class UrlsBuilder
      BASE_URL = 'https://data.purelyhr.com'

      def initialize(start_date, end_date)
        @start_date = start_date
        @end_date = end_date

        raise TeamMakerIntegrations::InvalidPeriodError if start_date > end_date
      end

      def timeoff_requests
        base_url = "#{BASE_URL}/xml/"
        start_date = parse_date(@start_date)
        end_date = parse_date(@end_date)
        "#{url_with_key(base_url)}&sDate=#{start_date}&eDate=#{end_date}"
      end

      private

      def parse_date(date)
        date.strftime('%m/%d/%Y')
      end

      def url_with_key(url)
        "#{url}?ak=#{ENV['PURELY_HR_KEY']}"
      end
    end
  end
end
