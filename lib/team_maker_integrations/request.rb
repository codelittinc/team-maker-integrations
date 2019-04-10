require 'net/http'

module TeamMakerIntegrations
  class Request
    def self.get(url, use_ssl = true)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = use_ssl
      request = Net::HTTP::Get.new(uri.request_uri)
      http.request(request).body
    end
  end
end
