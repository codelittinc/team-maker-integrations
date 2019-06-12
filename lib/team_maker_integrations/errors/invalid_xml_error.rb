# frozen_string_literal: true

module TeamMakerIntegrations
  class InvalidXmlError < StandardError
    def initialize(msg = 'The given XML data is invalid')
      super
    end
  end
end
