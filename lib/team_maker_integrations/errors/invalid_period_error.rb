module TeamMakerIntegrations
  class InvalidPeriodError < ArgumentError
    def initialize(msg = 'The start date should be smaller than the end date')
      super
    end
  end
end
