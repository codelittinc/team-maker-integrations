# frozen_string_literal: true

module TeamMakerIntegrations
  require 'team_maker_integrations/request'
  require 'team_maker_integrations/version'
  require 'team_maker_integrations/errors/invalid_period_error'
  require 'team_maker_integrations/errors/invalid_xml_error'

  require 'team_maker_integrations/purely_hr/models/time_off_request'
  require 'team_maker_integrations/purely_hr/time_off_requests_parser'
  require 'team_maker_integrations/purely_hr/urls_builder'
  require 'team_maker_integrations/purely_hr/time_offs'
end
