# frozen_string_literal: true

require 'ox'
require 'date'

module TeamMakerIntegrations
  module PurelyHR
    class TimeOffRequestsParser
      ROOT_TAG = 'DataService'
      ENCODING = 'UTF-8'

      def initialize(xml)
        @xml = xml
        @current_node = nil
      end

      def time_offs
        Ox.default_options = { encoding: ENCODING }
        xml = Ox.parse(@xml)
        root = xml&.nodes&.first

        raise TeamMakerIntegrations::InvalidXmlError if root.nil? || root.value != ROOT_TAG

        root.nodes&.map(&method(:build_time_off))
      rescue Ox::ParseError
        raise TeamMakerIntegrations::InvalidXmlError
      end

      private

      #  rubocop:disable Metrics/MethodLength
      #  rubocop:disable Metrics/AbcSize
      def build_time_off(node)
        @current_node = node
        instance = Models::TimeOffRequest.new(@current_node.ID, @current_node.Status)

        instance.from_hash(
          date: to_date(node_text('TimeOffDate')),
          start_time: to_time(node_text('TimeStart')),
          end_time: to_time(node_text('TimeEnd')),
          hours: node_text('TimeOffHours'),
          type: node_text('TimeOffTypeName'),
          login_id: node_text('LoginID'),
          first_name: node_text('Firstname'),
          last_name: node_text('Lastname'),
          user_category: node_text('UserCategory'),
          submitted_at: Date.parse(node_text('SubmittedDate')),
          deducted: true?(node_text('Deducted')),
          comment: node_text('Comment')
        )
      end
      #  rubocop:enable Metrics/AbcSize
      #  rubocop:enable Metrics/MethodLength

      def node_text(key)
        @current_node.send(key).text&.encode(ENCODING) unless @current_node.locate(key).empty?
      end

      def to_date(date_str)
        date_str ? Date.parse(date_str) : nil
      end

      def to_time(time_str)
        time_str ? DateTime.parse(time_str) : nil
      end

      def true?(obj)
        obj.to_s.casecmp('yes').zero?
      end
    end
  end
end
