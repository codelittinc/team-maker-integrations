# frozen_string_literal: true

module TeamMakerIntegrations
  module PurelyHR
    module Models
      class TimeOffRequest
        attr_accessor :id, :status, :date, :start_time, :end_time, :hours, :type, :login_id, :first_name,
                      :last_name, :user_category, :submitted_at, :deducted, :comment

        def initialize(id, status)
          @id = id
          @status = status
        end

        def from_hash(hash)
          hash.each { |k, v| public_send("#{k}=", v) }
          self
        end
      end
    end
  end
end
